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
      <input class="form-control" v-model="goal">
    </div>
    <div class="form-group">
      <label>Pre-conditions:</label>
      <input class="form-control" v-model="precondition"/>
    </div>
    <div class="form-group">
      <label>Trigger:</label>
      <input class="form-control" v-model="trigger"/>
    </div>
    <div class="card">
      <div class="card-header">Basic Course Steps</div>
      <div class="card-block">
        <step v-for="item in course" :key="item.index" v-bind:index="item.index"></step>
      </div>
    </div>
    <div class="card">
      <div class="card-header">Extensions:</div>
      <div class="card-block">
        <extension
                v-for="(item, index) in extensions"
                :key="item.id"
                v-bind:index="index"
                v-bind:item="item"
                v-bind:course="course">
        </extension>
        <template v-for="item in extensions">
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
      <input class="form-control" v-model="comment">
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
                }
            };
        },
        components: {
            step: Step,
            extension: Extension
        },

        methods: {
            addExtension: function () {
                this.$store.commit("NewCaseStore/addExtension");
            },
            changeParentStep: function (parentStep, index) {
                this.extensions[index].parentStep = parentStep;
            },

            toggleAddActor: function () {
                this.state.isAddingActor = true;
            },

            saveNewUseCase: function () {
                axios.post("http://localhost:8081/add_new_case", newCase)
                    .then(() => {
                        console.log("Saved");
                    })
                    .catch(() => {
                        console.log("Failed");
                    });
            }
        },
        computed: {
            name: {
                get() {return this.$store.state.NewCaseStore.name;},
                set(value) {this.$store.commit("NewCaseStore/setName", value);}
            },
            description: {
                get() {return this.$store.state.NewCaseStore.description;},
                set(value) {this.$store.commit("NewCaseStore/setDescription", value);}
            },
            version: {
                get() {return this.$store.state.NewCaseStore.version;},
                set(value) {this.$store.commit("NewCaseStore/setVersion", value);}
            },
            actors: {
                get() {return this.$store.state.NewCaseStore.actors;},
                set(value) {this.$store.commit("NewCaseStore/setActors", value);}
            },
            goal: {
                get() {return this.$store.state.NewCaseStore.goal;},
                set(value) {this.$store.commit("NewCaseStore/setGoal", value);}
            },
            precondition: {
                get() {return this.$store.state.NewCaseStore.precondition;},
                set(value) {this.$store.commit("NewCaseStore/setPrecondition", value);}
            },
            trigger: {
                get() {return this.$store.state.NewCaseStore.trigger;},
                set(value) {this.$store.commit("NewCaseStore/setTrigger", value);}
            },
            comment: {
                get() {return this.$store.state.NewCaseStore.comment;},
                set(value) {this.$store.commit("NewCaseStore/setComment", value);}
            },
            course() {
                return this.$store.state.NewCaseStore.course;
            },
            extensions() {
                return this.$store.state.NewCaseStore.extensions;
            },

        }
    }
</script>