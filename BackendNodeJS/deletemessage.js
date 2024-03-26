const { Client } = require("pg")
const dotenv = require("dotenv")
dotenv.config()

async function deletemessage(chatid, messageid) {
    let updtext = "Сообщение удалено пользователем!";
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
            text: 'UPDATE message SET text = $1 WHERE chatid = $2 AND id = $3',
            values: [updtext, chatid, messageid],
        };

        const res = await client.query(query);
        await client.end();
        return "Вы удалили сообщение!"

    } catch (error) {
        console.log(error);
    };
};

module.exports.deletemessage = deletemessage;