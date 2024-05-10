const Cast = require('../model/cast.model');

class CastService {
  static async createCast(id, name, surname, imgUrl, role, description) {
    try {
      const cast = new Cast({ id, name, surname, imgUrl, role, description });
      await cast.save();
      return cast;
    } catch (error) {
      throw new Error('Error creating cast: ' + error.message);
    }
  }

  static async getCasts() {
    try {
      const casts = await Cast.find();
      return casts;
    } catch (error) {
      throw new Error('Error fetching casts: ' + error.message);
    }
  }

  static async updateCast(id, name, surname, imgUrl, role, description) {
    try {
      const cast = await Cast.findByIdAndUpdate(id, { name, surname, imgUrl, role, description }, { new: true });
      if (!cast) {
        throw new Error('Cast not found');
      }
      return cast;
    } catch (error) {
      throw new Error('Error updating cast: ' + error.message);
    }
  }

  static async deleteCast(id) {
    try {
      const cast = await Cast.findByIdAndDelete(id);
      if (!cast) {
        throw new Error('Cast not found');
      }
      return { message: 'Cast deleted successfully' };
    } catch (error) {
      throw new Error('Error deleting cast: ' + error.message);
    }
  }
}

module.exports = CastService;
