import Vue from 'vue';
import {addItemToList, removeItemFromList} from './utils.js';
import axios from 'axios';

const newCase = {
    name: "Escriba un nombre",
    description: "Escriba una descripción",
    version: 1,
    actors: [],
    goal: "",
    precondition: "",
    poscondition: "",
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

const newCaseApp = new Vue({
    el: "#newCaseApp",
    data: newCase,
    methods: {
        addCourseStep: (stepId) => {
            const newStep = {
                index: stepId,
                text: ""
            };
            addItemToList(this.course, stepId, newStep);
        },

        removeCourseStep: (stepId) => {
            removeItemFromList(this.course, stepId);
        },

        addExtension: () => {
            const newItem = {
                parentStep: 1,
                extensionSteps: [
                    {
                        index: 1,
                        text: ""
                    }
                ]
            };
            this.extensions.push(newItem)
        },

        addExtensionStep: (extensionIndex, stepId) => {
            const newStep = {
                index: stepId,
                text: ""
            };
            addItemToList(this.extensions[extensionIndex].extensionSteps, stepId, newStep);
        },

        removeExtensionStep: (extensionIndex, stepId) => {
            removeItemFromList(extensions[extensionIndex].extensionSteps, stepId);
        },

        indexToLetter: (index) => {
            return (index + 9).toString(36);
        },

        saveNewUseCase: () => {
            console.log("Finally, saving!!");
            console.log("Sending %o", newCase);
            axios.post("http://localhost:8081/add_new_case", newCase)
                .then(() => {
                    console.log("Saved");
                })
                .catch(() => {
                    console.log("Failed");
                });
        }
    }
});

