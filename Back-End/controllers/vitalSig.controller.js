const vitalsignal = require('../models/vitalSig.model')
const { FAIL, SUCCESS, ERROR } = require("../utils/httpStatusText");

exports.getvitalsignal = asyncWrapper(async(req,res,next)=>{
  const userId = req.user._id;
  const vitalData = await vitalsignal.findOne({ userId });
  res.status(201).json({
    status: SUCCESS,
    data:{
      Data: vitalData,
    }
  });
})
exports.postvitalsignal = asyncWrapper(async(req,res,next)=>{
  const userId = req.user._id;
  const vitalData = await vitalsignal.findOne({ userId });
  const { steps, avaheartbeat } = req.body;

  if (!vitalData) {
    vitalData = new vitalData({
      userId,
      steps: [{ steps, timestamp: Date.now() }],
      avaheartbeat: [{ avaheartbeat, timestamp: Date.now() }],
    });
  } else {
    vitalData.steps.push({ steps, timestamp: Date.now() });
    vitalData.avaheartbeat.push({ avaheartbeat, timestamp: Date.now() });
  }

  await vitalData.save();

  res.status(201).json({
    status: SUCCESS,
  });
});