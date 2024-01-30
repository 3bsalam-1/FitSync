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
    age: {
        type: Number,
        required: [true, 'Age is required']
    },
    gender: {
        type: String,
        required: [true, 'Gender is required'],
        enum: ['Male', 'Female', 'Other']
    },
    activityLevel: {
        type: String,
        required: [true, 'Activity Level is required'],
        enum: ['Low', 'Moderate', 'High']
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
    bloodSugar: {
        type: Number,
        required: [true, 'Blood Sugar is required']
    },
    hypertension: {
        type: Boolean,
        default: false
    },
    diabetes: {
        type: Boolean,
        default: false
    },
    heartCondition: {
        type: Boolean,
        default: false
    },
    LowPressure: {
        type: Number,
        required: [true, 'LowPressure is required']
    },
    bmr: {
        type: Number,
        required: [true, 'BMR is required']
    },
    kneePain: {
        type: Boolean,
        default: false
    },
    backPain: {
        type: Boolean,
        default: false
    },
    vegetarian:{
        type: Boolean,
        default: false
    }
});

module.exports = mongoose.model('user-info', userInfoSchema)