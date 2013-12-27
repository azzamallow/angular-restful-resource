'use strict'

describe 'Factory: restfulResource', ->

  # load the service's module
  beforeEach module 'restfulResource'

  # instantiate service
  restfulResource = {}
  beforeEach inject (_restfulResource_) ->
    restfulResource = _restfulResource_

  it 'should do something', () ->
    expect(!!restfulResource).toBe true
