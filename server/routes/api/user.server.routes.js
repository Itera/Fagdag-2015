var express = require('express');
var user = require('../../controllers/user.server.controller');

var router = express.Router();

router.route('/')
    .get(user.list)
    .post(user.create);

module.exports = router;
