import {Promise} from "./promise.coffee"

class Ajax
  constructor: ->

  get: (requestUrl) ->
    promise = new Promise()
    xmlRequest = new XMLHttpRequest()
    xmlRequest.onreadystatechange = ->
      if xmlRequest.readyState == XMLHttpRequest.DONE
        if xmlRequest.status == 200
          promise.resolve xmlRequest.responseText
        else
          promise.reject "Error: #{xmlRequest.response}"

    xmlRequest.onerror = ->
      promise.reject "Error: #{xmlRequest.statusText}"

    xmlRequest.open "GET", requestUrl
    xmlRequest.send()
    return promise


  post: (requestUrl, params)->
    promise = new Promise()
    xmlRequest = new XMLHttpRequest()
    xmlRequest.onreadystatechange = ->
      if xmlRequest.readyState == XMLHttpRequest.DONE
        if xmlRequest.status == 200
          promise.resolve xmlRequest.responseText
        else
          promise.reject xmlRequest.statusText

    xmlRequest.open "POST", requestUrl
    xmlRequest.send(params)
    return promise

ajax = new Ajax()

export {ajax}