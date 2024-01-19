export const getChatMessages = async (groupId: any, userId: any)=> {
    const response = await fetch(`http://localhost:8080/getchatmessages?groupid=${groupId}&userid=${userId}`);
    // console.log(response.json());
    return await response.json();
}

export const getChats = async (userId: any)=> {
    const response = await fetch(`http://localhost:8080/getchats?userid=${userId}`);
    // console.log(response.json());
    return await response.json();
}