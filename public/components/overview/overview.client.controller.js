(function () {
    angular
        .module('retailApp')
        .controller('IndexController', ['$scope', 'productService', function($scope, productService) {
        	$scope.products = productService.findAll();
        }]);
})();
