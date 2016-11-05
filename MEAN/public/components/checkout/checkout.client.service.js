(function () {

    angular
        .module('retailApp')
        .factory('CheckoutFactory', CheckoutFactory);

    CheckoutFactory.$inject = ['$http'];


    function CheckoutFactory ($http) {
        var service = {
            addOrder: addOrder
        };

        return service;

        //////////////////////////////////////////////////////////

        function addOrder (formData) {
            return $http.post('/api/orders', formData);
        }
    }

})();