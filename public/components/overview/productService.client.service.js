(function () {
    angular
        .module('retailApp')
        .factory('productService', function($http, $rootScope) {
            var products = {};

            var cart = JSON.parse(window.localStorage.cart || '{}');

            return {

                fetch: function() {
                    $http.get('/api/products').success(function(data) {
                        products = data.reduce(function(products, product) {
                            products[product.shoeId] = product;
                            return products;
                        }, {});
                        $rootScope.$broadcast('productsReceived');
                    });
                },

                findAll: function() {
                    return Object.keys(products).map(function(id) {
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
                },

                getBrandNames: function() {
                    return Object.keys(Object.keys(products).map(function(id) {
                        return products[id].brand;
                    }).reduce(function(brands, brand) {
                        brands[brand] = (brands[brand] || true);
                        return brands;
                    }, {}));
                },
            };
        });
})();
