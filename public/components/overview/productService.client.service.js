(function () {
    angular
        .module('retailApp')
        .factory('productService', function() {
            var products = {
                1: {
                    name: 'Converse',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
                2: {
                    name: 'Boots',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
                3: {
                    name: 'Ecco',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
                4: {
                    name: 'Fotballsko',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                }
            };

            var cart = JSON.parse(window.localStorage.cart || '{}');

            return {
                findAll: function() {
                    return Object.keys(products).map(function(id) {
                        products[id].id = id;
                        return products[id];
                    });
                },
                findById: function(id) {
                    return products[id];
                },

                addToCart: function(product) {
                    if (product.id in cart) {
                        cart[product.id].count++;
                    } else {
                        cart[product.id] = {
                            product: product,
                            count: 1
                        };
                    }
                    window.localStorage.cart = JSON.stringify(cart);
                },

                getCart: function() {
                    return cart;
                },

                clearCart: function() {
                    cart = {};
                    window.localStorage.cart = '';
                }
            };
        });
})();
