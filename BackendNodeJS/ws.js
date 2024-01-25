var pg = require("./pg.js");

function ws() {
    const WebSocket = require('ws');
    const wsServer = new WebSocket.Server({ port: 9000 });
    const activeClients = [];
    let index = 0; //Нужно для корректного удаления клиента, который отключился (закрыл вкладку)
    let arrayuseridinchat = [];
    let arrayallactiveuserid = []; //Нужно для хранения всех userid, которые активны в вебсокете, чтобы не дублировать записи в массиве активных пользователей (activeClients) при обновлении страницы или переходе между ними

    //Событие срабатывает при подключении клиента
    wsServer.on('connection', onConnect);

    //Функция срабатывает при подключении нового клиента (даже если просто обновить или переключиться между веб-страницами)
    function onConnect(wsClient) {

        //Событие срабатывает при закрытии соединения (закрытии вкладки браузера)
        wsClient.on('close', function () {
            activeClients.forEach(function each(client) {
                if (client.readyState === WebSocket.CLOSED) {
                    console.log("User close connection. User with id " + activeClients[index].uniqueID + " delete from array!");
                    let indexid = arrayallactiveuserid.indexOf(activeClients[index].uniqueID);
                    activeClients.splice(index, 1);
                    if (indexid !== -1) {
                        arrayallactiveuserid.splice(index, 1);
                    };
                    console.log("Active users: " + activeClients.length);
                };
                index++;
            });
            index = 0;
        });

        //Событие срабатывает при получении сообщения
        wsClient.on('message', async function (message) {
            //Работает при получении новых сообщений
            try {
                let jsonMessage = JSON.parse(message);
                switch (jsonMessage.action) {
                    case 'CONNECT':
                        //Выполнение функции, которая регистрирует нового пользователя вебсокета в массиве пользователей и даёт ему id из БД
                        wsClient.uniqueID = jsonMessage.userid;
                        if (arrayallactiveuserid.find((newid) => newid === jsonMessage.userid)) {
                            activeClients[activeClients.findIndex(client => client.uniqueID === jsonMessage.userid)] = wsClient;
                            console.log("Такой клиент уже есть");
                        } else {
                            arrayallactiveuserid.push(jsonMessage.userid);
                            activeClients.push(wsClient);
                        };
                        console.log("User with id " + jsonMessage.userid + " connected!");
                        console.log("Active users: " + activeClients.length);
                        break;
                    case 'ECHO':
                        //Отправка конкретным пользователям чата
                        arrayuseridinchat = await pg.getuseridfromchatid(jsonMessage.chatid);
                        console.log(arrayuseridinchat.length);

                        //Выполнение функции, которая отправляет запрос в БД
                        // const request = await pg.pgsendmessage(jsonMessage);
                        const result = await pg.pgsendmessage(jsonMessage);

                        activeClients.forEach(function each(client) {
                            for (let i = 0; i < arrayuseridinchat.length; i++) {
                                //Условие при котором нет дублирования сообщения самому себе
                                if (client.readyState === WebSocket.OPEN && client.uniqueID === arrayuseridinchat[i].userid) { //wsClient !== client Если добавить, то не будет дублирования в сокете сообщения своего

                                    //Если так отправлять сообщения, то функционал работает, но в интерфейсе не всё отображается
                                    //Если как-то по другому отправлять, то функционал некоторый начинает работать некорректно
                                    //client.send(jsonMessage.data); //Так почти работает
                                    
                                    //Так я отправляю нормальный JSON файл, который можно распарсить с помощью JSON.Parse(полученные данные из WS)
                                    client.send(JSON.stringify(result.rows[0])); //Но так не особо работает ибо логика на фронтенде другая
                                };
                            };
                        });
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
            };
        });
    }
    console.log('Сервер запущен на 9000 порту');
}

module.exports.ws = ws;