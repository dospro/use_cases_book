<template>
  <div class="container">
    <Box v-for="item in items" :item="item"></Box>
    <div class="row">
      <div class="col-4">
        <a class="btn btn-primary" href="#" @click="gotoAddCase">
          Nuevo Caso de Uso
        </a>
      </div>
    </div>
  </div>
</template>


<script lang="coffee">
  import axios from 'axios'
  import Box from './box.vue'

  export default
    components:
      'Box': Box

    data: () ->
      items: []

    methods:
      gotoAddCase: () ->
        @$emit 'add-case'

    mounted: () ->
      axios.get "http://localhost:8081/list_cases"
        .then (response) =>
          @items = response.data
        .catch (err) ->
          console.log "Failed to get data %o", err
</script>