const jwt = require('jose')
const client = require('../db')
const bcrypt = require('bcrypt')


module.exports = async function (req, res, next) {
    if (req.method === 'OPTIONS')
    {
        next()
    }
    try {
        req.user = ''
        const token = req.headers.authorization.split(' ')[1]
        if (!token){
            throw new Error("Аутенификация не пройдена")//res.status(401).json({message: "Аутенификация не пройдена"})
        }
        const alg = 'RS256'
        // console.log(req.headers.refreshtoken)
        const privateKey = await jwt.importPKCS8(`${process.env.SECRET_KEY}` , alg)

        const options = {
            // В планах добавить проверку доверительного центра(Сам сайт), а также устройства входа, для уникальной сессии
            // для каждого устройства
            issuer: 'urn:example:issuer',
            audience: 'urn:example:audience',
        }
        let isTimeOut = false;

        const { payload } = await jwt
            .jwtVerify(token, privateKey, options)
            .catch(async (error) => {
                if (error?.code === 'ERR_JWT_EXPIRED') {
                    return isTimeOut = true
                }
                else throw error
            })
        if (!await jwt.jwtVerify(req.headers.refreshtoken, privateKey)) {
            // console.log("refToken " + req.headers.refreshtoken,)
            return new Error("Рефреш токен устарел")//res.status(401).json({message: "Рефрешь токен устарел"})
        }
        const text = 'SELECT * FROM usertoken WHERE userid = $1'// запрос на получения токенов из БД
        const pl = await jwt.decodeJwt(token)
        const result = await client.query(text, [pl.id])
        if (!result.rows) throw new Error("Данный токен не зарегестрирован")//res.status(401).json({message: "Данный токен не зарегестрирован"})
        if (!result.rows.find(r => bcrypt.compareSync(req.headers.refreshtoken, r.hashtoken))) return res.status(401).json({message: "Токен не прошел проверку"})
        req.user = pl
        next()
    }
    catch (e) {
        console.error(e)
        return res.json({error: e.message})
    }
    finally {

    }
}