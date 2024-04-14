const router = require("express").Router();
const passport = require("passport");
const authController = require('../controllers/auth.controller')

router.route("/google").get(
  passport.authenticate("google", {
    scope: ["profile", "email"],
  })
);
router
  .route("/google/redirect")
  .get(
    passport.authenticate("google", {
      successRedirect: "https://fitsync.onrender.com/home",
      failureRedirect: "https://fitsync.onrender.com/api/auth"
    })
  );

router.route('/login/succes').get(authController.loginWith)

router.route("/facebook").get(
  passport.authenticate("facebook", {
    scope: ["email"]
  })
);

router
  .route("/facebook/redirect")
  .get(passport.authenticate("facebook", { session: false }), (req, res) => {
    res.redirect(`/`);
  });

module.exports = router;
