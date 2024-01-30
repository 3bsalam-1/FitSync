const User = require("../models/user.model");
const { promisify } = require("util");
const jwt = require("jsonwebtoken");
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const sendEmail = require("../utils/email");

const signToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: "30d" });
};

exports.loginWith = asyncWrapper(async(req,res,next)=>{
  const user = req.user;
  const token = signToken(user._id);
  res.status(200).json({
    status: SUCCESS,
    token,
  });
})

// exports.Register = asyncWrapper(async (req, res, next) => {
//   const newUser = await User.create(req.body);
//   const token = signToken(newUser._id);
//   res.status(201).json({
//     status: SUCCESS,
//     token,
//     user: newUser,
//   });
// });


exports.Register = asyncWrapper(async (req, res, next) => {
  const newUser = new User(req.body);
  newUser.code = Math.random().toString().slice(2, 8);
  newUser.codeExpires = Date.now() + 10 * 60 * 1000;
  await newUser.save();
  const token = signToken(newUser._id);
  try {
    await sendEmail({
      email: newUser.email,
      username: newUser.username,
      code: newUser.code,
      subject: "Verfiy Email",
    });
    res.status(200).json({
      status: SUCCESS,
      token,
      message: "Code sent to email! Check Your gamil account",
    });
  } catch (err) {
    newUser.code = undefined;
    newUser.codeExpires = undefined;
    await newUser.save({ validateBeforeSave: false });
    return next(
      AppError.create(
        "There was an error sending the email. try again later!",
        FAIL,
        500
      )
    );
  }
});

exports.sendCodeVerfiy = asyncWrapper(async (req, res, next) => {
  const user = await User.findById(req.user._id);
  user.code = Math.random().toString().slice(2, 8);
  user.codeExpires = Date.now() + 10 * 60 * 1000;
  await user.save({ validateBeforeSave: false });
  try {
    await sendEmail({
      email: user.email,
      username: user.username,
      code: user.code,
      subject: "Verfiy Email",
    });
    res.status(200).json({
      status: SUCCESS,
      message: "Code sent to email! Check Your gamil account",
    });
  } catch (err) {
    user.code = undefined;
    user.codeExpires = undefined;
    await user.save({ validateBeforeSave: false });
    return next(
      AppError.create(
        "There was an error sending the email. try again later!",
        FAIL,
        500
      )
    );
  }
});

exports.verfiyAccount = asyncWrapper(async (req, res, next) => {
  const { code } = req.body;
  const user = await User.findOne({
    code,
    codeExpires: { $gt: Date.now() },
  });
  if (!user) {
    return next(AppError.create("Code is invalid or has expired", ERROR, 400));
  }
  user.isVerify = true;
  user.code = undefined;
  user.codeExpires = undefined;
  await user.save({ validateBeforeSave: false });
  const token = signToken(user._id);
  res.status(200).json({
    status: SUCCESS,
    token,
    message: "Verfiy is done",
  });
});

exports.Login = asyncWrapper(async (req, res, next) => {
  const { email, password } = req.body;
  if (!email || !password) {
    return next(
      AppError.create("Please provide email and password", ERROR, 400)
    );
  }
  const user = await User.findOne({ email }).select("+password");
  if (!user.isVerify) {
    await user.deleteOne();
    return next(
      AppError.create(
        "This account not verfiy! please try register again",
        ERROR,
        401
      )
    );
  }
  if(!user.password){
    return next(AppError.create("Try login by another way",ERROR,400))
  }
  if (!user || !(await user.correctPassword(password, user.password))) {
    return next(AppError.create("Incorrect email or password", ERROR, 401));
  }
  const token = signToken(user._id);
  res.status(200).json({
    status: SUCCESS,
    token,
  });
});

exports.protectForVerfiy = asyncWrapper(async (req, res, next) => {
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    token = req.headers.authorization.split(" ")[1];
  }

  if (!token) {
    return next(AppError.create("Invalid token", ERROR, 401));
  }
  const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);

  const user = await User.findById(decoded.id);
  req.user = user;
  next();
});

exports.protect = asyncWrapper(async (req, res, next) => {
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    token = req.headers.authorization.split(" ")[1];
  }

  if (!token) {
    return next(
      AppError.create(
        "You are not logged in! please log in to get access.",
        FAIL,
        401
      )
    );
  }
  const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);

  const user = await User.findById(decoded.id);
  if (!user) {
    return next(
      AppError.create(
        "The user belonging to this token does no longer exist.",
        ERROR,
        401
      )
    );
  }
  if (!user.isVerify) {
    await user.deleteOne();
    return next(
      AppError.create(
        "This account not verfiy! please try register again",
        FAIL,
        401
      )
    );
  }
  if (user.changePasswordAfter(decoded.iat)) {
    return next(
      AppError.create(
        "User recently changed password! please log in again",
        "Error",
        401
      )
    );
  }
  req.user = user;
  next();
});

exports.forgetPassword = asyncWrapper(async (req, res, next) => {
  const user = await User.findOne({ email: req.body.email });
  if (!user) {
    return next(AppError("There is no user with email address.", ERROR, 404));
  }

  user.code = Math.random().toString().slice(2, 8);
  user.codeExpires = Date.now() + 10 * 60 * 1000;
  await user.save({ validateBeforeSave: false });

  try {
    await sendEmail({
      email: user.email,
      username: user.username,
      code: user.code,
      subject: "Reset Password",
    });
    res.status(200).json({
      status: SUCCESS,
      message: "Code sent to email! Check Your gamil account",
    });
  } catch (err) {
    user.code = undefined;
    user.codeExpires = undefined;
    await user.save({ validateBeforeSave: false });
    return next(
      AppError.create(
        "There was an error sending the email. try again later!",
        FAIL,
        500
      )
    );
  }
});

exports.codeReset = asyncWrapper(async (req, res, next) => {
  const { code } = req.body;
  const user = await User.findOne({
    code,
    codeExpires: { $gt: Date.now() },
  }).select("+passowrd");
  if (!user) {
    return next(AppError.create("Code is invalid or has expired", ERROR, 400));
  }
  const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, {
    expiresIn: "10m",
  });
  res.status(200).json({
    status: SUCCESS,
    token,
  });
});

exports.resetPassword = asyncWrapper(async (req, res, next) => {
  const user = await User.findById(req.user._id);
  user.password = req.body.password;
  user.passwordConfirm = req.body.passwordConfirm;
  user.code = undefined;
  user.codeExpires = undefined;
  user.isVerify = true;
  await user.save();
  const token = signToken(user._id);
  res.status(200).json({
    status: SUCCESS,
    token,
  });
});

exports.updatePassword = asyncWrapper(async (req, res, next) => {
  const oldPassword = req.body.oldPassword;
  const user = await User.findById(req.user._id).select("+password");
  if (!(await user.correctPassword(oldPassword, user.password))) {
    return next(
      AppError.create("Your current password is wrong.", ERROR, 401)
    );
  }
  user.password = req.body.password;
  user.passwordConfirm = req.body.passwordConfirm;
  await user.save();

  const token = signToken(user._id);
  res.status(200).json({
    status: SUCCESS,
    token,
    message:"Password updated"
  });
});

exports.changeAvater = asyncWrapper(async(req,res,next)=>{
  const user = await User.findById(req.user._id)
  user.avatar = req.file.filename;
  await user.save({ validateBeforeSave: false });
  res.status(201).json({status: SUCCESS,message: "Avatar changed done"})
})
