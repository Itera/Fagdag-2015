(function () {
    angular
        .module('retailApp')
        .controller('SuccessController', SuccessController);

    SuccessController.$inject = ['$window'];

    function SuccessController($window) {
    	var success = this;

        success.cart = $window.localStorage['cart'];

        success.items = [];
        for (var key in success.cart) {
            if (success.cart.hasOwnProperty(key)) {
                success.items.push(success.cart[key]);
            }
        }
    };
})();