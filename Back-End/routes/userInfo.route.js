const router = require("express").Router();
const userInfoController = require("../controllers/userInfo.controller");
const { protect } = require("../controllers/auth.controller");

router.route("/").post(protect, userInfoController.createUserInfo);
router.route("/").get(protect, userInfoController.getUserInfo);
router.route("/isActive").patch(protect, userInfoController.isActive);
router.route("/").patch(protect, userInfoController.updateUserInfo);

module.exports = router;
