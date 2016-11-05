(function () {
    angular
        .module('retailApp')
        .factory('ordersService', function($http) {

            return {
                findOrderForUser: function(id) {
                    return $http.get("api/users/" + id + "/orders");
                },

            };
        });
})();
