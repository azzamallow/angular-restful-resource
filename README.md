angular-restful-resource
========================

An AngularJS Factory built around $resource, adds update action which uses a PUT method

install
-------

```
bower install angular-restful-resource
```

usage
-----

Make sure you include the module in your application config

```
angular.module('myApp', [
  'restfulResource',
  ...
]);
```

Define your resource as you would with $resource

```
'use strict'

angular.module('myApp')
  .factory 'Listing', (restfulResource) ->
    restfulResource "/listing/:id", id: '@id'
```

Now you can invoke an update which will perform a PUT

```
listing = Listing.get({id: 1});

// ... change listing

listing.$update()
```
