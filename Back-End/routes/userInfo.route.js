const router = require("express").Router();
const userInfoController = require("../controllers/userInfo.controller");
const { protect } = require("../controllers/auth.controller");

router.use(protect)
router.route("/").post(userInfoController.createUserInfo);
router.route("/").get(userInfoController.getUserInfo);
router.route("/isActive").patch(userInfoController.isActive);
router.route("/").patch(userInfoController.updateUserInfo);

module.exports = router;
