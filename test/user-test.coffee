vows   = require 'vows'
assert = require 'assert'
User   = require "#{__dirname}/../lib/user"

suite = vows.describe 'User'
suite.addBatch
  'valid email':
    topic: ->
      successCallback = (doc) =>
        @callback null, doc
      User.findByEmail 'test@example.com', successCallback
      undefined
    'succeeds': (err, doc) ->
      assert.equal doc.email, 'test@example.com'

suite.addBatch
  'invalid email':
    topic: ->
      errorCallback = (err) =>
        @callback null, err
      User.findByEmail 'does-not-exist@example.com', null, errorCallback
      undefined
    'errors': (ignore, err) ->
      assert.equal err.message, 'User not found: does-not-exist@example.com'

suite.export module