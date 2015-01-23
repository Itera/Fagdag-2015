var _ = require('lodash');
var Order = require('mongoose').model('Order');
var handleError = require('./errors.server.controller').handleError;

exports.load = function(req, res, next, id) {
  Order.find({ _id: id }, function(err, order) {
    req.order = order;
    next();
  })
};

exports.retrieve = function(req, res) {
  res.status(200).json(req.order);
};

exports.create = function(req, res) {
  var order = req.body;
  Order.create(order, function(err, createdOrder) {
    if (err) return handleError(res, err);
    res.status(201).json(createdOrder);
  });
};

exports.list = function(req, res) {
  Order.find({}, function(err, orders) {
    if (err) return handleError(res, err);
    res.status(200).json(orders);
  });
};
