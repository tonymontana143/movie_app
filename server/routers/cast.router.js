const router = require("express").Router();
const CastController = require("../controller/cast.controller");

router.post("/storeCast", CastController.createCast);

router.get("/getCast", CastController.getCast);

module.exports = router;