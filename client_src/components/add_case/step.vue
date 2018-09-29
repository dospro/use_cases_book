<template>
  <div class="input-group">
    <span class="input-group-addon"> {{index}} </span>
    <input type="text" class="form-control" v-model="text">
    <span class="input-group-btn">
      <button class="btn btn-success" title="New Step" v-on:click="addStep">
        <i class="fa fa-plus"></i>
      </button>
    </span>
    <span class="input-group-btn">
      <button class="btn btn-success" title="Remove Step" v-on:click="removeStep">
        <i class="fa fa-remove"></i>
      </button>
    </span>
  </div>
</template>

<script>
    export default {
        props: ['index'],
        methods: {
            addStep: function () {
                this.$store.commit("NewCaseStore/addStep", this.index);
            },
            removeStep: function () {
                this.$store.commit("NewCaseStore/removeStep", this.index);
            }
        },
        computed: {
            text: {
                get() {
                    return this.$store.state.NewCaseStore.course[this.index - 1].text;
                },
                set(value) {
                    this.$store.commit("NewCaseStore/setStepText", {
                        index: this.index - 1,
                        text: value
                    });
                }
            }
        }
    }
</script>