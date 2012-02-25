# Demo class to test a callback.
User =
  # NOTE: The Node.js convention is for callbacks to take (err, object) as arguments.
  # You should probably design your API so it takes a single callback and calls it with
  # either:
  #   callback(new Error('It blew up'))
  # or:
  #   callback(null, 'My fancy object')
  findByEmail: (email, success, fail) ->
    User.findOne {email:email}, (err, doc) ->
      if (err)
        fail err
      else
        success doc
    @

  findOne: (options, callback) ->
    if options.email.match 'test@example.com'
      callback null, {email:options.email}
    else
      callback new Error("User not found: #{options.email}")

module.exports = User