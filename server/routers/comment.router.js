/*
paths:
  /comment:
    post:
      summary: Create a new comment
      operationId: createComment
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Comment'
      responses:
        '200':
          description: Successfully created
    get:
      summary: Get all comments
      operationId: getComments
      responses:
        '200':
          description: Successful operation
    put:
      summary: Update an existing comment
      operationId: updateComment
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the comment to update
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Comment'
      responses:
        '200':
          description: Successfully updated
    delete:
      summary: Delete a comment
      operationId: deleteComment
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the comment to delete
          schema:
            type: string
      responses:
        '200':
          description: Successfully deleted
*/
const express = require('express');
const router = express.Router();
const reviewController = require('../controller/comment.controller');

router.post('/', reviewController.createReview);
router.get('/', reviewController.getReviews);
router.put('/:id', reviewController.updateReview);
router.delete('/:id', reviewController.deleteReview);

module.exports = router;

/*
paths:
  /comment:
    post:
      summary: Create a new comment
      operationId: createComment
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Comment'
      responses:
        '200':
          description: Successfully created
    get:
      summary: Get all comments
      operationId: getComments
      responses:
        '200':
          description: Successful operation
    put:
      summary: Update an existing comment
      operationId: updateComment
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the comment to update
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Comment'
      responses:
        '200':
          description: Successfully updated
    delete:
      summary: Delete a comment
      operationId: deleteComment
      parameters:
        - in: path
          name: id
          required: true
          description: ID of the comment to delete
          schema:
            type: string
      responses:
        '200':
          description: Successfully deleted
*/