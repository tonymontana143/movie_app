const Staff = require('../model/staff_model');

class StaffService {
  static async createStaff(id, name, surname, imgUrl, role, description) {
    try {
      const staff = new Staff({ id, name, surname, imgUrl, role, description });
      await staff.save();
      return staff;
    } catch (error) {
      throw new Error('Error creating staff: ' + error.message);
    }
  }

  static async getStaffs() {
    try {
      const staffs = await Staff.find();
      return staffs;
    } catch (error) {
      throw new Error('Error fetching staffs: ' + error.message);
    }
  }

  static async updateStaff(id, name, surname, imgUrl, role, description) {
    try {
      const staff = await Staff.findByIdAndUpdate(id, { name, surname, imgUrl, role, description }, { new: true });
      if (!staff) {
        throw new Error('Staff not found');
      }
      return staff;
    } catch (error) {
      throw new Error('Error updating staff: ' + error.message);
    }
  }

  static async deleteStaff(id) {
    try {
      const staff = await Staff.findByIdAndDelete(id);
      if (!staff) {
        throw new Error('Staff not found');
      }
      return { message: 'Staff deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting staff: ' + error.message);
    }
  }
}

module.exports = StaffService;
