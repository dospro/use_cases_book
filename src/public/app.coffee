import {ajax} from "./ajax.coffee"

app = new Vue
  el: "#app"
  data:
    items: []

externalData = null
ajax.get "http://localhost:8081/data"
  .then (data) ->
    app.items = JSON.parse data
  .fail (err) ->
    console.log "Failed to get data %o", err