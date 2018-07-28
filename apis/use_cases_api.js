const db = require("../db");


function addNewCase(payload) {
    const data = {
        name: payload.name,
        description: payload.description,
        goal: payload.goal,
        trigger_event: 'None',
        pre_condition: payload.precondition,
        pos_condition: payload.poscondition,
        comments: payload.comment
    };

    db.UseCase.build(data).save();
}

function addNewActor(payload) {
    console.log("Add new actor. Missing implementation");
}

function updateCase(payload) {
    console.log("Update use case. Missing implementation");
}

function getAllCases() {
    return new Promise((resolve, reject) => {
        db.UseCase.findAll({raw: true})
            .then((rows) => {
                const useCases = [];
                for (const row of rows) {
                    const newData = {
                        name: row.name,
                        description: row.description,
                        version: row.version,
                        goal: row.goal,
                        precondition: row.pre_condition,
                        poscondition: row.pos_condition,
                        comment: row.comments,
                        date: row.date,
                    };
                    useCases.push(newData);
                }
                resolve(useCases);
            });
    });
}

module.exports.addNewCase = addNewCase;
module.exports.addNewActor = addNewActor;
module.exports.updateCase = updateCase;
module.exports.getAllCases = getAllCases;
