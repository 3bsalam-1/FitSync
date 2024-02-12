const express = require('express').Router();
const vitalsignalController = require('../controllers/vitalSig.controller');
const {protect} = require('../controllers/auth.controller')


router.route('/').get(protect,vitalsignalController.getvitalsignal);
router.route('/').post(protect,vitalsignalController.postvitalsignal);

module.exports = router;
