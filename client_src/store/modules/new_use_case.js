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

const actions = {};

const mutations = {};

export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
};