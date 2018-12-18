'use strict';

module.exports = {
    up: (queryInterface, Sequelize) => {
        const queries = [];
        queries.push(queryInterface.createTable('use_case', {
                id: {
                    type: Sequelize.INTEGER,
                    primaryKey: true,
                    autoIncrement: true
                },
                name: {
                    type: Sequelize.STRING,
                    allowNull: false
                },
                description: {
                    type: Sequelize.STRING
                },
                version: {
                    type: Sequelize.INTEGER,
                    defaultValue: 1
                },
                goal: {
                    type: Sequelize.STRING
                },
                trigger_event: {
                    type: Sequelize.STRING
                },
                pre_condition: {
                    type: Sequelize.STRING
                },
                pos_condition: {
                    type: Sequelize.STRING
                },
                comments: {
                    type: Sequelize.STRING
                },
                creation_date: {
                    type: Sequelize.DATE,
                    defaultValue: Sequelize.NOW
                }
            },
            {
                timestamps: false
            }));
        queries.push(queryInterface.createTable('step', {
                id: {
                    type: Sequelize.INTEGER,
                    primaryKey: true,
                    autoIncrement: true
                },
                step_number: {
                    type: Sequelize.INTEGER,
                    allowNull: false
                },
                description: {
                    type: Sequelize.STRING
                },
                use_case_id: {
                    type: Sequelize.INTEGER,
                    references: {
                        model: 'use_case',
                        key: 'id'
                    }
                }
            },
            {
                timestamps: false
            }));
        queries.push(queryInterface.createTable('actor', {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            name: {
                type: Sequelize.STRING,
                allowNull: false
            }
        }, {timestamps: false}));
        queries.push(queryInterface.createTable('extension', {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            extension_number: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            description: {
                type: Sequelize.STRING,
                allowNull: false
            },
            step_id: {
                type: Sequelize.INTEGER,
                references: {
                    model: 'step',
                    key: 'id'
                }
            }
        }, {timestamps: false}));
        queries.push(queryInterface.createTable('stake_holders', {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            name: {
                type: Sequelize.STRING,
                allowNull: false
            }
        }, {timestamps: false}));
        return Promise.all(queries);
    },

    down: (queryInterface, Sequelize) => {
        const queries = [];
        queries.push(queryInterface.dropTable('actor', {}));
        queries.push(queryInterface.dropTable('stake_holder', {}));
        queries.push(queryInterface.dropTable('extension', {}));
        queries.push(queryInterface.dropTable('step', {}));
        queries.push(queryInterface.dropTable('use_cases', {}));
        return Promise.all(queries);
    }
};
