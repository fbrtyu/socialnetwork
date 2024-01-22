import {$authHost, $host} from "./index";
import {jwtDecode, JwtPayload, UserIDJwtPayload} from "jwt-decode";
declare module 'jwt-decode' {
    export interface UserIDJwtPayload extends JwtPayload {
        userId: string
    }
}
export const registration = async(email: string, password: string, name: string) => {
    const {data} = await $host.post('api/user/registration', {login: email,password, firstName: name})//, role: 'ADMIN'
    localStorage.setItem('token', data.token)
    localStorage.setItem('refreshToken', data.refreshToken)
    return jwtDecode<UserIDJwtPayload>(data.token)
}

export const login = async(email: string, password: string) => {
    console.log($host)
    const {data} = await $host.post('api/user/login', {login: email, password})
    localStorage.setItem('token', data.token)
    localStorage.setItem('refreshToken', data.refreshToken)
    return jwtDecode<UserIDJwtPayload>(data.token)

}

export const check = async() => {
    const {data} = await $authHost.get('api/user/auth')
    localStorage.setItem('token', data.token)
    console.log(data.token)
    return jwtDecode<UserIDJwtPayload>(data.token)
}