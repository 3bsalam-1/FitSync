const mongoose = require('mongoose');
const validator = require('validator');
const bcrypt = require('bcrypt');

const userSchema = new mongoose.Schema({
    firstName:{
        type: String,
        required: [true,"FirstName is required"],
    },
    lastName:{
        type: String,
        required: [true,"LastName is required"],
    },
    username:{
        type: String,
        required: [true,"Username is required"],
        trim: true,
        lowercase:true,
        unique: [true,"Username already exists"]
    },
    email:{
        type:String,
        required: [true,'Email is required'],
        unique: [true,"Email already exists"],
        validate: [validator.isEmail,'Please provide a valid email']
    },
    avatar:{
        type:String,
        default: "2024644_login_user_avatar_person_users_icon.png"
    },
    password:{
        type: String,
        required: [true,'Password is required'],
        minlength: [6,"Select password more secure"],
        select: false
    },
    passwordConfirm:{
        type: String,
        required: [true,'Please confirm your password'],
        validate:{
            validator: function (val) {
                return val === this.password;
            },
            message: "Confirm password must match with passowrd"
        }
    },
    isVerify:{
        type: Boolean,
        default: false
    },
    firstTime:{
        type: Boolean,
        default: true
    },
    code:{
        type: String,
        default: undefined
    },
    codeExpires: Date,
    passwordChangeAt: Date
});


userSchema.pre('save',async function(next){
    if(!this.isModified('password')) return next();
    this.password = await bcrypt.hash(this.password,12);
    this.passwordConfirm=undefined;
    next();
});

userSchema.pre('save',function(next){
    if(!this.isModified('password') || this.isNew) return next();
    this.passwordChangeAt = Date.now();
    next();
})

userSchema.methods.correctPassword = async function(candidatePassword,userPassword){
    return await bcrypt.compare(candidatePassword,userPassword)
}

userSchema.methods.changePasswordAfter = function(JWTTimestamp){
    if(this.passwordChangeAt){
        const changedTimestamp = this.passwordChangeAt.getTime()/1000;
        return changedTimestamp > JWTTimestamp;
    }
    return false;
}


module.exports = mongoose.model('user',userSchema)