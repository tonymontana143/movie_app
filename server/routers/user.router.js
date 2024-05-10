const router=require('express').Router();
const UserController=require('../controller/user.controller')
router.post('/registration',UserController.register);
router.post('/login',UserController.login);
module.exports=router;

/*
paths:
  /user/registration:
    post:
      summary: Register a new user
      operationId: registerUser
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/User'
      responses:
        '200':
          description: Successfully registered
  /user/login:
    post:
      summary: Login as a user
      operationId: loginUser
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Login'
      responses:
        '200':
          description: Successfully logged in
*/