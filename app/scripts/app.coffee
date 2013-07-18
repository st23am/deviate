'use strict'
deviateApp = angular.module('deviateApp', ['firebase', 'deviateApp.routes', 'deviateApp.controllers'])
  .value("fbURL", "https://dcccharacters.firebaseio.com/")

  .factory "Characters", (angularFireCollection,  fbURL) ->
    angularFireCollection(fbURL)
  .factory "Initiative", ->
    initiative = JSON.parse(localStorage.getItem("initiative"))
    if initiative == null or initiative.length ==  0
      localStorage.setItem("initiative", JSON.stringify([]))
      initiative = JSON.parse(localStorage.getItem("initiative"))
    initiative

