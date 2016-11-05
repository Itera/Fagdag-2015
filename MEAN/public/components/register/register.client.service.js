(function () {

    angular
        .module('retailApp')
        .factory('RegisterFactory', RegisterFactory);

    RegisterFactory.$inject = ['$http'];


    function RegisterFactory ($http) {
        var service = {
            register: register
        };

        return service;

        //////////////////////////////////////////////////////////

        function register(formData) {
            return $http.post("/api/users", formData);
        }
    }

})();