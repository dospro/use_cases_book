<template>
  <div class="row">
    <div class="col-8">
      <div class="card">
        <div class="card-header">
          <h5 class="mb-0">
            <a href="#" v-on:click="toggle">{{ item.name }}</a>
          </h5>
        </div>
        <div class="card-block" v-bind:style="{display: state}">
          {{ item.description }}
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="coffee">
  export default
    props: ['item']
    data: ->
      state: 'none'
    methods:
      toggle: () ->
        if @state is 'none'
          @state = 'block'
        else
          @state = 'none'

</script>