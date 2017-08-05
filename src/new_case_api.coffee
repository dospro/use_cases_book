database = require "./db_interface"
Promise = require("./promise").Promise

db = new database.Connection "database.db"

exports.addNewCase = (payload) ->
  db.addUseCase payload

exports.addNewActor = (payload) ->
  console.log "Add new actor. Missing implementation"

exports.updateCase = (payload) ->
  console.log "Update use case. Missing implementation"

exports.getAllCases = () ->
  promise = new Promise
  db.getUseCases()
    .then (rows) ->
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
      promise.resolve useCases

  return promise
