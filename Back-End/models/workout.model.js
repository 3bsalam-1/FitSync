const mongoose = require('mongoose');

const workoutSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
  },
  workouts: [String],
});

module.exports = mongoose.model('saved_workout', workoutSchema);