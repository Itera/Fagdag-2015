var _ = require('lodash');
var Product = require('mongoose').model('Product');
var handleError = require('./errors.server.controller').handleError;

exports.load = function(req, res, next, id) {
  Product.findOne({ _id: id }, function(err, product) {
    if (err) return handleError(res, err);
    req.product = product;
    next();
  });
};

exports.create = function(req, res) {
  var product = req.body;

  Product.create(product, function(err, createdProduct) {
    if (err) return handleError(res, err);
    res.status(201).json(createdProduct);
  });
};

exports.list = function(req, res) {
  Product.find({}, function(err, products) {
    res.status(200).json(products);
  });
};

exports.retrieve = function(req, res) {
  res.status(200).json(req.product);
};

exports.delete = function(req, res) {
  var product = req.product;
  product.remove(function(err) {
    if (err) return handleError(res, err);
    res.status(200).json({
      message: 'Deleted product',
      id: product.id
    });
  });
};

exports.update = function(req, res) {
  var updatedProduct = req.body;
  var product = _.extend(req.product, updatedProduct);
  product.save(function(err, updatedProduct) {
    if (err) return handleError(res, err);
    res.status(200).json(updatedProduct);
  });
};
