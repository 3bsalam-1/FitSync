const mongoose = require('mongoose');

const userInfoSchema = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.ObjectId,
        ref: 'user',
        required: [true, 'UserId is required']
    },
    weight: {
        type: Number,
        required: [true, 'Weight is required']
    },
    height: {
        type: Number,
        required: [true, 'Height is required']
    },
    birthdate: {
        type: Date,
        required: [true, 'Age is required']
    },
    gender: {
        type: Number,
        required: [true, 'Gender is required'],
        enum: [1,0]
    },
    activityLevel: {
        type: Number,
        required: [true, 'Activity Level is required'],
        enum: [0,1,2,3,4]
    },
    systolicBP: {
        type: Number,
        required: [true, 'Systolic BP is required']
    },
    diastolicBP: {
        type: Number,
        required: [true, 'Diastolic BP is required']
    },
    cholesterolLevel: {
        type: Number,
        required: [true, 'Cholesterol Level is required']
    },
    bloodsugar: {
        type: Number,
        required: [true, 'Blood Sugar is required']
    },
    hypertension: {
        type: Number,
        default: 0
    },
    diabetes: {
        type: Number,
        default: 0
    },
    heartCondition: {
        type: Number,
        default: 0
    },
    LowPressure: {
        type: Number,
        required: [true, 'LowPressure is required']
    },
    BMR: {
        type: Number,
        required: [true, 'BMR is required']
    },
    kneePain: {
        type: Number,
        default: 0
    },
    backPain: {
        type: Number,
        default: 0
    },

});

module.exports = mongoose.model('user-info', userInfoSchema)