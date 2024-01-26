const router = require("express").Router();
const multer = require('multer');

const AppError = require("../utils/appError");
const authController = require("../controllers/auth.controller");
const {registerValidate}=require('../middlewares/userValidate')

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "images/avatar");
  },
  filename: function (req, file, cb) {
    const ext = file.mimetype.split("/")[1];
    const fileName = `${file.originalname.split(".")[0]}-${Date.now()}.${ext}`;
    cb(null, fileName);
  },
});

const fileFilter = (req, file, cb) => {
  const imageType = file.mimetype.split("/")[0];
  if (imageType === "image") {
    return cb(null, true);
  }
  return cb(AppError.create("file must be an image",'Error', 400), false);
};
const upload = multer({ storage, fileFilter });

router.post("/register",registerValidate, authController.Register);
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

router
  .route("/updatePassword")
  .patch(authController.protect, authController.updatePassword);

router.patch("/changeAvatar",authController.protect,upload.single("avatar"),authController.changeAvater)

module.exports = router;
