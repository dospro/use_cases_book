<template>
  <div class="container">
    <Draggable v-model="items">
      <transition-group name="main-list">
        <Box v-for="item in items" :item="item" :key="item.id" class="main-list-item"></Box>
      </transition-group>
    </Draggable>
    <div class="row">
      <div class="col-4">
        <router-link to="/add_case" class="btn btn-primary">
          Nuevo Caso de Uso
        </router-link>
      </div>
    </div>
  </div>
</template>


<script>
    import axios from 'axios';
    import draggable from 'vuedraggable';
    import Box from './box.vue';

    export default {
        components: {
            'Box': Box,
            'Draggable': draggable
        },

        data: function () {
            return {
                items: []
            };
        },

        mounted: function () {
            axios.get("http://localhost:8081/cases/")
                .then((response) => {
                    this.items = response.data;
                })
                .catch((err) => {
                    console.log("Failed to get data %o", err);
                });
        }
    }
</script>

<style>
  .main-list-item {
    transition: all 1s;
  }
</style>