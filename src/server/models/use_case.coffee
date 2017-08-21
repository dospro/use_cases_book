module.exports = (sequelize, DataTypes) ->
  return sequelize.define "use_case",
    name:
      type: DataTypes.STRING
      allowNull: false

    description:
      type: DataTypes.STRING

    version:
      type: DataTypes.INTEGER
      defaultValue: 1

    goal:
      type: DataTypes.STRING

    trigger_event:
      type: DataTypes.STRING

    pre_condition:
      type: DataTypes.STRING

    pos_condition:
      type: DataTypes.STRING

    comments:
      type: DataTypes.STRING

    creation_date:
      type: DataTypes.DATE
      defaultValue: DataTypes.NOW

