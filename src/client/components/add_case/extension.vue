<template>
  <div>
    <div class="row">
      <div class="col-1">
        <select class="custom-select">
          <option v-for="(step, index) in course">{{ index + 1 }}</option>
        </select>
      </div>
      <div class="col-11">
        <template v-for="step in item.extensionSteps">
          <div class="input-group">
            <span class="input-group-addon"> {{ indexToLetter(step.index) }} </span>
            <input type="text" class="form-control" v-model="step.text">
            <span class="input-group-btn">
              <button class="btn btn-success" title="New Step" v-on:click="addStep(index, step.index)">
                <i class="fa fa-plus"></i>
              </button>
            </span>
            <span class="input-group-btn">
              <button class="btn btn-success" title="Remove Step" v-on:click="removeStep(index, step.index)">
                <i class="fa fa-remove"></i>
              </button>
            </span>
          </div>
        </template>
      </div>
    </div>
    <hr>
  </div>
</template>

<script lang="coffee">
  export default
    props: ['course', 'item', 'index']
    methods:
      indexToLetter: (index) ->
        return (index + 9).toString(36)

      addStep: (extensionIndex, stepIndex) ->
        @$emit 'add-step', extensionIndex, stepIndex
      removeStep: (extensionIndex, stepIndex) -> @$emit 'remove-step', extensionIndex, stepIndex


</script>