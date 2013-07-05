'use strict'

angular.module('deviateApp.controllers', [])
  .controller 'ListCtrl', ($scope, Characters) ->
    $scope.characters = Characters

  .controller 'ListCtrl', ($scope, Characters) ->
    $scope.characters = Characters

  .controller 'CreateCtrl', ($scope, $location, $timeout, Characters) ->
    $scope.save = ->
      Characters.add $scope.character, ->
        $timeout ->
          $location.path "/"

  .controller 'EditCtrl', ($scope, $location, $routeParams, angularFire, fbURL) ->
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

