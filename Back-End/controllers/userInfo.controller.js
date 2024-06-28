const userInfo = require("../models/userInfo.model");
const DISEASES = require("../models/diseases.model");
const User = require("../models/user.model");
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const  { signToken } = require("../utils/generateToken");

exports.createUserInfo = asyncWrapper(async (req, res, next) => {
  let UserInfo = await userInfo.findOne({ userId: req.user._id });
  let disease = await DISEASES.findOne({ userId: req.user._id });
  if (UserInfo || disease) {
    return next(
      AppError.create("You have already created your profile", ERROR, 400)
    );
  }
  let newDisease = await DISEASES.create({
    ...req.body,
    userId: req.user._id,
  })
  let newUserInfo = await userInfo.create({
    ...req.body,
    userId: req.user._id,
    diseases: newDisease._id,
  });
  newDisease.__v=newUserInfo.__v=undefined

  let user = await User.findById(req.user._id).select("-__v");
  user.firstTime = false;
  user.save({ validateBeforeSave: false });
  const token = await signToken(user, res);
  res.status(201).json({
    status: SUCCESS,
    data: {
      userInfo: newUserInfo,
      disease: newDisease
    },
    token,
  });
});

exports.getUserInfo = asyncWrapper(async (req, res, next) => {
  let user = await userInfo.findOne({ userId: req.user._id }).populate('diseases').select('-__v -_id -userId');
  res.status(201).json({
    status: SUCCESS,
    data:user,
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
    "activityLevel",
    "systolicBP",
    "diastolicBP",
    "cholesterolLevel",
    "bloodsugar",
    "BMR"
  );
  const info = await userInfo.findOneAndUpdate(
    { userId: req.user._id },
    filteredObj,
    {
      runValidators: true,
      new: true,
    }
  );
  if (!info) {
    return next(
      AppError.create("User information not found", ERROR, 400)
    );
  }
  res.status(200).json({
    status: SUCCESS,
    message: "UserInfo updated successfully",
    data:{
        userInfo: info
    }
  });

});

exports.updateDiseases = asyncWrapper(async (req, res, next) => {
  const disease = await DISEASES.findOneAndUpdate(
    { userId: req.user._id },
    req.body,
    {
      runValidators: true,
      new: true,
    }
  );
  if (!disease) {
    return next(
      AppError.create("disease not found", ERROR, 400)
    );
  }
  res.status(200).json({
    status: SUCCESS,
    message: "Diseases updated successfully",
    data:{
      disease
    }
  });

});
