module.exports = (sequelize, DataTypes) ->
  return sequelize.define "actor",
    name: {
      type: DataTypes.STRING
      allowNull: false
    }