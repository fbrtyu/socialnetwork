var pg = require("./pg.js");

function ws() {
    const WebSocket = require('ws');
    const wsServer = new WebSocket.Server({ port: 9000 });
    const activeClients = [];
    let index = 0;
    let arrayuseridinchat = [];
    //let arrayuserid = [];

    wsServer.on('connection', onConnect);

    function onConnect(wsClient) {

        wsClient.on('message', async function (message) {
            // wsServer.clients.forEach(function each(client) {    
            //     if (client !== ws && client.readyState === WebSocket.OPEN) {
            //         const jsonMessage = JSON.parse(message);
            //         client.send(jsonMessage.data);
            //     }
            // });

            activeClients.forEach(function each(client) {
                for (let i = 0; i < arrayuseridinchat.length; i++) {
                    if (client.readyState === WebSocket.OPEN && client.uniqueID === arrayuseridinchat[i].userid) {
                        //const jsonMessage = JSON.parse(message);
                        client.send(message);
                    };
                };

                // if (client.readyState === WebSocket.OPEN && client.uniqueID == 6) {
                //     const jsonMessage = JSON.parse(message);
                //     client.send(jsonMessage.data);
                // };
            });

            wsClient.on('close', function () {
                activeClients.forEach(function each(client) {
                    if (client.readyState === WebSocket.CLOSED) {
                        console.log("User close connection. User with id " + activeClients[index].uniqueID + " delete from array!");
                        activeClients.splice(index, 1);
                        console.log("Active users: " + activeClients.length);
                    };
                    index++;
                });
                index = 0;
            });

            try {
                const jsonMessage = JSON.parse(message);
                switch (jsonMessage.action) {
                    case 'CONNECT':
                        //Выполнение функции, которая регистрирует нового пользователя вебсокета в массиве пользователей и даёт ему id из БД
                        //arrayuserid.push(jsonMessage.userid);
                        //wsClient.uniqueID = arrayuserid.pop();
                        wsClient.uniqueID = jsonMessage.userid;
                        if (activeClients.find(client => {client === wsClient})) { //activeClients.find(client => {client.uniqueID === jsonMessage.userid})

                        } else {
                            activeClients.push(wsClient);
                        }
                        //activeClients.push(wsClient);
                        console.log("User with id " + jsonMessage.userid + " connected!");
                        console.log("Active users: " + activeClients.length);
                        break;
                    case 'ECHO':
                        //Отправка конкретным пользователям чата
                        arrayuseridinchat = await pg.getuseridfromchatid(jsonMessage.chatid);
                        console.log(arrayuseridinchat.length);

                        wsClient.send(message);

                        //Выполнение функции, которая отправляет запрос в БД
                        await pg.pgsendmessage(jsonMessage);
                        break;
                    case 'PING':
                        setTimeout(function () {
                            wsClient.send('PONG');
                        }, 2000);
                        break;
                    default:
                        console.log('Неизвестная команда');
                        break;
                }
            } catch (error) {
                console.log('Ошибка', error);
            }
        });
    }
    console.log('Сервер запущен на 9000 порту');
}

module.exports.ws = ws;