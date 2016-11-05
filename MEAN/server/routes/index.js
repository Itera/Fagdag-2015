var express = require('express');
var apiRoutes = require('./api');
var user = require('../controllers/user.server.controller');

var index = require('../controllers/index.server.controller');

var router = express.Router();

router.get('/', index.render);

router.post('/login', user.login);
router.post('/logout', user.logout);

router.use('/api', apiRoutes);

module.exports = router;
