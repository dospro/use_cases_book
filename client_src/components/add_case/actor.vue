<template>
  <div class="">
    <label>Actors:</label>
    <select class="form-control">
      <template v-for="actor in this.actors">
        <option>{{ actor }}</option>
      </template>
    </select>
    <div v-if="isAddingActor">
      <label>Actor Name:</label>
      <input type="text"/>
    </div>
  </div>
</template>

<script>
    export default {
        props: ['actors'],
        data: function () {
            return {
                isAddingActor: false
            }
        },
        methods: {
            selectActor: function () {
                this.$emit("select-actor")
            },
            toggleAddActor: function () {
                this.isAddingActor = true;
            }
        }
    }
</script>

<style scoped>

</style>