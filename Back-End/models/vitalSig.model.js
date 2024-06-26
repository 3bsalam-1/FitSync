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
  inTake: Number,
  burned: [
    {
      burned: Number,
      timestamps: Date,
    },
  ],
  activeHours: Number
});

module.exports = mongoose.model("vitalsignal", dataSchema);
