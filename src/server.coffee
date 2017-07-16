express = require "express"
bodyParser = require "body-parser"
path = require "path"
api = require "./new_case_api"

app = express()

app.set "view engine", "pug"
app.set 'views', path.join(__dirname, '../public/views')
app.use express.static(path.join(__dirname, '../public'))
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true

app.get "/", (request, response, next) ->
  response.render "base"

app.get "/new", (request, response, next) ->
  response.render "new_case/new_case"

app.post "/add_new_case", (request, response, next) ->
  api.addNewCase request.body
  response.end()

app.post "/add_new_actor", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  api.addNewActor null
  response.end()

app.post "/update_case", (request, response, next) ->
  api.updateCase null
  response.end()

app.get "/data", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  api.getAllCases()
    .done (result) ->
      response.json result
      response.end()

app.listen 8081, ->
  console.log "Listening port 8081"
