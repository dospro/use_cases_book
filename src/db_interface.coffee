sqlite = require "sqlite3"
Promise = require("./promise").Promise

class Connection
  constructor: (dbFilename) ->
    @db = new sqlite.Database dbFilename

  getUseCases: ->
    promise = new Promise
    sqlQuery = "select id, name, description, version, current_date from use_cases"
    @db.all sqlQuery, (err, rows) ->
      if err?
        promise.reject err
        console.log err
        return
      promise.resolve rows
    return promise


  addUseCase: (dataObject) ->
    sqlQuery = "insert into use_cases(name, description) values(?, ?);"
    payload = [dataObject.name, dataObject.description]
    @db.run sqlQuery, payload, (err) ->
      console.log "An error occurred #{err}"

exports.Connection = Connection