const Event = require('../model/event.model');

exports.createEvent = async (req, res) => {
  try {
    const { title, date } = req.body;
    const event = new Event({ title, date });
    await event.save();
    res.status(201).json(event);
  } catch (err) {
    console.error('Error creating event:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.getEvents = async (req, res) => {
  try {
    const events = await Event.find();
    res.json(events);
  } catch (err) {
    console.error('Error fetching events:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.updateEvent = async (req, res) => {
  try {
    const { title, date } = req.body;
    const updatedEvent = await Event.findByIdAndUpdate(req.params.id, { title, date }, { new: true });
    res.status(200).json(updatedEvent);
  } catch (error) {
    console.error('Error updating event:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.deleteEvent = async (req, res) => {
  try {
    await Event.findByIdAndDelete(req.params.id);
    res.status(204).send();
  } catch (error) {
    console.error('Error deleting event:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
};
