const userInfo = require('../models/userInfo.model')
const User = require('../models/user.model')
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const jwt = require("jsonwebtoken");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");


exports.createUserInfo = asyncWrapper(async(req,res,next)=>{
    let newUserInfo = await userInfo.create({...req.body,userId: req.user._id});
    let user = await User.findById(req.user._id);
    user.firstTime=false;
    user.save({ validateBeforeSave: false });
    const token = jwt.sign({
         id: user._id,
         firstName: user.firstName,
         lastName: user.lastName,
         username: user.username,
         email: user.email,
         avatar: user.avatar,
         weight: newUserInfo.weight,
         height: newUserInfo.height,
         birthdate: newUserInfo.birthdate,
         gender: newUserInfo.gender,
         activityLevel: newUserInfo.activityLevel,
         systolicBP: newUserInfo.systolicBP,
         cholesterolLevel: newUserInfo.cholesterolLevel,
         bloodsugar: newUserInfo.bloodsugar,
         hypertension: newUserInfo.hypertension,
         diabetes: newUserInfo.diabetes,
         heartCondition: newUserInfo.heartCondition,
         BMR: newUserInfo.BMR,
         kneePain: newUserInfo.kneePain,  
         backPain: newUserInfo.backPain,
         firstTime: user.firstTime
     }, process.env.JWT_SECRET, { expiresIn: "30d" });
    res.status(201).json({
        status: SUCCESS,
        token,
        data:{
            userInfo : newUserInfo
        }
    });
})

exports.getUserInfo = asyncWrapper(async(req,res,next)=>{
    let user = await userInfo.find({userId: req.user._id})
    res.status(201).json({
        status: SUCCESS,
        data:{
            userInfo: user,
        }
    });
})