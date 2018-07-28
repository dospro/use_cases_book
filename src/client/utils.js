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
    for (let i = stepIndex; i < total - 1; ++i) {
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
        for (let i = stepIndex; i < total - 1; ++i) {
            itemsList[i].index--;
        }
    }
}

export {addItemToList, removeItemFromList};
