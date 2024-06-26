const User = require("../models/user.model");
const jwt = require("jsonwebtoken");
<<<<<<< HEAD

const cloudinary = require("../config/cloudinary");

=======
const cloudinary = require("../config/cloudinary");
>>>>>>> main
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const userInfo = require("../models/userInfo.model");

<<<<<<< HEAD

=======
>>>>>>> main
const signToken = async (user, res) => {
  let token;
  const cookieOptions = {
    expires: new Date(
      Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000
    ),
    secure: true,
    httpOnly: true,
<<<<<<< HEAD

=======
>>>>>>> main
  };
  if (user.firstTime) {
    token = jwt.sign(
      { id: user._id, firstTime: user.firstTime },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
    );
  } else {
<<<<<<< HEAD

=======
>>>>>>> main
    token = jwt.sign(
      { id: user._id, firstTime: user.firstTime,
        firstName: user.firstName,
        lastName: user.lastName,
        username:  user.username, 
        email: user.email,
        avatar: user.avatar.url,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: process.env.JWT_EXPIRES_IN,
      }
    );
  }
  res.cookie("jwt", token, cookieOptions);
<<<<<<< HEAD

=======
>>>>>>> main
  return token;
};

const filterObj = (obj, ...allowedFields) => {
  const newObj = {};
  Object.keys(obj).forEach((key) => {
    if (allowedFields.includes(key)) newObj[key] = obj[key];
  });
  return newObj;
};

<<<<<<< HEAD

=======
>>>>>>> main

exports.updatePassword = asyncWrapper(async (req, res, next) => {
  const oldPassword = req.body.oldPassword;
  const user = await User.findById(req.user._id).select("+password");
  if (!(await user.correctPassword(oldPassword, user.password))) {
    return next(AppError.create("Your current password is wrong.", ERROR, 401));
  }
  user.password = req.body.password;
  user.passwordConfirm = req.body.passwordConfirm;
  await user.save();

<<<<<<< HEAD
  
  const token = await signToken(user, res);


=======
  const token = await signToken(user, res);
>>>>>>> main
  res.status(200).json({
    status: SUCCESS,
    token,
    message: "Password updated",
  });
});

exports.updateMe = asyncWrapper(async (req, res, next) => {
  if (req.body.password || req.body.passwordConfirm) {
    return next(
      AppError.create(
        "You cannot update your password using this endpoint.",
        ERROR,
        400
      )
    );
  }

  const filteredObj = filterObj(req.body, "firstName", "lastName", "username");
  const user = await User.findByIdAndUpdate(req.user._id, filteredObj, {
    runValidators: true,
    new: true,
  });

  const token = await signToken(user, res);
<<<<<<< HEAD

=======
>>>>>>> main

  res.status(200).json({
    status: SUCCESS,
    message: "User updated",
    token,
    user,
  });
});

exports.changeAvatar = asyncWrapper(async (req, res, next) => {
  const { file } = req;
  if (!file) {
    return next(AppError.create("Please upload an image file", "Error", 400));
  }
  const user = await User.findById(req.user._id);
  if (user.avatar && user.avatar.public_id) {
<<<<<<< HEAD

=======
>>>>>>> main
    await cloudinary.uploader.destroy(user.avatar.public_id);
  }
  const result = await cloudinary.uploader.upload(file.path, {
    resource_type: "image",
    transformation: [{ width: 500, height: 500, crop: "limit" }],
  });
  user.avatar = {
    url: result.secure_url,
    public_id: result.public_id,
  };
  await user.save({ validateBeforeSave: false });
  const token = await signToken(user, res);
  res
    .status(201)
    .json({ status: "SUCCESS", message: "Avatar changed done", token });
});
<<<<<<< HEAD

=======
>>>>>>> main
