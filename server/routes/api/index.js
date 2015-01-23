var express = require('express');
var product = require('../../controllers/product.server.controller');

var router = express.Router();

router.param('id', product.load);

router.route('/product')
  .post(product.create)
  .get(product.list);

router.route('/product/:id')
  .get(product.retrieve)
  .put(product.update)
  .delete(product.delete);

module.exports = router;
