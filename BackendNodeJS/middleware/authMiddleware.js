const jwt = require('jose')
const client = require('../db')
const bcrypt = require('bcrypt')


module.exports = async function (req, res, next) {
    if (req.method === 'OPTIONS')
    {
        next()
    }
    try {
        const token = req.headers.authorization.split(' ')[1]
        if (!token){
            return res.status(401).json({message: "Аутенификация не пройдена"})
        }
        const alg = 'RS256'

        const publicKey = await jwt.importPKCS8(`${process.env.SECRET_KEY}` , alg)

        const options = {
            issuer: 'urn:example:issuer',
            audience: 'urn:example:audience',
        }
        let isTimeOut = false;

        const { payload } = await jwt
            .jwtVerify(token, publicKey, options)
            .catch(async (error) => {
                if (error?.code === 'ERR_JWT_EXPIRED') {
                    return isTimeOut = true
                }
                else throw error
            })
        if (!await jwt.jwtVerify(req.body.refreshToken, publicKey)) return res.status(401).json({message: "Рефрешь токен устарел"})
        const text = 'SELECT * FROM userToken WHERE id = $1'
        const pl = await jwt.decodeJwt(token)
        const result = await client.query(text, [pl.id])
        if (!result.rows) res.status(401).json({message: "Данный токен не зарегестрирован"})
        if (!result.rows.find(r => bcrypt.compareSync(req.body.refreshToken, r.token))) return res.status(401).json({message: "Токен не прошел проверку"})
        req.user = pl
        next()
    }
    catch (e) {
        // console.error(e)
        res.status(401).json({message: e})
    }
    finally {

    }


}