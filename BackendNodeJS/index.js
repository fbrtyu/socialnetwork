var express = require('express');
var ws = require("./ws.js");
var pg = require("./pg.js");

var app = express();
app.get('/', function (req, res) {
    res.send('Hello World! Test commit. Popytka nomer dva!');
});

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log("Сервер работает на порту 8080");
    ws.ws();

    //Выполнение функции, которая отправляет запрос в БД
    pg.pgsendmessage();
});