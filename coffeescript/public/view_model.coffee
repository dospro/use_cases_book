

class ViewModel
  constructor: ->
    @data = ko.observableArray()
    @form =
      name: ko.observable()
      version: ko.observable()
      description: ko.observable()
      goal: ko.observable()
      actors: ko.observableArray()
      stakeholders: ko.observableArray()
      course: ko.observableArray()
      extensions: ko.observableArray()
      triggerEvent: ko.observable()
      preCondition: ko.observable()
      posCondition: ko.observable()
      notes: ko.observable()

    @form.name.subscribe (data) ->
      console.log "Name changed to: %o", data


    $.getJSON "http://localhost:8081/data"
    .done (data) =>
      @data data
    .fail ->
      console.log "Failed to get data"

  submitNewUseCase: (data) ->
    console.log "Adding new use case"
    console.log data
    $.post "http://localhost:8081/add", name: @form.name() description: @form.description()
    .done ->
      console.log "Sent"
    return

$ ->
  ko.applyBindings new ViewModel
  return