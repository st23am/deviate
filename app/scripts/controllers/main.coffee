'use strict'

angular.module('deviateApp.controllers', [])
  .controller 'ListCtrl', ($scope, Characters, Initiative) ->
    $scope.characters = Characters
    $scope.initiative = Initiative

    $scope.addToInitiative = (character) ->
      character.initScore = parseInt(character.initMod)
      $scope.initiative.push(character)

    $scope.removeFromInitiative = (character) ->
      $scope.initiative.splice($scope.initiative.indexOf(character),1)

  .controller 'CreateCtrl', ($scope, $location, $timeout, Characters) ->

    $scope.modifier = (score)->
      ability_modifier(score)

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

      $scope.modifier = (score)->
        ability_modifier(score)

ability_modifier = (score) ->
  score = parseInt(score)
  return "-3" if score == 3
  return "-2" if score == 4 || score == 5
  return "-1" if score == 6 || score == 7 || score == 8
  return "0" if score == 9 || score == 10 || score == 11 || score == 12
  return "+1" if score == 13 || score == 14 || score == 15
  return "+2" if score == 16 || score == 17
  return "+3" if score >= 18

