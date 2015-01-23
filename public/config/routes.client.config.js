(function() {
	angular
		.module('retailApp')
		.config(function($locationProvider, $routeProvider) {
			//$locationProvider.html5Mode(true);
			$routeProvider
				.when('/', {
					templateUrl: 'components/frontpage/frontpage.client.view.html'
				})
				.when('/login', {
					templateUrl: 'components/login/login.client.view.html'
				})
				.when('/register', {
					templateUrl: 'components/register/register.client.view.html'
				})
				.when('/cart', {
					templateUrl: 'components/cart/cart.client.view.html'
				})
				.when('/product-details/:id', {
					templateUrl: 'components/product-details/product-details.client.view.html'
				})
				.otherwise({
					redirectTo: '/'
				});
		})
		.run(function(productService) {
			console.log('fooo')
			productService.fetch();
		});
})();
