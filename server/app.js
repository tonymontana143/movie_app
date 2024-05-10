const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const userRouter = require('./routers/user.router');
const eventRouter = require('./routers/event.router');
const commentRouter=require('./routers/comment.router');
const castRouter=require('./routers/cast.router');
const staffRouter = require('./routers/staff.router');
app.use(bodyParser.json());
app.use('/', userRouter);

const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');

const swaggerOptions = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Flutter Movie API',
            version: '1.0.0',
            description: 'A simple Express Library API',
        },
        servers: [
            {
                url: 'http://localhost:3000',
            },
        ],
    },
    apis: ['./routes/*.js'], // Path to the API docs
};

const swaggerDocs = swaggerJsdoc(swaggerOptions);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocs));

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



app.use('/staff', staffRouter);
app.use('/staff/delete', staffRouter);
app.use('/staff/post', staffRouter);
app.use('/staff/get', staffRouter);
app.use('/staff/put', staffRouter);


app.use('/comments',commentRouter);
app.use('/delete',commentRouter);
app.use('/post',commentRouter);
app.use('/get',commentRouter);
app.use('/put',commentRouter);
module.exports = app;
