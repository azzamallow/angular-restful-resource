(function() {
  'use strict';
  angular.module('restfulResource', ['ngResource']);

  angular.module('restfulResource').factory('restfulResource', function($resource) {
    var defaultActions, extend;
    extend = function(from, to) {
      var key, value;
      for (key in to) {
        value = to[key];
        from[key] = value;
      }
      return from;
    };
    defaultActions = {
      update: {
        method: 'PUT'
      }
    };
    return function(url, paramDefaults, actions) {
      actions = extend(defaultActions, actions);
      return $resource(url, paramDefaults, actions);
    };
  });

}).call(this);
