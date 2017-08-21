<template>
  <div class="input-group">
    <span class="input-group-addon"> {{index}} </span>
    <input type="text" class="form-control" v-model="text">
    <span class="input-group-btn">
      <button class="btn btn-success" title="New Step" v-on:click="">
        <i class="fa fa-plus"></i>
      </button>
    </span>
    <span class="input-group-btn">
      <button class="btn btn-success" title="New Step" v-on:click="">
        <i class="fa fa-remove"></i>
      </button>
    </span>
  </div>
</template>

<script lang="coffee">
  module.exports =
    props: ['indexFromParent']
    data: ->
      index: @indexFromParent
      text: ''
    methods:
      addStep: () ->
        this.$emit('addStep')
      remove: () ->

</script>