const { Client } = require("pg")
const dotenv = require("dotenv")
dotenv.config()
const client = require('./db')

//Класс для ответа getchats
class getchatsAnswer {
    Count = 0;
    Chats = [];

    constructor(count, chats) {
        this.Count = count;
        this.Chats = chats;
    };
};

//Класс для ответа getmessages
class getchatMessagesAnswer {
    ChatId = 0;
    LastMessages = [];

    constructor(chatid, chatmessages) {
        this.ChatId = chatid;
        this.LastMessages = chatmessages;
    };
};

//Функция для получения таблицы userid - chatid
async function getuseridfromchatid(chatid) {
    try {
        const client = new Client({
            user: process.env.PGUSER,
            host: process.env.PGHOST,
            database: process.env.PGDATABASE,
            password: process.env.PGPASSWORD,
            port: process.env.PGPORT
        });

        await client.connect();

        const query = {
            text: 'SELECT userid FROM chatuserinfo WHERE chatid = $1',
            values: [chatid],
        };
        const res = await client.query(query);
        await client.end();

        let arrayuseridinchat = [];

        for (let i = 0; i < res.rowCount; i++) {
            arrayuseridinchat.push(res.rows[i]);
        };

        return arrayuseridinchat;
    } catch (error) {
        console.log(error);
    }
}

//Пока просто тестовая функция для выполнения INSERT в БД
const pgsendmessage = async (data) => {
    try {
        const client = new Client({
            user: process.env.PGUSER,
            host: process.env.PGHOST,
            database: process.env.PGDATABASE,
            password: process.env.PGPASSWORD,
            port: process.env.PGPORT
        });
        await client.connect();

        const query = {
            text: 'INSERT INTO message(chatid, usersenderid, createdate, updatedate, text) VALUES($1, $2, $3, $4, $5)',
            values: [data.chatid, data.usersenderid, new Date(), new Date(), data.data],
        };
        await client.query(query);
        await client.end();
    } catch (error) {
        console.log(error);
    }
}

//Функция получения всех чатов пользователя из БД по userid
const getchats = async (userid) => {
    try {
        const client = new Client({
            user: process.env.PGUSER,
            host: process.env.PGHOST,
            database: process.env.PGDATABASE,
            password: process.env.PGPASSWORD,
            port: process.env.PGPORT
        })
        await client.connect();

        const query = {
            text: 'SELECT chatid, usercreaterid, userid, chatname FROM chat INNER JOIN chatuserinfo ON (chat.id = chatuserinfo.chatid) WHERE userid = $1',
            values: [userid],
        }

        const res = await client.query(query);
        let chats = res.rows;
        let rc = res.rowCount;

        let chat = [];

        while (rc - 1 >= 0) {

            const query2 = {
                text: 'SELECT userid, firstname FROM userinfo INNER JOIN (SELECT chatid, userid FROM chat INNER JOIN chatuserinfo ON (chat.id = chatuserinfo.chatid) WHERE chatid = $1) ON (userinfo.id = userid)',
                values: [res.rows[rc - 1].chatid],
            };

            const res2 = await client.query(query2);
            let chatusers = res2.rows;

            const query3 = {
                text: 'SELECT * FROM message WHERE message.chatid = $1 ORDER BY createdate DESC LIMIT 1',
                values: [res.rows[rc - 1].chatid],
            };

            const res3 = await client.query(query3);
            let lastchatmessage = res3.rows;

            objectT = JSON.parse(JSON.stringify(res.rows[rc - 1]));
            objectT['Users'] = chatusers;
            objectT['LastMessage'] = lastchatmessage;
            chat.push(objectT);

            rc = rc - 1;
        }

        await client.end();

        const answer = new getchatsAnswer(chats.length, chat);
        return answer;
    } catch (error) {
        console.log(error);
    }
}

//Функция получения всех сообщений чата пользователя из БД по userid и chatid
const getonechatmessages = async (userid, chatid, createdate) => {
    try {
        const client = new Client({
            user: process.env.PGUSER,
            host: process.env.PGHOST,
            database: process.env.PGDATABASE,
            password: process.env.PGPASSWORD,
            port: process.env.PGPORT
        });

        await client.connect();

        const query = {
            text: 'SELECT chatid, message.id, usersenderid, firstname, text, createdate, updatedate FROM userinfo INNER JOIN message ON (userinfo.id = message.usersenderid) WHERE chatid = $1 AND createdate > $2',
            values: [chatid, createdate],
        }

        const res = await client.query(query);
        let chatmessages = res.rows;

        await client.end();

        const answer = new getchatMessagesAnswer(chatid, chatmessages);
        return answer;
    } catch (error) {
        console.log(error);
    }
}

module.exports.getonechatmessages = getonechatmessages;

module.exports.getchats = getchats;

module.exports.pgsendmessage = pgsendmessage;

module.exports.getuseridfromchatid = getuseridfromchatid;