import React, {createContext, useCallback, useContext, useEffect, useRef, useState} from 'react';
import {Context} from "../index";
import {observer} from "mobx-react-lite";

export const WebsocketContext = createContext<any>(null)
const  WebSocketProvider = observer(({children}: any) => {
    const {user} = useContext(Context)
    const ws = useRef<any>(null);
    const [status, setStatus] = useState("")
    const [latestMessage, setLatestMessage] = useState<any>(null)
    useEffect(() => {
        ws.current = new WebSocket("ws://localhost:9000"); // создаем ws соединение
        ws.current.onopen = () => {
            if (!user.user.userId) {
                console.log("Соединение отменено");
            }
            else {
                setStatus("Соединение открыто");
                ws.current.send(JSON.stringify({ action: 'CONNECT', userid: user.user.userId}));
                console.log("Соединение открыто");}	// callback на ивент открытия соединения
            }
        ws.current.onclose = () => {setStatus("Соединение закрыто")
            console.log("Соединение закрыто")};
        getWSMessages()
    }, [user.user.userId]);//[ws]

    // useEffect(() => {
    // }, [user.user.userid]);
    const getWSMessages = useCallback(() => {
        ws.current.onmessage = (message: MessageEvent<any>) => {
            setLatestMessage(message)
            console.log('Message: %s', message.data);
        }
    }, [latestMessage])
    const ret = [status, latestMessage, ws.current?.send.bind(ws.current)]

    return (
        <WebsocketContext.Provider value={ret}>
            {children}
        </WebsocketContext.Provider>
    )
});

export default WebSocketProvider;