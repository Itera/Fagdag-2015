(function () {
    angular
        .module('retailApp')
        .controller('ProductDetailsController', ['$scope', '$routeParams', 'productService', function($scope, $routeParams, productService) {
          $scope.$on('productsReceived', function() {
            $scope.product = productService.findById($routeParams.id);
          });

          $scope.addProductToCart = function(product) {
              productService.addToCart(product);
          };
        }]);
})();
