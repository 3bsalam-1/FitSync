const userInfo = require('../models/userInfo.model')
const asyncWrapper = require("../utils/asyncWrapper");
const AppError = require("../utils/appError");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");

exports.createUserInfo = asyncWrapper(async(req,res,next)=>{
    let newUserInfo = await userInfo.create({...req.body,userId: req.user._id});
    res.status(201).json({
        status: SUCCESS,
        data:{
            userInfo :newUserInfo
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