/*
paths:
  /event:
    post:
      summary: Create a new event
      operationId: createEvent
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Event'
      responses:
        '200':
          description: Successfully created
    get:
      summary: Get all events
      operationId: getEvents
      responses:
        '200':
          description: Successful operation
    put:
      summary: Update an existing event
      operationId: updateEvent
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the event to update
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Event'
      responses:
        '200':
          description: Successfully updated
    delete:
      summary: Delete an event
      operationId: deleteEvent
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the event to delete
          schema:
            type: string
      responses:
        '200':
          description: Successfully deleted
*/
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
