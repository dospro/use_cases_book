const Sequelize = require("sequelize");
const config = require('./config/config');

const UseCase = require("./models/use_case");
const Actor = require("./models/actor");
const StakeHolder = require("./models/stakeholder");
const Step = require("./models/step");
const Extension = require("./models/extension");


class Connection {
    constructor(db_config) {
        const sequelize = new Sequelize(
            db_config["database"],
            db_config["username"],
            db_config["password"],
            {
                host: db_config["host"],
                dialect: "mysql",
                define: {
                    underscoredAll: true,
                    freezeTableName: true,
                    timestamps: false
                }
            }
        );


        this.UseCase = UseCase(sequelize, Sequelize);
        this.Actor = Actor(sequelize, Sequelize);
        this.StakeHolder = StakeHolder(sequelize, Sequelize);
        this.Step = Step(sequelize, Sequelize);
        this.Extension = Extension(sequelize, Sequelize);

        this.UseCase.belongsToMany(this.Actor, {through: "use_case_actors"});
        this.Actor.belongsToMany(this.UseCase, {through: "use_case_actors"});

        this.UseCase.belongsToMany(this.StakeHolder, {through: "use_case_stakeholders"});
        this.StakeHolder.belongsToMany(this.UseCase, {through: "use_case_stakeholders"});

        this.UseCase.hasMany(this.Step, {foreignKey: 'use_case_id'});
        this.Step.hasMany(this.Extension);
    }
}

module.exports = new Connection(config[process.env["NODE_ENV"]]);
