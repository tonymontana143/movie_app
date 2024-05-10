const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const userRouter = require('./routers/user.router');
const eventRouter = require('./routers/event.router');
const commentRouter=require('./routers/comment.router');
const castRouter=require('./routers/cast.router');
app.use(bodyParser.json());
app.use('/', userRouter);

app.use('/events', eventRouter);
app.use('/delete',eventRouter);
app.use('/post',eventRouter);
app.use('/get',eventRouter);
app.use('/put',eventRouter);


app.use('/cast', castRouter);
app.use('/delete',castRouter);
app.use('/post',castRouter);
app.use('/get',castRouter);
app.use('/put',castRouter);



app.use('/comments',commentRouter);
app.use('/delete',commentRouter);
app.use('/post',commentRouter);
app.use('/get',commentRouter);
app.use('/put',commentRouter);
module.exports = app;
