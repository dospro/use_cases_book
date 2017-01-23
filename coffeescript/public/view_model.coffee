class ViewModel
  constructor: ->
    @data = ko.observableArray()

    $.getJSON "http://localhost:8081/data"
    .done (data) =>
      @data data
    .fail ->
      console.log "Failed to get data"

  addUseCaseEvent: ->
    # @data.push "Something"
    console.log "Adding new use case"
    return

$ ->
  ko.applyBindings new ViewModel
  return