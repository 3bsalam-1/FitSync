const router = require('express').Router();
const vitalsignalController = require('../controllers/vitalSig.controller');
const {protect} = require('../controllers/auth.controller')

router.use(protect)
router.route('/').get(vitalsignalController.getvitalsignal);
router.route('/').post(vitalsignalController.postvitalsignal);
router.route('/inTake').post(vitalsignalController.postInTake);
router.route('/burned').post(vitalsignalController.postBurned);
router.route('/active-hours').post(vitalsignalController.postActiveHours);


module.exports = router;
