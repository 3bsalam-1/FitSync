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

const storage = multer.diskStorage({
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

const upload = multer({ storage: storage, fileFilter });

router.use(authController.protect);
router.route("/updatePassword").patch(userController.updatePassword);

router.patch(
  "/changeAvatar",
  upload.single("avatar"),
  userController.changeAvatar
);

router.route("/updateMe").patch(userController.updateMe);

module.exports = router;
