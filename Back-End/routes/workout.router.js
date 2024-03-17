const router = require('express').Router();
const workoutController = require('../controllers/workout.controller');
const {protect} = require('../controllers/auth.controller')


router.route('/').get(protect,workoutController.getWorkout);
router.route('/').post(protect,workoutController.postWorkout);

module.exports = router;