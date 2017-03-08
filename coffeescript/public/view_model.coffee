

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


    for i in [1..3]
      @form.course.push({index: i, text: "Write step #{i} description."})


    $.getJSON "http://localhost:8081/data"
    .done (data) =>
      console.log "Getting data"
      @data data
      console.log "Received"
      console.log "Data: %o", @data()
    .fail ->
      console.log "Failed to get data"

  submitNewUseCase: (data) =>
    console.log "Adding new use case"
    console.log data
    params =
      name: @form.name()
      description: @form.description()
    $.post "http://localhost:8081/add", params
    .done ->
      # TODO: Tell the client to refresh
      console.log "Sent"
    return

$ ->
  ko.applyBindings new ViewModel
  return