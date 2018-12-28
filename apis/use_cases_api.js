const Sequelize = require("sequelize");
const db = require("../db");


async function addNewCase(payload) {
    try {
        return await db.sequelize.transaction(async (t) => {
            const useCase = await db.UseCase.create({
                name: payload.name,
                description: payload.description,
                version: payload.version,
                goal: payload.goal,
                pre_condition: payload.precondition,
                trigger_event: payload.trigger,
                comments: payload.comment
            }, {transaction: t});
            const steps = await db.Step.bulkCreate(payload.course.map(step => {
                return {
                    step_number: step.index,
                    description: step.text,
                    use_case_id: useCase.id
                }
            }), {transaction: t});
            return await db.Extension.bulkCreate(payload.extensions.reduce((acc, extension) => {
                return acc.concat(extension.extensionSteps.map(extensionStep => {
                    return {
                        extension_number: extensionStep.index,
                        description: extensionStep.text,
                        step_id: steps.find(step => step.step_number === parseInt(extension.parentStep)).id
                    }
                }));
            }, []), {transaction: t});
        });
    } catch (e) {
        console.log("Error %o", e);
    }
}

function addNewActor(payload) {
    console.log("Add new actor. Missing implementation");
}

function updateCase(payload) {
    console.log("Update use case. Missing implementation");
}

async function getAllCases() {
    try {
        const rows = await db.UseCase.findAll({
            include: [{
                model: db.Step,
                where: {use_case_id: Sequelize.col('use_case.id')},
                required: false
            }],
            raw: true
        });

        return rows.reduce((acc, row) => {
            if (row.id in acc) {
                acc[row.id].course.push({
                    index: row["steps.step_number"],
                    text: row["steps.description"]
                });
            } else {
                acc[row.id] = {
                    id: row.id,
                    name: row.name,
                    description: row.description,
                    version: row.version,
                    goal: row.goal,
                    precondition: row.pre_condition,
                    poscondition: row.pos_condition,
                    comment: row.comments,
                    date: row.date,
                    course: [
                        {
                            index: row["steps.step_number"],
                            text: row["steps.description"]
                        }
                    ]
                }
            }
            return acc;
        }, {});
    } catch (e) {
        throw Error(e);
    }
}

module.exports.addNewCase = addNewCase;
module.exports.addNewActor = addNewActor;
module.exports.updateCase = updateCase;
module.exports.getAllCases = getAllCases;
