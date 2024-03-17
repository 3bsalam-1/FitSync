const WORkOUT = require("../models/workout.model");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const AppError = require("../utils/appError");
const asyncWrapper = require("../utils/asyncWrapper");

exports.getWorkout = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  const workout = await WORkOUT.findOne({ userId });
  res.status(201).json({
    status: SUCCESS,
    data: {
      Data: workout,
    },
  });
});
exports.postWorkout = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  let curWorkout = await WORkOUT.findOne({ userId });
  const {workout} = req.body;

  if (!curWorkout) {
    curWorkout = new WORkOUT({
      userId,
      workouts: workout
    });
  } else {
    curWorkout.workouts.push(workout);
  }

  await curWorkout.save();

  res.status(201).json({
    status: SUCCESS,
  });
});