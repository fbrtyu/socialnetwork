const { Client } = require("pg")
const dotenv = require("dotenv")
dotenv.config()

//Пока просто тестовая функция для выполнения INSERT в БД
const pgsendmessage = async () => {
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
            text: 'INSERT INTO userinfo(id, firstname, lastname, bday, country) VALUES($1, $2, $3, $4, $5)',
            values: [3, 'Name1', 'Name2', '2001-01-02', 'qwerty'],
        }
        const res = await client.query(query)
        console.log(res.rows[0])
        await client.end()
    } catch (error) {
        console.log(error)
    }
}

module.exports.pgsendmessage = pgsendmessage;