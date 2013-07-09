'use strict'
deviateApp = angular.module('deviateApp', ['firebase', 'deviateApp.controllers'])
  .value("fbURL", "https://dcccharacters.firebaseio.com/")
  .factory "Characters", (angularFireCollection,  fbURL) ->
      angularFireCollection(fbURL)
  .factory "Initiative", ->
    []

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


