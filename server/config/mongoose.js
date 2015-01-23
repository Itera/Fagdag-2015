var mongoose = require('mongoose');

module.exports = function () {
    var db = mongoose.connect('mongodb://localhost/retail', function (err) {
        if (err) {
            console.log("Error connecting to database: " + err);
        }
        else {
            console.log("Connected to database");
        }
    });

    require('../models/user.server.model');

    return db;
};
