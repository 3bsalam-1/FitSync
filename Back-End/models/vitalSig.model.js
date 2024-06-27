const mongoose = require("mongoose");

const dataSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.ObjectId,
    ref: "User",
  },
  steps: [
    {
      steps: String,
      timestamps: Date,
    },
  ],
  avaheartbeat: [
    {
      avaheartbeat: String,
      timestamps: Date,
    },
  ],
  sleepHours: [
    {
      sleepHours: Number,
      timestamps: Date,
    },
  ],
  inTake:{
    type: Number,
    default: 0,
  },
  burned: [
    {
      burned: Number,
      timestamps: Date,
    },
  ],
  activeHours:{
    type: Number,
    default: 0,
  }
});

module.exports = mongoose.model("vitalsignal", dataSchema);
