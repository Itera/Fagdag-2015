var express = require('express');
var apiRoutes = require('./api');

var index = require('../controllers/index.server.controller');

var router = express.Router();

router.get('/', index.render);

router.use('/api', apiRoutes);

module.exports = router;
