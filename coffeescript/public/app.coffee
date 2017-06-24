app = new Vue
  el: "#app"
  data:
    items: []

externalData = null
$.getJSON "http://localhost:8081/data"
  .done (data) =>
    console.log "Getting data"
    app.items = data
    console.log "Received"
    console.log "Data: %o", data
  .fail ->
    console.log "Failed to get data"