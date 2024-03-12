const { Client } = require("pg");
const dotenv = require("dotenv");
dotenv.config();
const client = require('./db');

let user = {
    id: 0,
    firstname: "",
    lastname: "",
    country: "",
    email: "",
};

async function searchfriend(search) {
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
            text: 'SELECT id, firstname, lastname, country, email FROM userinfo WHERE firstname LIKE $1 OR lastname LIKE $1 OR email LIKE $1',
            values: [search + "%"],
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
    };
};

module.exports.searchfriend = searchfriend;