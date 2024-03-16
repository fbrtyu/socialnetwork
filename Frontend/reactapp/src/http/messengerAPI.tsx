import {$host} from "./index";
import {jwtDecode} from "jwt-decode";

export const getChatMessages = async (groupId: any, userId: any)=> {
    const response = await fetch(`http://localhost:8080/getchatmessages?chatid=${groupId}&userid=${userId}&createdate="2000-01-01"`);
    // console.log(response.json());
    return await response.json();
}

export const getChats = async (userId: any)=> {
    const response = await fetch(`http://localhost:8080/getchats?userid=${userId}`);
    // console.log(response.json());
    return await response.json();
}

export const deleteMessages = async  (messagesId: [])=> {
    const {data} = await $host.post('api/user/delete', {messagesId: messagesId})
    if (data.error) return data

    return await data.json()

}