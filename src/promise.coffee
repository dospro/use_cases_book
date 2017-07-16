class Promise
  constructor: () ->
    @ready = false
    @successHandler = null
    @failHandler = null

  done: (successHandler) ->
    @successHandler = successHandler
    return @

  fail: (failHandler) ->
    @failHandler = failHandler
    return @

  resolve: (data) ->
    @ready = true
    @successHandler(data)
    return @

  reject: (errorMessage) ->
    @ready = true
    @failHandler errorMessage
    return @

exports.Promise = Promise