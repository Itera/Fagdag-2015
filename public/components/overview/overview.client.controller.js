(function () {
    angular
        .module('retailApp')
        .controller('IndexController', ['$scope', 'productService', function($scope, productService) {
        		$scope.products = productService.findAll();
            $scope.searchQuery = '';

            $scope.$on('productsReceived', function() {
        			$scope.products = productService.findAll();
        		});

            $scope.addProductToCart = function(product) {
                productService.addToCart(product);
            };
        }]);
})();
