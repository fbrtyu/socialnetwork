function ws() {
    const WebSocket = require('ws');
    const wsServer = new WebSocket.Server({ port: 9000 });

    wsServer.on('connection', onConnect);

    function onConnect(wsClient) {
        wsClient.on('close', function () {
            console.log('Пользователь отключился');
        });

        wsClient.on('message', function (message) {
            wsServer.clients.forEach(function each(client) {
                if (client !== ws && client.readyState === WebSocket.OPEN) {
                    const jsonMessage = JSON.parse(message);
                    client.send(jsonMessage.data);
                }
            });
            try {
                const jsonMessage = JSON.parse(message);
                switch (jsonMessage.action) {
                    case 'ECHO':
                        wsClient.send(jsonMessage.data);
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