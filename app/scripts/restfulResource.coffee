'use strict'

angular.module 'restfulResource', ['ngResource']

angular.module('restfulResource')
  .factory 'restfulResource', ($resource) ->
    extend = (from, to) ->
      for key, value of to
        from[key] = value
      from

    defaultActions = 
      update:
        method: 'PUT'

    (url, paramDefaults, actions) ->
      actions = extend defaultActions, actions
      $resource url, paramDefaults, actions