const userInfo = require('../models/userInfo.model')
const User = require('../models/user.model')
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const jwt = require("jsonwebtoken");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");


exports.createUserInfo = asyncWrapper(async(req,res,next)=>{
    let newUserInfo = await userInfo.create({...req.body,userId: req.user._id});
    let user = await User.findById(req.user._id).select('-__v');
    user.firstTime=false;
    user.save({ validateBeforeSave: false });
    newUserInfo.__v = undefined
    user = {user,userInfo: newUserInfo}
    const token = jwt.sign({...user}, process.env.JWT_SECRET, { expiresIn: "30d" });
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