const router = require("express").Router();
const userInfoController = require("../controllers/userInfo.controller");
const { protect } = require("../controllers/auth.controller");

router.route("/").post(protect, userInfoController.createUserInfo);
router.route("/").get(protect, userInfoController.getUserInfo);

module.exports = router;
