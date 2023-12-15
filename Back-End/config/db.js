const mongoose = require('mongoose');
require('dotenv').config();
mongoose.connect(process.env.LOCAL_DB).then(()=>{
    console.log("db connected");
}).catch((err)=>{
    console.log(err);
})