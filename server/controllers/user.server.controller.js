var User = require('mongoose').model('User');
var handleError = require('./errors.server.controller').handleError;

exports.load = function (req, res, next, id) {
  User.find({ _id: id }, function(err, user) {
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
	User.create(req.body, function (err, user) {
    if (err) return handleError(res, err);
		if (!user) {
			res.status(400).json({
				message: 'Could not find user'
			});
		}
		else {
			res.status(200).json(user);
		}
	});
}

exports.listOrders = function (req, res) {
  res.status(200).json([
    {
      order: 'this should return orders for the user'
    }
  ]);
};
