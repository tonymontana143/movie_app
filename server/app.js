const express=require('express');
const userRouter=require('./routers/user.router');
const body_parser=require('body-parser');
const app=express();
app.use(body_parser.json());
app.use('/',userRouter);
module.exports=app;