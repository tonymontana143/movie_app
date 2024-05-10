const express = require('express');
const userRouter = require('./routers/user.router');
const body_parser = require('body-parser');
const staffRouter = require("./routers/staff.router");
const castRouter = require("./routers/cast.router")
const app = express();
app.use(body_parser.json());
app.use('/', userRouter);
app.use("/", staffRouter);
app.use("/", castRouter);

module.exports = app;