vows = require 'vows'
assert = require 'assert'

suite = vows.describe 'callback'
suite.addBatch
  'success':
    topic: []
    'test': (topic) ->
      assert.equal 1, 1

suite.export module