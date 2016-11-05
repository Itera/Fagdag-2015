(function () {

    angular
        .module('retailApp')
        .factory('LoginFactory', LoginFactory);

    LoginFactory.$inject = ['$http'];


    function LoginFactory ($http) {
        var service = {
            login: login
        };

        return service;

        //////////////////////////////////////////////////////////

        function login(formData) {
            return $http.post("/login", formData);
        }
    }

})();