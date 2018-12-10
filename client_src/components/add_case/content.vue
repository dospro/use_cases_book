<template>
  <div class="container">
    <div class="form-group">
      <label>Name</label>
      <input class="form-control" v-model="newCase.name">
    </div>
    <div class="form-group">
      <label>Description</label>
      <textarea class="form-control" v-model="newCase.description"></textarea>
    </div>
    <div class="row">
      <div class="col-4">
        <label>Version: {{ newCase.version }}</label>
      </div>
      <div class="col-8">
        <div class="input-group">
          <label>Actors:</label>
          <select class="custom-select">
            <template v-for="actor in newCase.actors">
              <option>{{ actor }}</option>
            </template>
          </select>
          <span class="input-group-btn">
            <button class="btn btn-primary" v-on:click="toggleAddActor">Add</button>
          </span>
          <div v-if="state.isAddingActor">
            <label>Actor Name:</label>
            <input type="text"/>
          </div>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label>Goal</label>
      <input class="form-control" v-model="newCase.goal">
    </div>
    <div class="form-group">
      <label>Pre-conditions:</label>
      <input class="form-control" v-model="newCase.precondition"/>
    </div>
    <div class="form-group">
      <label>Trigger:</label>
      <input class="form-control" v-model="newCase.trigger"/>
    </div>
    <div class="card">
      <div class="card-header">Basic Course Steps</div>
      <div class="card-block">
        <step v-for="item in newCase.course"
              :key="item.index"
              v-bind:item="item"
              v-on:add-step="addStep"
              v-on:remove-step="removeStep">
        </step>
      </div>
    </div>
    <div class="card">
      <div class="card-header">Extensions:</div>
      <div class="card-block">
        <extension
                v-for="(item, index) in newCase.extensions"
                :key="item.id"
                v-bind:extension-index="index"
                v-bind:extension="item"
                v-bind:steps-list="newCase.course"
                v-on:add-extension-step="addExtensionStep"
                v-on:remove-extension-step="removeExtensionStep"
                v-on:change-parent-step="changeParentStep">
        </extension>
        <template v-for="item in newCase.extensions">
          <h3>{{ item.parentStep }}</h3>
          <ul>
            <li v-for="step in item.extensionSteps" :key="step.id">{{ step.index }} : {{ step.text }}</li>
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
      <label>Comments:</label>
      <input class="form-control" v-model="newCase.comment">
    </div>
    <div class="row">
      <button class="btn btn-primary offset-10 col-2" v-on:click="saveNewUseCase">
        Save changes
      </button>
    </div>
  </div>
</template>


<script>
    import axios from 'axios';
    import Step from './step.vue';
    import Extension from './extension.vue';

    export default {
        data: function () {
            return {
                state: {
                    isAddingActor: false
                },
                newCase: {
                    name: "",
                    description: "",
                    version: 1,
                    actors: [],
                    goal: "",
                    precondition: "",
                    trigger: "",
                    comment: "",
                    course: [
                        {
                            index: 1,
                            text: ""
                        }
                    ],
                    extensions: [
                        {
                            parentStep: 1,
                            extensionSteps: [
                                {
                                    index: 1,
                                    text: ""
                                }
                            ]
                        }
                    ]
                }
            }
        },
        components: {
            step: Step,
            extension: Extension
        },

        methods: {
            addStep: function (currentStepIndex) {
                const newStep = {
                    index: currentStepIndex,
                    text: ""
                };
                this._addItemToList(this.newCase.course, currentStepIndex, newStep);
            },
            removeStep: function (index) {
                this._removeItemFromList(this.newCase.course, index);
            },
            addExtension: function () {
                const newItem = {
                    parentStep: 1,
                    extensionSteps: [
                        {
                            index: 1,
                            text: ""
                        }
                    ]
                }
                this.newCase.extensions.push(newItem);
            },
            changeParentStep: function (parentStep, index) {
                this.newCase.extensions[index].parentStep = parentStep;
            },
            addExtensionStep: function (stepIndex, extensionIndex) {
                const newStep = {
                    index: stepIndex,
                    text: ""
                };
                this._addItemToList(this.newCase.extensions[extensionIndex].extensionSteps, stepIndex, newStep);
            },
            removeExtensionStep: function (stepIndex, extensionIndex) {
                this._removeItemFromList(this.newCase.extensions[extensionIndex].extensionSteps, stepIndex);
            },
            toggleAddActor: function () {
                this.state.isAddingActor = true;
            },

            saveNewUseCase: function () {
                axios.post("http://localhost:8081/add_new_case", this.newCase)
                    .then(() => {
                        console.log("Saved");
                    })
                    .catch(() => {
                        console.log("Failed");
                    });
            },
            _addItemToList(itemsList, index, newItem) {
                let stepIndex = index - 1;
                let total = itemsList.length;

                if (stepIndex >= total) {
                    console.log("Out of index");
                    return;
                }

                itemsList.splice(stepIndex + 1, 0, newItem);
                stepIndex++;
                total = itemsList.length;
                for (let i = stepIndex; i < total; ++i) {
                    itemsList[i].index++;
                }
            },
            _removeItemFromList(itemsList, index) {
                let stepIndex = index - 1;
                let total = itemsList.length;
                if (total === 1) {
                    console.log("Only one element left");
                    return;
                }
                if (stepIndex >= total) {
                    console.log("Out of index");
                    return;
                }

                itemsList.splice(stepIndex, 1);
                total = itemsList.length;
                if (stepIndex < total) {
                    for (let i = stepIndex; i < total; ++i) {
                        itemsList[i].index--;
                    }
                }
            }
        }
    }
</script>