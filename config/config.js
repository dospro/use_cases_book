module.exports = {
    "docker": {
        "username": "local",
        "password": "password",
        "database": "use_cases_book",
        "host": "db",
        "dialect": "mysql",
        "logging": true
    },
    "staging": {
        "username": "dosprode_dospro",
        "password": "48T!jB7lPnos",
        "database": "dosprode_use_cases_book_dev",
        "host": "www.dosprodev.com",
        "dialect": "mysql",
        "logging": false
    },
    "production": {
        "username": "root",
        "password": null,
        "database": "database_production",
        "host": "127.0.0.1",
        "dialect": "mysql",
        "logging": false
    }
};
