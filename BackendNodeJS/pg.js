const { Client } = require("pg")
const dotenv = require("dotenv")
dotenv.config()


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

module.exports.pgsendmessage = pgsendmessage;

module.exports.pggetmessage = pggetmessage;