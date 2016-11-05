(function () {
    angular
        .module('retailApp')
        .controller('CheckoutController', CheckoutController);

    CheckoutController.$inject = ['CheckoutFactory', '$window', '$location', '$rootScope'];

    function CheckoutController(CheckoutFactory, $window, $location, $rootScope) {
    	var checkout = this;

        checkout.cart = $window.localStorage['cart'];
        checkout.paymentmethod = {};

        checkout.addOrder = addOrder;

        function addOrder () {
            var items = [];
            var cart = JSON.parse(checkout.cart);
            for (var key in cart) {
                if (cart.hasOwnProperty(key)) {
                    items.push(cart[key]);
                }
            }

            items = items.map(function(item) {
                return {
                    product: item.product.id,
                    count: item.count
                };
            });

            var order = {
                customer: JSON.parse(window.localStorage['user']).user.id,
                products: items
            };


            CheckoutFactory.addOrder(order)
                .success(function data() {
                    $location.path('/checkout/success');
                });
        }
    };
})();
