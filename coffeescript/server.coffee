express = require "express"
sqlite = require "sqlite3"
app = express()

useCases = []
counter = 1
db = new sqlite.Database 'database.db'
db.each "select name, description from use_cases", (err, row) ->
  newData =
    name: row.name
    description: row.description
    version: row.id
    reference: "header#{counter}"
    hreference: "#header#{counter}"
  useCases.push newData
  counter++
db.close();

app.get "/data", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  response.json useCases
  next()

app.listen 8081, ->
  console.log "Escuchando por el puerto 8080"
