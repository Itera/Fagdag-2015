var express = require('express');
var productRoutes = require('./product.server.routes');
var userRoutes = require('./user.server.routes');

var router = express.Router();

router.use('/product', productRoutes);
router.use('/user', userRoutes);

module.exports = router;
