const { Client } = require("pg")
const dotenv = require("dotenv")
dotenv.config()

async function editmessage(messageid, newtext) {
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
            text: 'UPDATE message SET text = $1, updatedate = $3 WHERE id = $2  RETURNING *',
            values: [newtext, messageid, new Date()],
        };

        const res = await client.query(query);
        await client.end();
        return res.rows[0]

    } catch (error) {
        console.log(error);
    };
};

module.exports.editmessage = editmessage;