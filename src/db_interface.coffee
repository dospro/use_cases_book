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
    sqlQuery = "insert into use_cases(
name,
description,
version, goal,
pre_condition,
pos_condition,
notes)
values(?, ?, ?, ?, ?, ?, ?);"
    payload = [
      dataObject.name,
      dataObject.description,
      dataObject.version,
      dataObject.goal,
      dataObject.precondition,
      dataObject.poscondition,
      dataObject.comment
    ]
    @db.run sqlQuery, payload, (err) ->
      if err
        console.log "An error occurred #{err}"
      else
        console.log "Id: %d", @lastID

exports.Connection = Connection