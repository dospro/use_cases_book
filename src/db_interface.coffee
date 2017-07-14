sqlite = require "sqlite3"

class Connection
  constructor: (dbFilename) ->
    @db = new sqlite.Database dbFilename

  getUseCases: (callback) ->
    @db.all "select id, name, description, version, current_date from use_cases", (err, rows) ->
      if err?
        console.log err
        return
      callback rows


  addUseCase: (dataObject) ->
    @db.run "insert into use_cases(name, description) values(?, ?);", [dataObject.name, dataObject.description], (err) ->
      console.log "An error occurred #{err}"

exports.Connection = Connection