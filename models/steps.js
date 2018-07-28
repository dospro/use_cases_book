module.exports = function (sequelize, DataTypes) {
    return sequelize.define("step", {
        step_number: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        description: {
            type: DataTypes.STRING
        }
    });
};
