const StaffService = require("../services/staff.service");

exports.createStaff = async (req, res, next) => {
    try {
        const { id,
            name,
            surname,
            imgUrl,
            position,
            description } = req.body;

        let staff = await StaffService.createStaff(
            id,
            name,
            surname,
            imgUrl,
            position,
            description
        );

        res.json({ status: true, success: staff });
    } catch (e) {
        next(e);
    }
};

exports.getStaff = async (req, res, next) => {
    try {
        const { id } = req.body;

        let staff = await StaffService.getStaffData(
            id
        );

        res.json({ status: true, success: staff });
    } catch (e) {
        next(e);
    }
};