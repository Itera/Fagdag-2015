(function() {
	angular
		.module('retailApp')
		.config(function($routeProvider) {
			$routeProvider
				.when('/', {
					templateUrl: 'components/index/index.client.view.html'
				})
				.when('/login', {
					templateUrl: 'components/login/login.client.view.html'
				})
				.otherwise({
					redirectTo: '/'
				});
		});

})();