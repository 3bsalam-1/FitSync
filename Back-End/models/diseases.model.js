const mongoose = require("mongoose");

const diseasesSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.ObjectId,
    ref: "user",
    required: [true, "UserId is required"],
  },
  hypertension: {
    type: Number,
    default: 0,
  },
  diabetes: {
    type: Number,
    default: 0,
  },
  heartCondition: {
    type: Number,
    default: 0,
  },
  LowPressure: {
    type: Number,
    required: [true, "LowPressure is required"],
  },
  kneePain: {
    type: Number,
    default: 0,
  },
  backPain: {
    type: Number,
    default: 0,
  },
});

module.exports = mongoose.model("disease", diseasesSchema);
