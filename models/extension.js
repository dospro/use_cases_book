module.exports = function (sequelize, DataTypes) {
    return sequelize.define("extension", {
        extension_number: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        description: {
            type: DataTypes.STRING,
            allowNull: false
        }
    });
};
