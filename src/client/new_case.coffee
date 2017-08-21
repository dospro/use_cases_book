import {addItemToList, removeItemFromList} from './utils.coffee'
import Promise from 'es6-promise'
import axios from 'axios'

newCase =
  name: "Escriba un nombre"
  description: "Escriba una descripción"
  version: 1
  actors: []
  goal: ""
  precondition: ""
  poscondition: ""
  comment: ""
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

newCaseApp = new Vue
  el: "#newCaseApp"
  data: newCase
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

    saveNewUseCase: ->
      console.log "Finally, saving!!"
      console.log "Sending %o", newCase
      axios.post "http://localhost:8081/add_new_case", newCase
        .then ->
          console.log "Saved"
        .catch ->
          console.log "Failed"

