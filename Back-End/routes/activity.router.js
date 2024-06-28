const router = require("express").Router();
const activityController = require("../controllers/activity.controller");
const { protect } = require("../controllers/auth.controller");

router.use(protect);
router
  .route("/workout")
  .get(activityController.getWorkout)
  .post(activityController.postWorkout);

router
  .route("/completed")
  .get(activityController.getCompleted)
  .post(activityController.postCompleted);
  
router
  .route("/fav-meal")
  .get(activityController.getFavMeal)
  .post(activityController.postFavMeal);

module.exports = router;
