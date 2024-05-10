
/*
paths:
  /cast:
    post:
      summary: Create a new cast member
      operationId: createCast
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Cast'
      responses:
        '200':
          description: Successfully created
    get:
      summary: Get all cast members
      operationId: getCasts
      responses:
        '200':
          description: Successful operation
    put:
      summary: Update an existing cast member
      operationId: updateCast
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the cast member to update
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Cast'
      responses:
        '200':
          description: Successfully updated
    delete:
      summary: Delete a cast member
      operationId: deleteCast
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the cast member to delete
          schema:
            type: string
      responses:
        '200':
          description: Successfully deleted

*/
const express = require('express');
const router = express.Router();
const CastController = require('../controller/cast.controller');

router.post('/', CastController.createCast);
router.get('/', CastController.getCasts);
router.put('/updateCast/:id', CastController.updateCast);
router.delete('/deleteCast/:id', CastController.deleteCast);

module.exports = router;
