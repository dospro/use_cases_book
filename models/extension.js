module.exports = function (sequelize, DataTypes) {
    return sequelize.define("extension", {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            extension_number: {
                type: DataTypes.INTEGER,
                allowNull: false
            },
            description: {
                type: DataTypes.STRING,
                allowNull: false
            },
            step_id: {
                type: DataTypes.INTEGER,
                references: {
                    model: 'step',
                    key: 'id'
                }
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        });
};
