import {$host} from "./index";
// import {jwtDecode} from "jwt-decode/build/esm";

export const findPersons = async(name: string, country: string,) => {
    const {data} = await $host.post('api/friends/find', {name, country})
    if (data.error) return data
    localStorage.setItem('token', data.token)
    localStorage.setItem('refreshToken', data.refreshToken)
    return data.json()
}
