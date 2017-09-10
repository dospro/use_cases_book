import Promise from 'es6-promise'
import axios from 'axios'
import Box from './components/box.vue'

app = new Vue
  el: "#app"
  components: {
    Box
  }
  data:
    items: []

externalData = null
axios.get "http://localhost:8081/list_cases"
  .then (response) ->
    console.log response.data
    app.items = response.data
  .catch (err) ->
    console.log "Failed to get data %o", err