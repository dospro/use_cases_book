class Step
  constructor: (index, text) ->
    @index = index
    @text = ko.observable text


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


    @form.course.push new Step(1, "Empty")

    @form.extensions.push
      index: 1
      courseStep: @form.course[0]
      steps: ko.observableArray [new Step(1, "Nothing")]

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
    totalSteps = @form.course().length
    steps = @form.course()

    if stepData.index > totalSteps
      console.log "Error: Can't delete undefined step"
      return

    if totalSteps == 1
      console.log "Can't remove first step"
      return

    if stepData.index == totalSteps
      console.log "Removing last step"
      @form.course.pop()
      return

    for i in [stepData.index..totalSteps - 1]
      steps[i - 1].text steps[i].text()

    @form.course.pop()

  addExtension: (extensionData) =>
    console.log "Adding extension"
    extensionNumber = extensionData.index
    totalExtensions = @form.extensions().length

    # Add a new empty slot at the end.
    @form.extensions.push
      index: totalExtensions + 1
      courseStep: @form.course[0]
      steps: ko.observableArray [new Step(1, "Empty")]


  addExtensionStep: (stepData) =>
    console.log "Adding extension step"

  removeExtensionStep: (stepData) =>
    console.log "Removing step"

  setCourseStep: (data) =>
    console.log data

$ ->
  ko.applyBindings new ViewModel
  return