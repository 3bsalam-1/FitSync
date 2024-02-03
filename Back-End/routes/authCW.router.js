const router = require("express").Router();
const passport = require("passport");


const authController = require("../controllers/auth.controller");

router.route("/google").get(
  passport.authenticate("google", {
    scope: ["profile", "email"],
  })
);
router.route("/google/redirect").get(passport.authenticate("google"),authController.loginWith);




router.route("/facebook").get(
  passport.authenticate("facebook", {
    scope: ['email']
  })
);

router.route("/facebook/redirect").get(passport.authenticate("facebook"),authController.loginWith);

module.exports = router;
