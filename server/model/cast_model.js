const mongoose = require("mongoose");

const { Schema } = mongoose;

const castSchema = new Schema({
    id: String,
    name: String,
    surname: String,
    imgUrl: String,
    role: String,
    description: String
});

const CastModel = mongoose.model("cast", castSchema);

module.exports = CastModel;