module.exports = function (sequelize, DataTypes) {
    return sequelize.define("use_case", {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            name: {
                type: DataTypes.STRING,
                allowNull: false
            },
            description: {
                type: DataTypes.STRING
            },
            version: {
                type: DataTypes.INTEGER,
                defaultValue: 1
            },
            goal: {
                type: DataTypes.STRING
            },
            trigger_event: {
                type: DataTypes.STRING
            },
            pre_condition: {
                type: DataTypes.STRING
            },
            pos_condition: {
                type: DataTypes.STRING
            },
            comments: {
                type: DataTypes.STRING
            },
            creation_date: {
                type: DataTypes.DATE,
                defaultValue: DataTypes.NOW
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        });
};
