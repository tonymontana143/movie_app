const Staff = require('../model/staff_model');

class CastService {
  static async createCast(id, name, surname, imgUrl, role, description) {
    try {
      const cast = new Cast({ id, name, surname, imgUrl, role, description });
      await cast.save();
      return cast;
    } catch (error) {
      throw new Error('Error creating staff: ' + error.message);
    }
  }

  static async getCast() {
    try {
      const casts = await Staff.find();
      return casts;
    } catch (error) {
      throw new Error('Error fetching staffs: ' + error.message);
    }
  }

  static async updateCast(id, name, surname, imgUrl, role, description) {
    try {
      const cast = await Staff.findByIdAndUpdate(id, { name, surname, imgUrl, role, description }, { new: true });
      if (!cast) {
        throw new Error('Staff not found');
      }
      return cast;
    } catch (error) {
      throw new Error('Error updating staff: ' + error.message);
    }
  }

  static async deleteCast(id) {
    try {
      const cast = await Staff.findByIdAndDelete(id);
      if (!cast) {
        throw new Error('Staff not found');
      }
      return { message: 'Staff deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting staff: ' + error.message);
    }
  }
}

module.exports = CastService;
