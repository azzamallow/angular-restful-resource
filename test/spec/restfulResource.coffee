'use strict'

describe 'Factory: restfulResource', ->

  $resource = null

  beforeEach ->
    $resource = jasmine.createSpy '$resource'

    module 'restfulResource', ($provide) ->
      $provide.provider "$resource", ->
        $get: -> $resource
      null

  restfulResource = {}
  beforeEach inject (_restfulResource_) ->
    restfulResource = _restfulResource_

  it 'should accept a url', ->
    restfulResource 'my/resource/1'
    url = $resource.mostRecentCall.args[0]
    expect(url).toEqual 'my/resource/1'

  it 'should accept paramDefaults', ->
    restfulResource null, id: '@id'
    paramDefaults = $resource.mostRecentCall.args[1]
    expect(paramDefaults).toEqual id: '@id'

  it 'should accept actions', ->
    restfulResource null, null, buy: array: false
    actions = $resource.mostRecentCall.args[2]
    expect(actions.buy).not.toBeNull()
    expect(actions.buy).toEqual array: false

  it 'should extend actions with update action', ->
    restfulResource null, null, buy: array: false
    actions = $resource.mostRecentCall.args[2]
    expect(actions.update).not.toBeNull()
    expect(actions.update).toEqual method: 'PUT'