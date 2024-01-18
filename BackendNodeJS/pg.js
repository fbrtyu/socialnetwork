const { Client } = require("pg")
const dotenv = require("dotenv")
dotenv.config()

//Класс для ответа getchats
class getchatsAnswer {
    Count = 0;
    Chats = [];

    constructor(count, chats) {
        this.Count = count;
        this.Chats = chats;
    }
}

//Класс для ответа getmessages
class getchatMessagesAnswer {
    ChatId = 0;
    LastMessages = [];

    constructor(groupid, chatmessages) {
        this.ChatId = groupid;
        this.LastMessages = chatmessages;
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
        })
        await client.connect()

        const query = {
            text: 'INSERT INTO message(groupid, usersenderid, createdate, updatedate, text) VALUES($1, $2, $3, $4, $5)',
            values: [data.groupid, data.usersenderid, new Date(), new Date(), data.data],
        }
        const res = await client.query(query)
        console.log(res.rows[0])
        await client.end()
    } catch (error) {
        console.log(error)
    }
}

//Функция получения всех сообщений из БД по groupid
const pggetmessage = async (groupid) => {

    try {
        const client = new Client({
            user: process.env.PGUSER,
            host: process.env.PGHOST,
            database: process.env.PGDATABASE,
            password: process.env.PGPASSWORD,
            port: process.env.PGPORT
        })
        await client.connect()

        const query = {
            text: 'SELECT * FROM message WHERE groupid = $1 ORDER BY updatedate',
            values: [groupid],
        }
        const res = await client.query(query)
        await client.end()
        let a = res.rows
        console.log(a)
        return a
    } catch (error) {
        console.log(error)
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

        await client.connect()

        const query = {
            text: 'SELECT groupid, usercreaterid, userid, name FROM chat INNER JOIN chatuserinfo ON (chat.id = chatuserinfo.groupid) WHERE userid = $1',
            values: [userid],
        }

        const res = await client.query(query)
        let chats = res.rows;
        let rc = res.rowCount;

        let chat = [];

        while (rc - 1 >= 0) {

            const query2 = {
                text: 'SELECT userid, firstname FROM userinfo INNER JOIN (SELECT groupid, userid FROM chat INNER JOIN chatuserinfo ON (chat.id = chatuserinfo.groupid) WHERE groupid = $1) ON (userinfo.id = userid)',
                values: [res.rows[rc - 1].groupid],
            }
    
            const res2 = await client.query(query2)
            let chatusers = res2.rows

            objectT = JSON.parse(JSON.stringify(res.rows[rc - 1]));
            objectT['Users'] = chatusers;
            chat.push(objectT);

            rc = rc - 1;
        }

        await client.end()

        const answer = new getchatsAnswer(chats.length, chat)
        return answer
    } catch (error) {
        console.log(error)
    }
}

//Функция получения всех сообщений чата пользователя из БД по userid и groupid
const getonechatmessages = async (userid, groupid) => {
    try {
        const client = new Client({
            user: process.env.PGUSER,
            host: process.env.PGHOST,
            database: process.env.PGDATABASE,
            password: process.env.PGPASSWORD,
            port: process.env.PGPORT
        })

        await client.connect()

        const query = {
            text: 'SELECT groupid, message.id, usersenderid, firstname, text, createdate, updatedate FROM userinfo INNER JOIN message ON (userinfo.id = message.usersenderid) WHERE groupid = $1',
            values: [groupid],
        }

        const res = await client.query(query)
        let chatmessages = res.rows;

        await client.end()

        const answer = new getchatMessagesAnswer(groupid, chatmessages)
        return answer
    } catch (error) {
        console.log(error)
    }
}

module.exports.getonechatmessages = getonechatmessages;

module.exports.getchats = getchats;

module.exports.pgsendmessage = pgsendmessage;

module.exports.pggetmessage = pggetmessage;