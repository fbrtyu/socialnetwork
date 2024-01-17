var express = require('express');
var ws = require("./ws.js");
var pg = require("./pg.js");

var app = express();

//Путь для получения сообщений из БД пользователем по groupid
app.get('/getmessages', async function (req, res) {
    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    let groupid = await req.query.groupid;

    let answer = await pg.pggetmessage(groupid);

    res.send(JSON.stringify(answer));
});

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log("Сервер работает на порту 8080");
    ws.ws();
});