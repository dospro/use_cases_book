const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const api = require("./apis/use_cases_api");

const app = express();

app.set("view engine", "pug");
app.set('views', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

switch (app.get('env')) {
    case 'development':
        const mainPath = __dirname + '/main.js';
        app.use(require('express-reload')(mainPath));
        app.use(require('morgan')('dev'));
        break;
}

app.get("/", (request, response) => {
    response.render("index");
});

app.get("/new", (request, response) => {
    response.render("new_case/new_case");
});

app.post("/add_new_case", (request, response) => {
    console.log("Got the following request %o", request.body);
    api.addNewCase(request.body);
    response.end();
});

app.post("/add_new_actor", (request, response) => {
    api.addNewActor(null);
    response.end();
});

app.post("/update_case", (request, response) => {
    api.updateCase(null);
    response.end();
});

app.get("/list_cases", (request, response) => {
    api.getAllCases()
        .then((result) => {
            response.json(result);
        });
});


app.get('*', (request, response) => {
    response.status(404).send("Error: #{request.url} not found.");
});

app.listen(8081, () => {
    console.log("Listening port 8081");
});
