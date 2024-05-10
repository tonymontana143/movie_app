const StaffModel = require("../model/staff_model");

class StaffService {

    static async createStaff(
            id,
            name,
            surname,
            imgUrl,
            position,
            description
    ) {

        const createStaff = new StaffModel(
            {
            id,
            name,
            surname,
            imgUrl,
            position,
            description
            }
        );

        return await createStaff.save();

    }

    static async getStaffData(id) {
        const staffData = await StaffModel.find({
            id
        });



        return staffData;
    }

}

module.exports = StaffService;
