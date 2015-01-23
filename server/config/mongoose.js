var mongoose = require('mongoose');

module.exports = function () {

    var mongoUrl = "mongodb://heroku_app33436366:10ugjm8gfg3mgva87kmpu30hg3@ds031571.mongolab.com:31571/heroku_app33436366";

    //var db = mongoose.connect('mongodb://localhost/retail', function (err) {
    var db = mongoose.connect(mongoUrl, function (err) {
        if (err) {
            console.log("Error connecting to database: " + err);
        } else {
            console.log("Connected to database");
        }
    });

    require('../models/user.server.model');
    require('../models/products.server.model');
    require('../models/order.server.model');

    return db;
};
