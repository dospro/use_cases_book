import { addItemToList, removeItemFromList } from '../utils.coffee'

newCaseApp = new Vue
  el: "#newCaseApp"
  data:
    name: "Escriba un nombre"
    version: 10
    description: "Escriba una descripción"
    course: [
      {
        index: 1
        text: ""
      }
    ]
    extensions: [
      {
        parentStep: 1
        extensionSteps: [
          {
            index: 1
            text: ""
          }
        ]
      }
    ]
  methods:
    addCourseStep: (stepId) ->
      newStep =
        index: stepId
        text: ""
      addItemToList @course, stepId, newStep

    removeCourseStep: (stepId) ->
      removeItemFromList @course, stepId

    addExtension: ->
      newItem = {
        parentStep: 1
        extensionSteps: [
          {
            index: 1
            text: ""
          }
        ]
      }

      @extensions.push newItem

    addExtensionStep: (extensionIndex, stepId) ->
      newStep =
        index: stepId
        text: ""
      addItemToList @extensions[extensionIndex].extensionSteps, stepId, newStep


    removeExtensionStep: (extensionIndex, stepId) ->
      removeItemFromList @extensions[extensionIndex].extensionSteps, stepId

    indexToLetter: (index) ->
      return (index + 9).toString(36)

