<template>
  <div class="container">
    <div class="form-group">
      <label>Name</label>
      <input class="form-control" v-model="name">
    </div>
    <div class="form-group">
      <label>Description</label>
      <textarea class="form-control" v-model="description"></textarea>
    </div>
    <div class="row">
      <div class="col-4">
        <label>Version: {{ version }}</label>
      </div>
      <div class="col-8">
        <div class="input-group">
          <label>Actors:</label>
          <select class="custom-select">
            <template v-for="actor in actors">
              <option>{{ actor }}</option>
            </template>
          </select>
          <span class="input-group-btn">
            <button class="btn btn-primary">Add</button>
          </span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label>Goal</label>
      <input class="form-control" v-model="goal">
    </div>
    <div class="card">
      <div class="card-header">Basic Course Steps</div>
      <div class="card-block">
        <template v-for="item in course">
          TODO
        </template>
      </div>
    </div>
    <div class="card">
      <div class="card-header">Extensions:</div>
      <div class="card-block">
        <template v-for="(item, index) in extensions">
          TODO
        </template>
        <div class="offset-10 col-2">
          <span class="input-group-btn">
            <button class="btn btn-primary" title="Add extensions" @click="addExtension">
              New extension
            </button>
          </span>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label>Pre-conditions:</label>
      <input class="form-control" v-model="precondition">
    </div>
    <div class="form-group">
      <label>Pos-conditions:</label>
      <input class="form-control" v-model="poscondition">
    </div>
    <div class="form-group">
      <label>Comments:</label>
      <input class="form-control" v-model="comment">
    </div>
    <div class="row">
      <button class="btn btn-primary offset-10 col-2" :click="saveNewUseCase">
        Save changes
      </button>
    </div>
  </div>
</template>


<script lang="coffee">
  import axios from 'axios'
  import {addItemToList, removeItemFromList} from '../../utils.coffee'


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

  export default
    data: () ->
      return newCase
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
        axios.post "http://localhost:8081/add_new_case", newCase
          .then ->
            console.log "Saved"
          .catch ->
            console.log "Failed"
</script>