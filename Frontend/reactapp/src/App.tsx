import React, {useContext, useEffect, useRef, useState} from 'react';
import './App.scss';
import {Context} from "./index"
import {check} from "./http/userAPI";
import NavBar from "./components/NavBar/NavBar";
import {BrowserRouter} from "react-router-dom";
import AppRouter from "./components/AppRouter/AppRouter";
import {observer} from "mobx-react-lite";
import WebSocketProvider, {WebsocketContext} from "./utils/WebSocketProvider";
import MessageNotice from "./MessageNotice/MessageNotice";
import {stringify} from "querystring";
import {CSSTransition,Transition} from "react-transition-group"
import styles from "./MessageNotice/MessageNotice.module.scss";



const App = observer(() => {
    const {user} = useContext(Context)
    const [status, latestMessage, send] = useContext(WebsocketContext)
    const [loading, setLoading] = useState(true)
    const [messageNotice, setMessageNotice] = useState<any[]>([])
    const nodeRef = useRef(null)


    useEffect(() => {
        if (latestMessage && user.user.userId !== JSON.parse(latestMessage.data).usersenderid)
            getNewMessage()
    }, [latestMessage]);
    const getNewMessage = () => {
        // messageNotice.push(JSON.parse(latestMessage.data))
        if (messageNotice.length === 5)
            messageNotice.shift()
        setMessageNotice([...messageNotice, JSON.parse(latestMessage.data)])
        // console.log(messageNotice)
        // setTimeout(()=> {
        //     messageNotice.shift()
        //     console.log("Оповещение удалено" )
        // },15000)

    }

    useEffect(() => {
            check().then(data => {
                    if (data.error)
                        console.log(data.error)
                    else
                    {
                        const {id} = data
                        user.setUser({userId: id})
                        user.setIsAuth(true)
                    }
            }).finally(() => setLoading(false))
        }
        ,[])

    if (loading) {
        return <div>Loading</div>
    }
    return (
            <div className={"App"}>
                <BrowserRouter>
                    <NavBar/>
                    <div style={{display: "flex", maxHeight: "100%"}}></div>
                    <AppRouter></AppRouter>

                </BrowserRouter>
                <div style={{position:"absolute", bottom: "5px", right: "5px",}}
                >
                {
                    messageNotice?.length > 0 ?
                        messageNotice.map((message: any) =>

                                <MessageNotice nodeRef={nodeRef} key={message.id} setMessageNotice={setMessageNotice} message={message}></MessageNotice>

                        )
                        :
                        null
                }
                </div>
            </div>
      );
    })

export default App;
