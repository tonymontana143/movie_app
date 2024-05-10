const express = require('express');
const router = express.Router();
const CastController = require('../controller/cast.controller');

router.post('/', CastController.createCast);
router.get('/', CastController.getCasts);
router.put('/updateCast/:id', CastController.updateCast);
router.delete('/deleteCast/:id', CastController.deleteCast);

module.exports = router;
