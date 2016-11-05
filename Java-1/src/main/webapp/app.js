angular.module('index', []).controller('products', function ($scope, $http) {
	$http.get('/api/products').
		success(function(data) {
			$scope.products = data;
		});


	// $scope.orderId = $cookieStore.get('orderId');

	if ($scope.orderId == undefined) {
		$http.post('/api/orders', {}).
			success(function(data) {
				$scope.orderId = data.id;
				//$cookieStore.put('orderId', $scope.orderId);
			});
	}
});