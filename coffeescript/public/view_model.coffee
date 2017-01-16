model =
  data: ko.observableArray()

$.getJSON "http://localhost:8080/data"
  .done (data) ->
    model.data data
  .fail ->
    console.log "Failed to get data"


ko.applyBindings model