const express=require('express');
const userRouter=require('./routers/user.router');
const body_parser=require('body-parser');
const staffRouter=require("./routers/staff.router");
const cors = require('cors');
const app=express();
const corsOptions = {
  origin: 'http://localhost:56983/',
  optionsSuccessStatus: 200
}
app.use(cors(corsOptions));
app.use(body_parser.json());
app.use('/',userRouter);
app.use("/", staffRouter);
module.exports=app;