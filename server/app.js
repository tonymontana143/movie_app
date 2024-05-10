const express = require('express');

const userRouter = require('./routers/user.router');
const body_parser = require('body-parser');
const staffRouter = require("./routers/staff.router");
const castRouter = require("./routers/cast.router")
const app = express();
app.use(body_parser.json());
app.use("/", staffRouter);
app.use("/", castRouter);

const bodyParser = require('body-parser');
const eventRouter = require('./routers/event.router');
const commentRouter=require('./routers/comment.router')
app.use(bodyParser.json());
app.use('/', userRouter);

app.use('/events', eventRouter);
app.use('/delete',eventRouter);
app.use('/post',eventRouter);
app.use('/get',eventRouter);
app.use('/put',eventRouter);


app.use('/comments',commentRouter);
app.use('/delete',commentRouter);
app.use('/post',commentRouter);
app.use('/get',commentRouter);
app.use('/put',commentRouter);
module.exports = app;

