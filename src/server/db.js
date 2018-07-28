const Sequelize = require("sequelize");

const UseCase = require("./models/use_case");
const Actor = require("./models/actor");
const StakeHolder = require("./models/stakeholder");
const Step = require("./models/steps");
const Extension = require("./models/extension");


class Connection {
    constructor() {
        const sequelize = new Sequelize("mainDB", null, null, {
            dialect: "sqlite",
            storage: "database.db"
        });


        this.UseCase = UseCase(sequelize, Sequelize);
        this.Actor = Actor(sequelize, Sequelize);
        this.StakeHolder = StakeHolder(sequelize, Sequelize);
        this.Step = Step(sequelize, Sequelize);
        this.Extension = Extension(sequelize, Sequelize);

        this.UseCase.belongsToMany(this.Actor, {through: "use_case_actors"});
        this.Actor.belongsToMany(this.UseCase, {through: "use_case_actors"});

        this.UseCase.belongsToMany(this.StakeHolder, {through: "use_case_stakeholders"});
        this.StakeHolder.belongsToMany(this.UseCase, {through: "use_case_stakeholders"});

        this.UseCase.hasMany(this.Step);
        this.Step.hasMany(this.Extension);

        this.UseCase.sync();
        this.Actor.sync();
        this.StakeHolder.sync();
        this.Step.sync();
        this.Extension.sync();
    }
};

module.exports = new Connection();