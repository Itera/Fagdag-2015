(function () {
    angular
        .module('retailApp')
        .controller('MyPageController', ['$scope', 'ordersService', function($scope, ordersService) {

            // hardcoded userId
            var userId =  "54c2419351864ea2a7cdd265";

            ordersService.findOrderForUser(userId).then(function(orders) {
                $scope.orders = orders.data;
            });

        }]);
})();
