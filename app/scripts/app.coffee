'use strict'

angular.module('deviateApp', ['firebase'])
  .value("fbURL", "https://dcccharacters.firebaseio.com/")
  .factory "Characters", (angularFireCollection,  fbURL) ->
    angularFireCollection(fbURL)
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: ListCtrl
      .when '/edit/:characterId',
        templateUrl: 'views/detail.html'
        controller:  EditCtrl
      .when '/new',
        templateUrl: 'views/detail.html'
        controller:  CreateCtrl
      .otherwise
        redirectTo: '/'

  ListCtrl = ($scope, Characters) ->
    $scope.characters = Characters

  CreateCtrl = ($scope, $location, $timeout, Characters) ->
    $scope.save = ->
      Characters.add $scope.character, ->
        $timeout ->
          $location.path "/"


  EditCtrl = ($scope, $location, $routeParams, angularFire, fbURL) ->
    angularFire(fbURL + $routeParams.characterId, $scope, "remote", {}).then ->
      $scope.character = angular.copy($scope.remote)
      $scope.character.$id = $routeParams.characterId
      $scope.isClean = ->
        angular.equals $scope.remote, $scope.character

      $scope.destroy = ->
        $scope.remote = null
        $location.path "/"

      $scope.save = ->
        $scope.remote = angular.copy($scope.character)
        $location.path "/"

