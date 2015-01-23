(function () {
    angular
        .module('retailApp')
        .controller('ProductDetailsController', ['$scope', '$routeParams', 'productDetailsService', function($scope, $routeParams, productDetailsService) {
        	console.debug("routeParams", $routeParams);
        	$scope.product = productDetailsService.getProduct($routeParams.id);
        	console.debug("product", $scope.product);
        }]);
})();
