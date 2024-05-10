const express = require('express');
const router = express.Router();
const EventController = require('../controller/event.controller');

// Create
router.post('/', EventController.createEvent);

// Read
router.get('/', EventController.getEvents);

// Update
router.put('/:id', EventController.updateEvent);

// Delete
router.delete('/:id', EventController.deleteEvent);
module.exports = router;
