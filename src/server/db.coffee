Sequelize = require "sequelize"

UseCase = require("./models/use_case")
Actor = require("./models/actor")
StakeHolder = require("./models/stakeholder")
Step = require("./models/steps")
Extension = require("./models/extension")


class Connection
  constructor: () ->
    sequelize = new Sequelize "mainDB", null, null,
      dialect: "sqlite"
      storage: "database.db"

    @UseCase = UseCase(sequelize, Sequelize)
    @Actor = Actor(sequelize, Sequelize)
    @StakeHolder = StakeHolder(sequelize, Sequelize)
    @Step = Step(sequelize, Sequelize)
    @Extension = Extension(sequelize, Sequelize)

    @UseCase.belongsToMany @Actor, through: "use_case_actors"
    @Actor.belongsToMany @UseCase, through: "use_case_actors"

    @UseCase.belongsToMany @StakeHolder, through: "use_case_stakeholders"
    @StakeHolder.belongsToMany @UseCase, through: "use_case_stakeholders"

    @UseCase.hasMany @Step
    @Step.hasMany @Extension

    @UseCase.sync()
    @Actor.sync()
    @StakeHolder.sync()
    @Step.sync()
    @Extension.sync()

module.exports = new Connection()