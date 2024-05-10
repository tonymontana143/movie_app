const router = require("express").Router();
const StaffController = require("../controller/staff.controller");

router.post("/storeStaff", StaffController.createStaff);
router.get("/getStaff", StaffController.getStaff);

module.exports = router;