const express = require('express');
const router = express.Router();
const StaffController = require('../controller/staff.controller');

router.post('/', StaffController.createStaff);
router.get('/', StaffController.getStaffs);
router.put('/updateStaff/:id', StaffController.updateStaff);
router.delete('/deleteStaff/:id', StaffController.deleteStaff);

module.exports = router;
