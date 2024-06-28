const { check } = require("express-validator");
const validatorMiddelware = require("./validationMiddleware");

exports.registerValidate=[
    check('firstName')
        .notEmpty()
        .withMessage('First Name is required'),
    
    check('lastName')
        .notEmpty()
        .withMessage('Last Name is required'),
    
    check('username')
        .isLength({ min: 3 })
        .withMessage('Username must be at least 3 characters')
        .notEmpty()
        .withMessage('Username is required'),

    check('email')
        .isEmail()
        .withMessage('Invalid Email')
        .notEmpty()
        .withMessage('Email is required'),

    check('password')
        .notEmpty()
        .withMessage('Password is required')
        .isLength({ min: 6 })
        .withMessage('Password must be at least 6 characters'),

    check('passwordConfirm')
        .notEmpty()
        .withMessage('Password Confirmation is required')
        .custom((value, { req }) => {
            if (value !== req.body.password) {
                throw new Error('Password Confirmation does not match Password');
            }
            return true;
        }),
    validatorMiddelware,
]