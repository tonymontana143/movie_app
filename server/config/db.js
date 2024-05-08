const mongoose=require('mongoose');

async function connectDB() {
    try {
      await mongoose.connect(
        "mongodb+srv://iliaskenes2005:XTvUTXzKAx8CoV9u@cluster0.yinydco.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
      );
      console.log("Connected to MongoDB");
    } catch (error) {
      console.error("Error connecting to MongoDB:", error);
    }
  }
  module.exports = connectDB;
