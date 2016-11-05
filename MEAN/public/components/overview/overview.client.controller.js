(function () {
    angular
        .module('retailApp')
        .controller('IndexController', ['$scope', 'productService', function($scope, productService) {
            $scope.products = productService.findAll();
            $scope.searchQuery = '';
            $scope.chosenBrands = {};

            productService.fetch();

            $scope.filterBrands = function() {
                return function(p) {
                    for (var brand in $scope.chosenBrands) {
                        if ($scope.chosenBrands[brand] && p.brand === brand) return true;
                    }
                    return false;
                };
            };

            $scope.$on('productsReceived', function() {
                $scope.products = productService.findAll();
                $scope.brandNames = productService.getBrandNames();
                $scope.chosenBrands = $scope.brandNames.reduce(function(brands, brand) {
                    brands[brand] = true;
                    return brands;
                }, {});
            });
        }]);
})();
