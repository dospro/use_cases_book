express = require "express"
bodyParser =  require "body-parser"
sqlite = require "sqlite3"
app = express()

app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true

useCases = []
counter = 1
db = new sqlite.Database 'database.db'
db.each "select name, description, version, current_date from use_cases", (err, row) ->
  if err?
    console.log err
    return
  newData =
    name: row.name
    description: row.description
    version: row.version
    date: row.date
    reference: "header#{counter}"
    hReference: "#header#{counter}"
  useCases.push newData
  counter++
db.close();

app.get "/data", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  response.json useCases
  next()

app.post "/add", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  name = request.body.name
  description = request.body.description

  console.log "Recieved %o", name + description

  next()

app.listen 8081, ->
  console.log "Escuchando por el puerto 8081"
