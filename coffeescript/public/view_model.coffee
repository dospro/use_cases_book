

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


    @form.course.push
      index: 1
      text: ko.observable "Empty"

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

  addStep: (stepData) =>
    stepNumber = stepData.index
    totalSteps = @form.course().length

    # Add a new empty slot at the end.
    @form.course.push
      index: totalSteps + 1
      text: ko.observable ""

    # Move all items
    tempText = ""
    steps = @form.course()
    for i in [stepNumber..totalSteps]
      temp = steps[i].text()
      steps[i].text tempText
      tempText = temp

  removeStep: (stepData) =>
    console.log "Remove #{stepData.index}"
    console.log "Move everything down"


  _swap: (objectA, objectB) ->
    temp = objectA
    objectA = objectB
    objectB = temp
    return

$ ->
  ko.applyBindings new ViewModel
  return