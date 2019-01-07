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
    case 'docker':
        app.use(require('morgan')('dev'));
        break;
}

app.get("/", (request, response) => {
    response.render("index");
});

app.get("/cases/", (request, response, next) => {
    api.getAllCases()
        .then((result) => {
            response.json(result);
        })
        .catch(err => {
            next(err);
        });
});

app.post("/cases/", (request, response, next) => {
    api.addNewCase(request.body)
        .then(() => {
            response.end();
        })
        .catch(err => {
            next(err);
        });
});

app.put("/cases/:case_id", (request, response) => {
    api.updateCase(request.params.case_id, request.body);
    response.end();
});


app.get('*', (request, response) => {
    response.status(404).send("Error: #{request.url} not found.");
});

app.use((err, request, response, next) => {
    if (response.headersSent) {
        return next(err)
    }
    console.error(err);
    const errorResponse = {
        status: 500,
        message: err.message
    };
    response.status(500).json(errorResponse);
});

app.listen(8081, () => {
    console.log("Listening port 8081");
    console.log("Open: http://localhost:8081");
});
