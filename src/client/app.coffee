import Promise from 'es6-promise'
import axios from 'axios'

app = new Vue
  el: "#app"
  data:
    items: []

externalData = null
axios.get "http://localhost:8081/list_cases"
  .then (response) ->
    console.log response.data
    app.items = response.data
  .catch (err) ->
    console.log "Failed to get data %o", err