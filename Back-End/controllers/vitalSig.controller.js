const vitalsignal = require("../models/vitalSig.model");
const User = require("../models/user.model");
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");
const AppError = require("../utils/appError");
const asyncWrapper = require("../utils/asyncWrapper");

exports.getvitalsignal = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  const vitalData = await vitalsignal.findOne({ userId });
  res.status(201).json({
    status: SUCCESS,
    data: {
      Data: vitalData,
    },
  });
});
exports.postvitalsignal = asyncWrapper(async (req, res, next) => {
  const userId = req.user._id;
  let vitalData = await vitalsignal.findOne({ userId });
  const { steps, avaheartbeat, sleepHours } = req.body;

  if (!vitalData) {
    vitalData = new vitalsignal({
      userId,
      steps: [{ steps, timestamps: Date.now() }],
      sleepHours: [{ sleepHours, timestamps: Date.now() }],
      avaheartbeat: [{ avaheartbeat, timestamps: Date.now() }],
    });
  } else {
    vitalData.steps.push({ steps, timestamps: Date.now() });
    vitalData.sleepHours.push({ sleepHours, timestamps: Date.now() });
    vitalData.avaheartbeat.push({ avaheartbeat, timestamps: Date.now() });
  }

  await vitalData.save();

  res.status(201).json({
    status: SUCCESS,
  });
});

exports.postInTake = asyncWrapper(async (req, res, next) =>{
  const userId = req.user._id;
  let vitalData = await vitalsignal.findOne({ userId });
  const { inTake } = req.body;

  if (!vitalData) {
    vitalData = new vitalsignal({
      userId,
      inTake,
    });
  } else {
    vitalData.inTake += inTake;
  }

  await vitalData.save();

  res.status(201).json({
    status: SUCCESS,
  });
});

exports.postBurned = asyncWrapper(async (req, res, next) =>{
  const userId = req.user._id;
  let vitalData = await vitalsignal.findOne({ userId });
  const { burned } = req.body;

  if (!vitalData) {
    vitalData = new vitalsignal({
      userId,
      burned,
    });
  } else {
    vitalData.burned = burned;
  }

  await vitalData.save();

  res.status(201).json({
    status: SUCCESS,
  });
});

exports.postActiveHours = asyncWrapper(async (req, res, next) =>{
  const userId = req.user._id;
  let vitalData = await vitalsignal.findOne({ userId });
  const { activeHours } = req.body;

  if (!vitalData) {
    vitalData = new vitalsignal({
      userId,
      activeHours,
    });
  } else {
    vitalData.activeHours += activeHours;
  }

  await vitalData.save();

  res.status(201).json({
    status: SUCCESS,
  });
});
