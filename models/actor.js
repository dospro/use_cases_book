module.exports = function (sequelize, DataTypes) {
    return sequelize.define("actor", {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            name: {
                type: DataTypes.STRING,
                allowNull: false
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        });
};