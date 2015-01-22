var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

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

UserSchema.pre('save', function (next) {
});

UserSchema.methods.hashPassword = function (password) {
};

UserSchema.methods.authenticate = function (password) {
};

UserSchema.set('toJSON', {
    getters: true,
    virtuals: true
});

mongoose.model('User', UserSchema);