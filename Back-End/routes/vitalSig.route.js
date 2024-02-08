const express = require('express');
const vitalsignalController = require('../controllers/vitalSign.controller');
const {protect} = require('../controllers/auth.controller')


router.route('/').get(protect,vitalsignalController.getvitalsignal);
router.route('/').post(protect,vitalsignalController.postvitalsignal);

module.exports = router;
