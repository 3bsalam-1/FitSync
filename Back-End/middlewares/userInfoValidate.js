const { check } = require('express-validator');
const validatorMiddelware = require("./validationMiddleware");

exports.validateUserInfo = [
    check('userId')
        .notEmpty()
        .withMessage('User ID is required'),

    check('weight')
        .notEmpty()
        .withMessage('Weight is required'),

    check('height')
        .notEmpty()
        .withMessage('Height is required'),

    check('birthdate')
        .notEmpty()
        .withMessage('Birthdate is required'),

    check('gender')
        .notEmpty()
        .withMessage('Gender is required')
        .isIn([0, 1])
        .withMessage('Gender must be either 0 or 1'),

    check('activityLevel')
        .notEmpty()
        .withMessage('Activity Level is required')
        .isIn([0, 1, 2, 3, 4])
        .withMessage('Activity Level must be between 0 and 4'),

    check('systolicBP')
        .notEmpty()
        .withMessage('Systolic BP is required'),

    check('diastolicBP')
        .notEmpty()
        .withMessage('Diastolic BP is required'),

    check('cholesterolLevel')
        .notEmpty()
        .withMessage('Cholesterol Level is required'),

    check('bloodsugar')
        .notEmpty()
        .withMessage('Blood Sugar is required'),

    check('LowPressure')
        .notEmpty()
        .withMessage('LowPressure is required'),

    check('BMR')
        .notEmpty()
        .withMessage('BMR is required'),
    validatorMiddelware,
];
