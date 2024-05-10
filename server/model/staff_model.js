const mongoose = require("mongoose");

const { Schema } = mongoose;

const staffSchema = new Schema({
    id: String,
    name: String,
    surname: String,
    imgUrl: String,
    position: String,
    description: String
});

const StaffModel = mongoose.model("staff", staffSchema);

module.exports = StaffModel;