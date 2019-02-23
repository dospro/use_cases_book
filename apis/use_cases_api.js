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
    } catch (err) {
        throw err;
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
                attributes: [['step_number', 'index'], ['description', 'text']],
                include: [{
                    model: db.Extension,
                }]
            }]
        });

        return rows.map(row => {
            const data = row.get({plain: true});
            return {
                id: data.id,
                name: data.name,
                description: data.description,
                version: data.version,
                goal: data.goal,
                precondition: data.pre_condition,
                poscondition: data.pos_condition,
                comment: data.comments,
                date: data.date,
                course: data.steps
            }
        });
    } catch (err) {
        throw err;
    }
}

module.exports.addNewCase = addNewCase;
module.exports.addNewActor = addNewActor;
module.exports.updateCase = updateCase;
module.exports.getAllCases = getAllCases;
