const Review = require('../model/comment.model');

class ReviewService {
  static async getAllReviews() {
    try {
      return await Review.find();
    } catch (error) {
      throw new Error(`Error getting reviews: ${error.message}`);
    }
  }

  static async getReviewById(id) {
    try {
      return await Review.findById(id);
    } catch (error) {
      throw new Error(`Error getting review: ${error.message}`);
    }
  }

  static async createReview(text) {
    try {
      const newReview = new Review({ text });
      return await newReview.save();
    } catch (error) {
      throw new Error(`Error creating review: ${error.message}`);
    }
  }

  static async updateReview(id, newText) {
    try {
      return await Review.findByIdAndUpdate(id, { text: newText }, { new: true });
    } catch (error) {
      throw new Error(`Error updating review: ${error.message}`);
    }
  }

  static async deleteReview(id) {
    try {
      return await Review.findByIdAndDelete(id);
    } catch (error) {
      throw new Error(`Error deleting review: ${error.message}`);
    }
  }
}

module.exports = ReviewService;
