class Promise
  constructor: () ->
    @ready = false
    @successHandlers = []
    @failHandler = null

  then: (successHandler) ->
    @successHandlers.push successHandler
    return @

  fail: (failHandler) ->
    @failHandler = failHandler
    return @

  resolve: (data) ->
    try
      for handler in @successHandlers
        handler data
    catch e
      console.log e

    @ready = true
    return @

  reject: (errorMessage) ->
    @ready = true
    @failHandler errorMessage
    return @

exports.Promise = Promise