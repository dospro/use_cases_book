newCaseApp = new Vue
  el: "#newCaseApp"
  data:
    name: "Escriba un nombre"
    version: 10
    description: "Escriba una descripción"
    course: [
      {
        index: 1
        text: ""
      }
    ]
  methods:
    addCourseStep: (stepId) ->
      stepIndex = stepId - 1
      total = this.course.length

      if stepIndex >= total
        console.log "Out of index"
        return

      newStep =
        index: stepId
        text: ""
      this.course.splice stepIndex + 1, 0, newStep
      stepIndex++
      total = this.course.length
      for i in [stepIndex..total - 1]
        this.course[i].index++

    removeCourseStep: (stepId) ->
      stepIndex = stepId - 1
      total = this.course.length
      if total == 1
        console.log "Only one element left"
        return
      if stepIndex >= total
        console.log "Out of index"
        return

      this.course.splice stepIndex, 1
      total = this.course.length
      if stepIndex < total
        for i in [stepIndex..total - 1]
          this.course[i].index--