﻿var shoebalooWebApp = angular.module('shoebalooWeb',
[
    'ngRoute'
]);

shoebalooWebApp.config(['$routeProvider', function($routeProvider) {
    var root = 'Scripts/angular/';

    $routeProvider.when('/', {
        controller: 'RootController',
        templateUrl: root + 'views/root.html'
    }).when('/item', {
        controller: 'ItemController',
        templateUrl: root + 'views/item.html'
    });
}]);