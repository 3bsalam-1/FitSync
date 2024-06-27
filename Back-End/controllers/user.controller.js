const User = require("../models/user.model");
const jwt = require("jsonwebtoken");
const cloudinary = require("../config/cloudinary");
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const  { signToken } = require("../utils/generateToken");


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

  const token = await signToken(user, res);
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
