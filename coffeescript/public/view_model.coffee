useCasesMock = [
  name: "Caso de uso 1"
  description: "Descripción del primer caso de uso."
  version: 1
  reference: "header1"
  hreference: "#header1"
,
  name: "Caso de uso 2"
  description: "El segundo caso de uso."
  version: 2
  reference: "header2"
  hreference: "#header2"
]

model =
  data: ko.observableArray useCasesMock

ko.applyBindings model