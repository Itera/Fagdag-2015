var express = require('express');
var order = require('../../controllers/order.server.controller');

var router = express.Router();

router.route('/')
  .get(order.list)
  .post(order.create);

router.param('id', order.load);

router.get('/:id', order.retrieve);

module.exports = router;
