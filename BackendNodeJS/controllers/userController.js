const client = require('../db')
const bcrypt = require('bcrypt')
const jwt = require('jose')

const insertRefreshToken = async (id ,token) => {
    const textQuery2 = 'INSERT INTO usertoken(userid, hashtoken) VALUES($1, $2) RETURNING *'
    const hashToken = await bcrypt.hash(token, 6)
    return await client.query(textQuery2, [id, hashToken])
}
const generateJWT = async (id, audience=process.env.AUDIENCE) => {
    const alg = 'RS256'
    // const secret = new TextEncoder().encode(
    //     process.env.SECRET_KEY,
    // )
    // console.log(token)
    const privateKey = await jwt.importPKCS8(`${process.env.SECRET_KEY}` , alg)//**добавить новый ключ для access token
    return await new jwt.SignJWT({id})
        .setProtectedHeader({alg})
        .setIssuedAt()
        .setIssuer(process.env.ISSUER)
        .setAudience(audience)
        .setExpirationTime('5m')
        .sign(privateKey)
}
const generateRefJWT = async (id, token) => {
    const alg = 'RS256'
    const privateKey = await jwt.importPKCS8(`${process.env.SECRET_KEY}` , alg)
    return await new jwt.SignJWT({id, token})
        .setProtectedHeader({alg})
        .setExpirationTime('10d')
        .sign(privateKey)
}

class UserController {
    async registration(req, res) {
        try {
            const {login, password, firstName} = req.body
            const text = 'SELECT * FROM userinfo WHERE email = $1'
            const user = await client.query(text, [login])
            console.log(user.rows)
            // console.log(result.rows[0].password)
            if (user.rows[0]) {
                throw new Error("Пользователь с таким логином уже существует")
            }
            const textQuery2 = 'INSERT INTO userinfo(email, password, firstname) VALUES($1, $2, $3) RETURNING *'
            const hashPassword = await bcrypt.hash(password, 6)
            const result = await client.query(textQuery2, [login, hashPassword, firstName])
            if (!result.rows[0]){
                throw new Error("Ошибка при создании аккаунта")
            }
            const token = await generateJWT(result.rows[0].id)
            console.log(token)
            const refreshToken = await generateRefJWT(result.rows[0].id, token)
            const resultInsert = insertRefreshToken(result.rows[0].id, refreshToken)
            if (!resultInsert)
            {
                throw new Error("Ошибка добавления токена")
            }
            return res.json({token, refreshToken})
        } catch (e) {
            return res.json({error: e.message})
        }
    }

    async login(req, res) {
        try {
            const {login, password} = req.body
            const text = 'SELECT * FROM userinfo WHERE email = $1'
            const result = await client.query(text, [login])
            console.log(result.rows)
            // console.log(result.rows[0].password)
            if (result.rows.length === 0) {
                console.log("Пользователя с таким логином не существует")
                throw new Error("Пользователя с таким логином не существует")
            }
            let comparePassword = bcrypt.compareSync(password, result.rows[0].password)
            if (!comparePassword) {
                throw new Error("Пароли не совпадают")
            }
            const token = await generateJWT(result.rows[0].id)
            const refreshToken = await generateRefJWT(result.rows[0].id, token)
            const resultInsert = insertRefreshToken(result.rows[0].id, refreshToken)
            if (!resultInsert)
            {
                throw new Error("Ошибка добавления токена")
            }
            // console.log(result.rows[0])
            return res.json({token, refreshToken});
        } catch (e) {
            return res.json({error: e.message})
        }
    }

    async check(req, res) {
        try {
            if (!req.user) return res.json({message: "Аутентификация не пройдена"})
            const accessToken = await generateJWT(req.user.id)
            const refreshToken = await generateRefJWT(req.user.id, accessToken)
            const result = insertRefreshToken(req.user.id, refreshToken)
            if (!result) return res.json({message: "Ошибка токена"})
            return res.json({token: accessToken, refreshToken})
        }
        catch (e) {
            return res.json({message: e})
        }
    }
}

module.exports = new UserController()