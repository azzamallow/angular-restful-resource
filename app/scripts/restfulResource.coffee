'use strict'

angular.module 'restfulResource', []

angular.module('restfulResource')
  .factory 'restfulResource', ->
    # Service logic
    # ...

    meaningOfLife = 42

    # Public API here
    {
      someMethod: ->
        meaningOfLife
    }
