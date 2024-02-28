const User = require("../models/user.model");
const jwt = require("jsonwebtoken");
const firebase = require("firebase/app");
const { getStorage, ref, uploadBytes } = require("firebase/storage");
const firebaseConfig = require("../config/firebase");
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const userInfo = require("../models/userInfo.model");

const signToken = async (user) => {
  if (user.firstTime) {
    return jwt.sign(
      { id: user._id, firstTime: user.firstTime },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
    );
  } else {
    return jwt.sign({ id: user._id, user }, process.env.JWT_SECRET, {
      expiresIn: "30d",
    });
  }
};

const filterObj = (obj, ...allowedFields) => {
  const newObj = {};
  Object.keys(obj).forEach((key) => {
    if (allowedFields.includes(key)) newObj[key] = obj[key];
  });
  return newObj;
};

exports.updatePassword = asyncWrapper(async (req, res, next) => {
  const oldPassword = req.body.oldPassword;
  const user = await User.findById(req.user._id).select("+password");
  if (!(await user.correctPassword(oldPassword, user.password))) {
    return next(AppError.create("Your current password is wrong.", ERROR, 401));
  }
  user.password = req.body.password;
  user.passwordConfirm = req.body.passwordConfirm;
  await user.save();

  const token = await signToken(user);
  res.status(200).json({
    status: SUCCESS,
    token,
    message: "Password updated",
  });
});

firebase.initializeApp(firebaseConfig.firebaseConfig);
const storage = getStorage();

exports.changeAvatar = asyncWrapper(async (req, res, next) => {
  const ext = req.file.mimetype.split("/")[1];
  const fileName = `${
    req.file.originalname.split(".")[0]
  }-${Date.now()}.${ext}`;
  const storageRef = ref(storage, `Avatar/${fileName}`);
  const snapshot = await uploadBytes(storageRef, req.file.buffer);
  const user = await User.findById(req.user._id);
  user.avatar = `https://firebasestorage.googleapis.com/v0/b/${
    storageRef.bucket
  }/o/${encodeURIComponent(snapshot.metadata.fullPath)}?alt=media`;
  await user.save({ validateBeforeSave: false });
  const token = await signToken(user);
  res
    .status(201)
    .json({ status: "SUCCESS", message: "Avatar changed done", token });
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

  const token = await signToken(user);

  res.status(200).json({
    status: SUCCESS,
    message: "User updated",
    token,
    user,
  });
});
