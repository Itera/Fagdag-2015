var express = require('express');
var user = require('../../controllers/user.server.controller');

var router = express.Router();

router.route('/')
  .get(user.list)
  .post(user.create);

router.param('id', user.load);

router.route('/:id')
  .get(user.retrieve);

router.get('/:id/order', user.listOrders);

module.exports = router;
