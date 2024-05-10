/*
paths:
  /staff:
    post:
      summary: Create a new staff member
      operationId: createStaff
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Staff'
      responses:
        '200':
          description: Successfully created
    get:
      summary: Get all staff members
      operationId: getStaffs
      responses:
        '200':
          description: Successful operation
    put:
      summary: Update an existing staff member
      operationId: updateStaff
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the staff member to update
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Staff'
      responses:
        '200':
          description: Successfully updated
    delete:
      summary: Delete a staff member
      operationId: deleteStaff
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the staff member to delete
          schema:
            type: string
      responses:
        '200':
          description: Successfully deleted
*/
const express = require('express');
const router = express.Router();
const StaffController = require('../controller/staff.controller');

router.post('/', StaffController.createStaff);
router.get('/', StaffController.getStaffs);
router.put('/updateStaff/:id', StaffController.updateStaff);
router.delete('/deleteStaff/:id', StaffController.deleteStaff);

module.exports = router;
