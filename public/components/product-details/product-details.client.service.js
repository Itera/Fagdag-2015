(function () {
    angular
        .module('retailApp')
        .factory('productDetailsService', function() {
            var products = {
                1: {
                    name: 'Converse',
                    description: 'asd',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
                2: {
                    name: 'Converse',
                    description: 'asdasd',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
                3: {
                    name: 'Converse',
                    description: 'asdasdasd',
                    imageUrl: 'https://raw.githubusercontent.com/Itera/fagdag-januar-2015/master/produkter/1.jpg'
                },
            };
            return {
                getProduct: function(id) {
                    return products[id];
                }
            };
        });
})();
