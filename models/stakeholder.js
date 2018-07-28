module.exports = function (sequelize, DataTypes) {
    return sequelize.define("stakeholder", {
        name: {
            type: DataTypes.STRING,
            allowNull: false
        }
    });
};
