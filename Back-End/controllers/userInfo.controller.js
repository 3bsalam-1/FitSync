const userInfo = require("../models/userInfo.model");
const User = require("../models/user.model");
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const jwt = require("jsonwebtoken");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");

exports.createUserInfo = asyncWrapper(async (req, res, next) => {
  let UserInfo = await userInfo.findOne({ userId: req.user._id });
  if (UserInfo) {
    return next(
      new AppError("You have already created your profile", ERROR, 400)
    );
  }
  let newUserInfo = await userInfo.create({
    ...req.body,
    userId: req.user._id,
  });
  let user = await User.findById(req.user._id).select("-__v");
  user.firstTime = false;
  user.save({ validateBeforeSave: false });
  res.status(201).json({
    status: SUCCESS,
    data: {
      userInfo: newUserInfo,
    },
  });
});

exports.getUserInfo = asyncWrapper(async (req, res, next) => {
  let user = await userInfo.findOne({ userId: req.user._id });
  res.status(201).json({
    status: SUCCESS,
    data: {
      userInfo: user,
    },
  });
});

const filterObj = (obj, ...allowedFields) => {
  const newObj = {};
  Object.keys(obj).forEach((key) => {
    if (allowedFields.includes(key)) newObj[key] = obj[key];
  });
  return newObj;
};

exports.isActive = asyncWrapper(async (req, res, next) => {
  let info = await userInfo.findOne({ userId: req.user._id });
  isActive = info.isActive;
  info.isActive = !isActive;
  info.save({ validateBeforeSave: true });
  res.status(201).json({
    status: SUCCESS,
    message: "Is Active updated successfully",
  });
});

exports.updateUserInfo = asyncWrapper(async (req, res, next) => {
  const filteredObj = filterObj(
    req.body,
    "weight",
    "height",
    "birthdate",
    "BMR",
    "activityLevel"
  );
  const info = await userInfo.findOneAndUpdate(
    { userId: req.user._id },
    filteredObj,
    {
      runValidators: true,
      new: true,
    }
  );
  res.status(200).json({
    status: SUCCESS,
    message: "UserInfo updated successfully",
    data:{
        userInfo: info
    }
  });

});
