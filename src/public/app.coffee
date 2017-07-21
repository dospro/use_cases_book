import {ajax} from "./ajax.coffee"

app = new Vue
  el: "#app"
  data:
    items: []

externalData = null
ajax.get "http://localhostt:8081/data"
  .then (data) ->
    console.log "Getting data"
    app.items = JSON.parse data
    console.log "Received"
    console.log "Data: %o", data
  .fail (err) ->
    console.log "Failed to get data %o", err
#$.getJSON "http://localhost:8081/data"
#  .done (data) ->
#    console.log "Getting data"
#    app.items = data
#    console.log "Received"
#    console.log "Data: %o", data
#  .fail (err) ->
#    console.log "Failed to get data %o", err