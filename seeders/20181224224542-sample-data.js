'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('use_case', [{
      name: "Prueba 1",
      description: "Datos de prueba desde un seeder",
      version: 1,
      goal: "My own goal",
      trigger_event: "some trigger event",
      pre_condition: "my pre condition",
      pos_condition: "my pos condition",
      comments: "My own comments"
    }], {});
  },

  down: (queryInterface, Sequelize) => {
      return queryInterface.bulkDelete('use_case', null, {});
  }
};
