function addItemToList(itemsList, index, newItem) {
    let stepIndex = index - 1;
    let total = itemsList.length;

    if (stepIndex >= total) {
        console.log("Out of index");
        return;
    }

    itemsList.splice(stepIndex + 1, 0, newItem);
    stepIndex++;
    total = itemsList.length;
    for (let i = stepIndex; i < total; ++i) {
        itemsList[i].index++;
    }
}

function removeItemFromList(itemsList, index) {
    let stepIndex = index - 1;
    let total = itemsList.length;
    if (total === 1) {
        console.log("Only one element left");
        return;
    }
    if (stepIndex >= total) {
        console.log("Out of index");
        return;
    }

    itemsList.splice(stepIndex, 1);
    total = itemsList.length;
    if (stepIndex < total) {
        for (let i = stepIndex; i < total; ++i) {
            itemsList[i].index--;
        }
    }
}

const state = {
    name: "Test name",
    description: "",
    version: 1,
    actors: [],
    goal: "",
    precondition: "",
    trigger: "",
    comment: "",
    course: [
        {
            index: 1,
            text: ""
        }
    ],
    extensions: [
        {
            parentStep: 1,
            extensionSteps: [
                {
                    index: 1,
                    text: ""
                }
            ]
        }
    ]
};

const getters = {};

const mutations = {
    setName(state, value) {
        state.name = value;
    },
    setDescription(state, value) {
        state.description = value;
    },
    setVersion(state, value) {
        state.version = value;
    },
    setActors(state, value) {
        state.actors = value;
    },
    setGoal(state, value) {
        state.goal = value;
    },
    setPrecondition(state, value) {
        state.precondition = value;
    },
    setTrigger(state, value) {
        state.trigger = value;
    },
    setComment(state, value) {
        state.comment = value;
    },
    addStep(state, currentStepIndex) {
        const newStep = {
            index: currentStepIndex,
            text: ""
        };
        let stepIndex = currentStepIndex - 1;
        let total = state.course.length;

        if (stepIndex >= total) {
            console.log("Out of index");
            return;
        }

        state.course.splice(stepIndex + 1, 0, newStep);
        stepIndex++;
        total = state.course.length;
        for (let i = stepIndex; i < total; ++i) {
            state.course[i].index++;
        }
    },
    removeStep(state, index) {
        let stepIndex = index - 1;
        let total = state.course.length;
        if (total === 1) {
            console.log("Only one element left");
            return;
        }
        if (stepIndex >= total) {
            console.log("Out of index");
            return;
        }

        state.course.splice(stepIndex, 1);
        total = state.course.length;
        if (stepIndex < total) {
            for (let i = stepIndex; i < total; ++i) {
                state.course[i].index--;
            }
        }
    },
    setStepText(state, options) {
        state.course[options.index].text = options.text;
    },
    addExtension(state, options) {
        const newItem = {
            parentStep: 1,
            extensionSteps: [
                {
                    index: 1,
                    text: ""
                }
            ]
        };
        state.extensions.push(newItem);
    },
    addExtensionStep(state, options) {
        const newStep = {
            index: options.stepIndex,
            text: ""
        };
        addItemToList(state.extensions[options.extensionIndex].extensionSteps, options.stepIndex, newStep);
    },
    removeExtensionStep(state, options) {
        removeItemFromList(state.extensions[options.extensionIndex].extensionSteps, options.stepIndex);
    },
    setExtensionText(state, options) {
        state.extensions[options.extensionIndex].extensionSteps[options.stepIndex].text = options.text;
    }
};

const actions = {};


export default {
    namespaced: true,
    state,
    getters,
    mutations,
    actions
};