var express = require('express');
var ws = require("./ws.js");
var pg = require("./pg.js");

var app = express();

//Путь для получения чатов пользователя по userid
app.get('/getchats', async function(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    
    let userid = await req.query.userid;

    let answer = await pg.getchats(userid);

    res.send(JSON.stringify(answer));
})

//Путь для получения сообщений из БД пользователем по groupid и userid
app.get('/getchatmessages', async function(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    
    let userid = await req.query.userid;

    let chatid = await req.query.chatid;

    let createdate = await req.query.createdate;

    let answer = await pg.getonechatmessages(userid, chatid, createdate);

    res.send(JSON.stringify(answer));
})

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log("Сервер работает на порту 8080");
    ws.ws();
});