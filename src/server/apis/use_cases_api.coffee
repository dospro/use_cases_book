Promise = require("../promise").Promise
db = require("../db")


exports.addNewCase = (payload) ->
  data =
    name: payload.name
    description: payload.description
    goal: payload.goal
    trigger_event: 'None'
    pre_condition: payload.precondition
    pos_condition: payload.poscondition
    comments: payload.comment

  db.UseCase.build data
    .save()

exports.addNewActor = (payload) ->
  console.log "Add new actor. Missing implementation"

exports.updateCase = (payload) ->
  console.log "Update use case. Missing implementation"

exports.getAllCases = () ->
  promise = new Promise
  db.UseCase.findAll raw: true
    .then (rows) ->
      useCases = []
      for row in rows
        newData =
          name: row.name
          description: row.description
          version: row.version
          goal: row.goal
          precondition: row.pre_condition
          poscondition: row.pos_condition
          comment : row.comments
          date: row.date
        useCases.push newData
      promise.resolve useCases

  return promise
