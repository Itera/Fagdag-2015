var _ = require('lodash');
var mongoose = require('mongoose');
var deepPopulate = require('mongoose-deep-populate');
var Order = mongoose.model('Order');
var User = mongoose.model('User');
var sendOrderConfirmation = require('../mail').sendOrderConfirmation;
var handleError = require('./errors.server.controller').handleError;

exports.load = function(req, res, next, id) {
  Order
    .find({ _id: id })
    .deepPopulate('products.product')
    .exec(function(err, order) {
      if (err) return next(err);
      req.order = order;
      next();
    });
};

exports.retrieve = function(req, res) {
  res.status(200).json(req.order);
};

exports.create = function(req, res) {
  var order = req.body;
  Order.create(order, function(err, createdOrder) {
    if (err) return handleError(res, err);
    createdOrder.deepPopulate('products.product', function(err, populated) {
      if (err) return handleError(res, err);
      res.status(201).json(populated);

      User.findOne({ _id: createdOrder.customer }, function(err, user) {
        if (err) return console.log('Error!', err);
        sendOrderConfirmation(populated, user);
      });
    });
  });
};

exports.list = function(req, res) {
  Order
    .find({})
    .deepPopulate('products.product')
    .exec(function(err, orders) {
      if (err) return handleError(res, err);
      res.status(200).json(orders);
    });
};
