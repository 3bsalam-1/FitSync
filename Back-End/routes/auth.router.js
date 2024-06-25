const router = require("express").Router();

const AppError = require("../utils/appError");
const authController = require("../controllers/auth.controller");
const { registerValidate } = require("../middlewares/userValidate");

router.post("/register", registerValidate, authController.Register);
router.get(
  "/sendCodeVerfiy",
  authController.protectForVerfiy,
  authController.sendCodeVerfiy
);
router.post(
  "/verfiy",
  authController.protectForVerfiy,
  authController.verfiyAccount
);

router.post("/login", authController.Login);

router.post("/forgetPassword", authController.forgetPassword);
router.post("/codeReset", authController.codeReset);
router.post(
  "/resetPassword",
  authController.protectForVerfiy,
  authController.resetPassword
);

router.post("/ContinueWithGoogle", authController.ContinueWithGoogle);

router.get("/logout", authController.logout);


module.exports = router;
