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
                    name: 'Converse',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
                3: {
                    name: 'Converse',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
            };
            return {
                findAll: function() {
                    return products;
                },
                findById: function(id) {
                    return products[id];
                }
            };
        });
})();
