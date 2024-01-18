export const getMessages = async (groupId: any)=> {
    const response = await fetch(`http://localhost:8080/getmessages?groupid=${groupId}`);
    // console.log(response.json());
    return await response.json();
}