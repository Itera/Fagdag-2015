var mongoose = require('mongoose');
var passport = require('passport');
var User = mongoose.model('User');
var Order = mongoose.model('Order');
var handleError = require('./errors.server.controller').handleError;

exports.load = function (req, res, next, id) {
  User.findOne({ _id: id }, function(err, user) {
    if (err) return handleError(res, err);
    req.user = user;
    next();
  });
};

exports.retrieve = function (req, res) {
  var user = req.user;
  res.status(200).json(user);
};

exports.list = function (req, res) {
  User.find({}, 'firstName lastName email role', function (err, users) {
    if (err) return handleError(res, err);
    res.status(200).json(users);
  });
};

exports.create = function (req, res) {
  var password = req.body.password;
  delete req.body.password;
  var user = new User(req.body);

	User.register(user, password, function (err, user) {
    if (err) return handleError(res, err);
		res.status(200).json(user);
	});
};

exports.listOrders = function (req, res) {
  var user = req.user;
  Order.find({ customer: user._id }, function(err, orders) {
    if (err) return handleError(res, err);
    res.status(200).json(orders);
  });
};

exports.login = function(req, res, next) {
  passport.authenticate('local', function(err, user) {
    if (err) return next(err);
    if (!user) return res.redirect('/login');

    req.logIn(user, function(err) {
      if (err) return next(err);
      res.status(200).json({
        user: user
      });
    });
  })(req, res, next);
};

exports.logout = function(req, res) {
  req.logout();
  res.status(200).json({
    message: 'User logged out.'
  });
};
