'use strict'

angular.module('deviateApp.routes', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'ListCtrl'
      .when '/edit/:characterId',
        templateUrl: 'views/detail.html'
        controller:  'EditCtrl'
      .when '/new',
        templateUrl: 'views/detail.html'
        controller:  'CreateCtrl'
      .otherwise
        redirectTo: '/'

