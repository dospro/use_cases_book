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
        <step
          v-for="item in course"
          v-on:add-step="addCourseStep(item.index)"
          v-on:remove-step="removeCourseStep(item.index)"
          v-bind:item="item">
        </step>
      </div>
    </div>
    <div class="card">
      <div class="card-header">Extensions:</div>
      <div class="card-block">
        <extension
          v-for="(item, index) in extensions"
          v-on:add-step="addExtensionStep"
          v-on:remove-step = "removeExtensionStep"
          v-bind:index="index"
          v-bind:item="item"
          v-bind:course="course">
        </extension>
        <template v-for="item in extensions">
          <h3>{{ item.parentStep }}</h3>
          <ul>
            <li v-for="step in item.extensionSteps">{{ step.index }} : {{ step.text }}</li>
          </ul>
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
  import Step from './step.vue'
  import Extension from './extension.vue'


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
    components:
      step: Step
      extension: Extension
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

      saveNewUseCase: ->
        axios.post "http://localhost:8081/add_new_case", newCase
          .then ->
            console.log "Saved"
          .catch ->
            console.log "Failed"
</script>