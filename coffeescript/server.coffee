express = require "express"
bodyParser =  require "body-parser"
database = require "./db_interface"
app = express()
db = new database.Connection "database.db"

app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true

app.get "/data", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  db.getUseCases (rows) ->
    useCases = []
    for row in rows
      newData =
        name: row.name
        description: row.description
        version: row.version
        date: row.date
        reference: "header#{row.id}"
        hReference: "#header#{row.id}"
      useCases.push newData
    response.json useCases

app.post "/add", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  db.addUseCase request.body
  response.end()


app.listen 8081, ->
  console.log "Listening port 8081"
