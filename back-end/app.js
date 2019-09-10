var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors =require("cors");
var indexRouter = require('./routes/index');
var bodyParser = require('body-parser');
var app = express();

const port = 8000;

app.use(logger('dev'));
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(cors());
app.use('/api', indexRouter);

app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});

module.exports = app;
