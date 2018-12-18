module.exports = function (sequelize, DataTypes) {
    return sequelize.define("step", {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            step_number: {
                type: DataTypes.INTEGER,
                allowNull: false
            },
            description: {
                type: DataTypes.STRING
            },
            use_case_id: {
                type: DataTypes.INTEGER,
                references: {
                    model: 'use_case',
                    key: 'id'
                }
            }
        },
        {
            timestamps: false
        });
};
