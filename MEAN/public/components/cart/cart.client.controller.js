(function () {
    angular
        .module('retailApp')
        .controller('CartController', ['$scope', 'productService', function($scope, productService) {
        	$scope.cart = productService.getCart();

        	$scope.clearCart = function() {
        		productService.clearCart();
        		$scope.cart = productService.getCart();
        	};
        }]);
})();
