const mongoose=require('mongoose');
const bcrypt=require("bcrypt");
const connectDB=require('../config/db');

const{ Schema,model }=mongoose;


const UserSchema=new Schema({
    email:{
        type:String,
        lowercase:true,
        required:true,
        unique:true 
    },
    password:{
        type:String,
        required:true
    }
})
UserSchema.pre('save',async function(){
    try{
        var user=this;
        const salt=await(bcrypt.genSalt(10));
        const hashPassword=await bcrypt.hash(user.password,salt);
        user.password=hashPassword;
    }catch(error){
        throw error;
    }
})
UserSchema.methods.comparePassword=async function(userPassword){
    try{
        const isMatch=await bcrypt.compare(userPassword,this.password);
        return isMatch;
    }catch(error){
        throw error;
    }
}
module.exports=model("User",UserSchema);