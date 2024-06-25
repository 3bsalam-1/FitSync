const ACTIVITY = require("../models/activity.model");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const AppError = require("../utils/appError");
const asyncWrapper = require("../utils/asyncWrapper");

exports.getWorkout = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  const workout = await ACTIVITY.findOne({ userId });
  res.status(201).json({
    status: SUCCESS,
    data: {
      Data: workout.workouts,
    },
  });
});

exports.postWorkout = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  let curWorkout = await ACTIVITY.findOne({ userId });
  let { workout } = req.body;

  if (!curWorkout) {
    curWorkout = new ACTIVITY({
      userId,
      workouts: Array.from(new Set(workout))
    });
  } else {
    for (let el of workout) {
      if (!curWorkout.workouts.includes(el)) {
        curWorkout.workouts.push(el);
      }
    }
  }
  await curWorkout.save();
  res.status(201).json({
    status: SUCCESS,
  });
});


exports.getCompleted = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  const completed = await ACTIVITY.findOne({ userId });
  res.status(201).json({
    status: SUCCESS,
    data: {
      Data: completed.completed,
    },
  });
});

exports.postCompleted = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  let curCompleted = await ACTIVITY.findOne({ userId });
  let { completed } = req.body;
  if(!curCompleted){
    curCompleted = new ACTIVITY({
      userId,
      completed
    })
  }else{
    curCompleted.completed = completed;
  }
  await curCompleted.save();
  res.status(201).json({
    status: SUCCESS,
    data: curCompleted.completed
  });
});