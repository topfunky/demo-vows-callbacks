# Demo class to test a callback.
User =
  findByEmail: (email, success, fail) ->
    User.findOne {email:email}, (e, doc) ->
      if (e)
        fail e
      else
        success doc
    @

  findOne: (options, callback) ->
    if options.email.match 'test@example.com'
      callback null, {email:options.email}
    else
      callback new Error("User not found: #{options.email}")

module.exports = User