const router = require("express").Router();
const multer = require("multer");
const authController = require("../controllers/auth.controller");
const userController = require("../controllers/user.controller");
const AppError = require("../utils/appError");

const fileFilter = (req, file, cb) => {
  const imageType = file.mimetype.split("/")[0];
  if (imageType === "image") {
    return cb(null, true);
  }
  return cb(AppError.create("file must be an image", "Error", 400), false);
};
const upload = multer({ storage: multer.memoryStorage(), fileFilter });

router
  .route("/updatePassword")
  .patch(authController.protect, userController.updatePassword);

router.patch(
  "/changeAvatar",
  authController.protect,
  upload.single("avatar"),
  (req, res, next) => {
    if (!req.file) {
      return next(AppError.create("Please upload an image file", "Error", 400));
    }
    next();
  },
  userController.changeAvatar
);

router
  .route("/updateMe")
  .patch(authController.protect, userController.updateMe);

module.exports = router;
