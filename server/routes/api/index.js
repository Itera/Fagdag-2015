var express = require('express');
var productRoutes = require('./product.server.routes');
var userRoutes = require('./user.server.routes');
var orderRoutes = require('./order.server.routes');

var router = express.Router();

router.use('/products', productRoutes);
router.use('/users', userRoutes);
router.use('/orders', orderRoutes);

module.exports = router;
