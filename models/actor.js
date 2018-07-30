module.exports = function (sequelize, DataTypes) {
    return sequelize.define("actor", {
            name: {
                type: DataTypes.STRING,
                allowNull: false
            }
        },
        {
            timestamps: false
        });
};