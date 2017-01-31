class ViewModel
  constructor: ->
    @data = ko.observableArray()
    @form =
      name: ko.observable()
      description: ko.observable()


    $.getJSON "http://localhost:8081/data"
    .done (data) =>
      @data data
    .fail ->
      console.log "Failed to get data"

  submitNewUseCase: (data) ->
    console.log "Adding new use case"
    console.log data
    return

$ ->
  ko.applyBindings new ViewModel
  return