<template>
  <div>
    <div class="row">
      <div class="col-1">
        <select class="custom-select" v-model="parentStep" v-on:change="changeParentStep">
          <option v-for="(step, index) in stepsList">{{ index + 1 }}</option>
        </select>
      </div>
      <div class="col-11">
        <step v-for="step in extension.extensionSteps"
              :key="step.index"
              v-bind:item="step"
              v-on:add-step="addStep"
              v-on:remove-step="removeStep">
        </step>
      </div>
    </div>
    <hr>
  </div>
</template>

<script>
    import step from './step.vue';

    export default {
        components: {step},
        props: {
            'steps-list': Array,
            'extension': Object,
            'extension-index': Number
        },
        data: function () {
            return {
                parentStep: 1
            }
        },
        methods: {
            indexToLetter: function (index) {
                return (index + 9).toString(36);
            },

            addStep: function (extensionStepIndex) {
                this.$emit("add-extension-step", extensionStepIndex, this.extensionIndex);
            },
            removeStep: function (extensionStepIndex) {
                this.$emit("remove-extension-step", extensionStepIndex, this.extensionIndex);
            },
            changeParentStep: function () {
                this.$emit('change-parent-step', this.parentStep, this.extensionIndex);
            }
        }
    }

</script>