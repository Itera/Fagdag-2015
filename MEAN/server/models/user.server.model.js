var mongoose = require('mongoose'),
    Schema = mongoose.Schema,
    passportLocalMongoose = require('passport-local-mongoose');

var UserSchema = new Schema({
    firstName: {
        type: String,
        trim: true
    },
    lastName: {
        type: String,
        trim: true
    },
    email: {
        type: String,
        unique: 'email already exists',
        match: [/.+\@.+\..+/, "not a valid email address"],
        trim: true,
        required: true,
        lowercase: true
    },
    role: {
        type: String,
        enum: ['Visitor', 'Administrator'],
        default: 'Visitor',
        required: true
    },
    created: {
        type: Date,
        default: Date.now
    }
});

UserSchema.set('toJSON', {
    getters: true,
    virtuals: true
});

UserSchema.plugin(passportLocalMongoose, {
    usernameField: 'email'
});

mongoose.model('User', UserSchema);
