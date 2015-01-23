(function() {
	angular
		.module('retailApp')
		.config(function($locationProvider, $routeProvider) {
			//$locationProvider.html5Mode(true);
			$routeProvider
				.when('/', {
					templateUrl: 'components/overview/overview.client.view.html'
				})
				.when('/login', {
					templateUrl: 'components/login/login.client.view.html'
				})
				.when('/cart', {
					templateUrl: 'components/cart/cart.client.view.html'
				})
				.otherwise({
					redirectTo: '/'
				});
		});

})();
