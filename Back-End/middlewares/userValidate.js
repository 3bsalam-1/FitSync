const { check } = require("express-validator");
const validatorMiddelware = require("./validationMiddleware");

exports.registerValidate=[
    check('username')
        .isLength({ min: 3 })
        .withMessage('Must be at least 3 chars')
        .notEmpty()
        .withMessage('Username is required'),
    check('email')
        .isEmail()
        .withMessage('Invalid Email')
        .notEmpty()
        .withMessage('Email is required'),
    check('password')
        .notEmpty()
        .withMessage('Password is required'),
    check('passwordConfirm')
        .notEmpty()
        .withMessage('PasswordConfirm is required'),
    validatorMiddelware,
]