express = require "express"
sqlite = require "sqlite3"
app = express()

db = new sqlite.Database 'database.db'

db.serialize ->
  db.run "CREATE TABLE lorem (info TEXT)"

stmt = db.prepare "INSERT INTO lorem VALUES (?)"
for i in [0..10]
  stmt.run "Ipsum " + i
stmt.finalize()

db.each "SELECT rowid AS id, info FROM lorem", (err, row) ->
  console.log row.id + ": " + row.info

db.close();


useCasesMock = [
  name: "Caso de uso 1"
  description: "Descripción del primer caso de uso."
  version: 1
  reference: "header1"
  hreference: "#header1"
,
  name: "Caso de uso 2"
  description: "El segundo caso de uso."
  version: 2
  reference: "header2"
  hreference: "#header2"
]

app.get "/data", (request, response, next) ->
  response.header "Access-Control-Allow-Origin", "*"
  response.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  response.json useCasesMock
  next()

app.listen 8080, ->
  console.log "Escuchando por el puerto 8080"
