const mongoose = require("mongoose");

const activitySchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.ObjectId,
    ref: "User",
  },
  workouts: [
    {
      type: String,
    },
  ],
  completed: {
    day: String,
    data:[
      {
        type: Boolean,
        default: false,
      },
    ], 
  },
  favMeal:[
    {
      type: String,
    },
  ],
});

module.exports = mongoose.model("saved_activity", activitySchema);
