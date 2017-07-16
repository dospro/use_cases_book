addItemToList = (itemsList, index, newItem) ->
  stepIndex = index - 1
  total = itemsList.length

  if stepIndex >= total
    console.log "Out of index"
    return

  itemsList.splice stepIndex + 1, 0, newItem
  stepIndex++
  total = itemsList.length
  for i in [stepIndex..total - 1]
    itemsList[i].index++

removeItemFromList = (itemsList, index) ->
  stepIndex = index - 1
  total = itemsList.length
  if total == 1
    console.log "Only one element left"
    return
  if stepIndex >= total
    console.log "Out of index"
    return

  itemsList.splice stepIndex, 1
  total = itemsList.length
  if stepIndex < total
    for i in [stepIndex..total - 1]
      itemsList[i].index--

export {addItemToList, removeItemFromList, Promise}