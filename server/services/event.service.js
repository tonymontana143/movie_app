const Event = require('../model/event.model');

class EventService {
  static async createEvent(title, date) {
    try {
      const event = new Event({ title, date });
      return await event.save();
    } catch (err) {
      throw err; // Re-throw the error for handling in the controller
    }
  }

  static async getEvents() {
    try {
      return await Event.find();
    } catch (err) {
      throw err; // Re-throw the error for handling in the controller
    }
  }

  static async getEventById(eventId) {
    try {
      return await Event.findById(eventId);
    } catch (err) {
      throw err; // Re-throw the error for handling in the controller
    }
  }

  static async updateEvent(eventId, updateData) {
    try {
      return await Event.findByIdAndUpdate(eventId, updateData, { new: true });
    } catch (err) {
      throw err; // Re-throw the error for handling in the controller
    }
  }

  static async deleteEvent(eventId) {
    try {
      return await Event.findByIdAndDelete(eventId);
    } catch (err) {
      throw err; 
    }
  }
}

module.exports = EventService;
