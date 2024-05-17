const mongoose = require('mongoose');
const logger = require('../logger'); // Adjust the path as needed

async function connectDB() {
    try {
        await mongoose.connect(
            "mongodb+srv://iliaskenes2005:XTvUTXzKAx8CoV9u@cluster0.yinydco.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
        );
        logger.info("Connected to MongoDB");
    } catch (error) {
        logger.error(`Error connecting to MongoDB: ${error.stack}`);
    }
}
module.exports = connectDB;
