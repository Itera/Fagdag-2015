(function () {
    angular
        .module('retailApp')
        .controller('ProductDetailsController', ['$scope', '$routeParams', 'productService', function($scope, $routeParams, productService) {
        	$scope.product = productService.findById($routeParams.id);
        }]);
})();
