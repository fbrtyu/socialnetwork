import React, {useCallback, useContext, useEffect, useRef, useState} from 'react';

import { observer } from "mobx-react-lite";
import { Context } from "../index";
import {getChatMessages, getChats} from "../http/messengerAPI";
import MessageInput from "../components/MessageInput";
import ChatList from "../components/ChatList";


const MessengerPage = observer(() => {
    //Получение новых сообщений из БД

    const ws = useRef<any>(null);

    //Функция для отправки сообщения в Вебсокет
    function wsSendEcho() {
        const text = textMessage;
        //Пока такие данные, их надо будет хранить у клиента и получать из переменных
        // const index = messenger.dialogMessages.push({messageId: null, userId: userId(), text: textMessage, files: null, date: null}) - 1
        ws.current.send(JSON.stringify({ action: 'ECHO', data: text, chatid: messenger.selectedDialog.dialogId, usersenderid: userId(), createdate: null, updatedate: null }));
    };
    // const mockWSOnMes = WS.onmessage
    const mock = () => {
        // expect(mockWSOnMes).toHaveBeenCalled()
    }
    const { user, messenger } = useContext(Context)

    const [flagWSOnMes, setFlagWSOnMes] = useState<boolean>(false)
    //Как результат запроса на сервер
    // const [dialogsMessages, setDialogsMessages] = useState<{ dialogId: string, messages: { messageId: string | null, files: string | null, text: string | null, userId: string, date: number | null }[] }[]>(
    // )
    const [dialogsMessages, setDialogsMessages] = useState<{
        dialogId: string,
        messageId: string | null,
        text: string | null,
        userSenderId: string,
        createDate: any | null,
        updateDate: any | null,
    }[]|null>(null)

    // {id: '2', chatid: '1', usersenderid: '1', createdate: '2000-12-31T21:00:00.000Z', updatedate: '2000-12-31T21:00:00.000Z', …}
    // const [dialogMessages, setDialogMessages] = useState<any>()
    const [textMessage, setTextMessage] = useState<string | null>('')
    const [status, setStatus] = useState("")
    const [flagWS, setFlagWS] = useState<boolean>(false)
    const [latestMessage,setLatestMessage] = useState<any>(null)

    // const uploadDialogMessages = () => {
    //     getMessages(messenger.selectedDialog.dialogId).then(data => {
    //         setDialogsMessages(data.map((row: any) => ({dialogId: row.chatid,
    //             messageId: row.id,
    //             text: row.text,
    //             userSenderId: row.usersenderid,
    //             createDate: row.createdate,
    //             updateDate: row.updatedate
    //         })))
    //         messenger.setDialogMessages(dialogsMessages?.filter(dialog => dialog.dialogId ===  messenger.selectedDialog.dialogId)?.map(dialog =>
    //             ({messageId: dialog.messageId,
    //                 text: dialog.text,
    //                 userSenderId: dialog.userSenderId,
    //                 createDate: dialog.createDate,
    //                 updateDate: dialog.updateDate})))
    //         console.log(messenger.dialogMessages)
    //         }
    //     );
    //
    // }
    useEffect(() => {
        ws.current = new WebSocket("ws://localhost:9000"); // создаем ws соединение
        ws.current.onopen = () => {setStatus("Соединение открыто"); ws.current.send(JSON.stringify({ action: 'CONNECT', userid: userId() }));}	// callback на ивент открытия соединения
        ws.current.onclose = () => setStatus("Соединение закрыто");
        getWSMessages()
    }, [ws]);

    const getWSMessages = useCallback(() => {
        ws.current.onmessage = (message: MessageEvent<any>) => {
            // setFlagWS(!flagWS)
            setLatestMessage(message)

            //Почти работает (если на сервере использовать client.send(jsonMessage.data);), но ты из БД качаешь новые сообщения (поэтому работает),
            //а в вебсокете тогда будет только текст передаваться, чего не достаточно, если не качать, а получать новые из вебсокета

            //Не особо работает, если на сервере использовать client.send(JSON.stringify(jsonMessage));
            //Но зато в вебсокете ты получаешь обычный JSON, который можно распарсить с помощью JSON.Parse(полученные данные из WS)
            //Как тут переделать логику на получение сообщения из сокета, а не заново скачивать из БД я хз
            //Но передать нормальный JSON могу и получить его тут, и распарсить
            console.log('Message: %s', message.data);
        }
    }, [latestMessage])
    useEffect(() => {
        getChats(userId()).then((data) => { //: {Count: number, Chats: any[]}[]
                console.log(userId())
                console.log(data)
            messenger.setDialogs(data.Chats.map((chat: any) => ({
                dialogId: chat.chatid,
                dialogName: chat.chatname,
                dialogImage: null,
                userCreatorId: chat.usercreaterid,
                users: chat.Users
            })))
            console.log(messenger.dialogs)
            }
        )
    }, []);
    useEffect(() => {
        if (!messenger.selectedDialog)
            return
        getChatMessages(messenger.selectedDialog.dialogId, userId()).then(data => { //Вот тут бы не скачивать заново из БД, а брать из вебсокета
            console.log(data)
            console.log("Вызов")
            // console.log(flagWS)
            //     console.log(data?.filter((dialog: any) => dialog.chatid === messenger.selectedDialog.dialogId))
            messenger.setDialogMessages(data.LastMessages.filter((chat: any) => chat.chatid === messenger.selectedDialog.dialogId)?.map((message: any) =>
                ({
                        messageId: message.id,
                        text: message.text,
                        userSenderId: message.usersenderid,
                        firstName: message.firstname,
                        createDate: message.createdate,
                        updateDate: message.updatedate,
                        files: null
                })))
                console.log(messenger.dialogMessages)
            }

        )
    }, [messenger.selectedDialog,  latestMessage]);
    // const selectDialog = (sDialog: any) => {
    //     getMessages(sDialog.dialogId).then(data => {
    //             setDialogsMessages(data.map((row: any) => ({dialogId: row.chatid,
    //                 messageId: row.id,
    //                 text: row.text,
    //                 userSenderId: row.usersenderid,
    //                 createDate: row.createdate,
    //                 updateDate: row.updatedate
    //             })))
    //             messenger.setDialogMessages(dialogsMessages?.filter(dialog => dialog.dialogId === sDialog.dialogId)?.map(dialog =>
    //                 ({messageId: dialog.messageId,
    //                     text: dialog.text,
    //                     userSenderId: dialog.userSenderId,
    //                     createDate: dialog.createDate,
    //                     updateDate: dialog.updateDate,
    //
    //                 })))
    //             console.log(messenger.dialogMessages)
    //             messenger.setSelectedDialog(sDialog)
    //
    //     }
    //     );
    // }
    const sendingMessage = () => {
        if (!textMessage)
            return;
        wsSendEcho();
        // uploadDialogMessages()
        setTextMessage("")
        // const id = Number(messenger.dialogMessages[0].messageId) + 1
        // const sDialog = dialogsMessages.find(dialog => dialog.dialogId === messenger.selectedDialog.dialogId)
        // if (!sDialog) {
        //     return
        // }
        //Отправка сообщения в Вебсокет

        // const length = sDialog?.messages.unshift({ messageId: new Date().getTime().toString(), userId: userId(), text: textMessage, files: null, date: null })
        // selectDialog(sDialog)
        // console.log(dialogsMessages)
        // console.log(length)
        // messenger.dialogMessages.unshift({messageId: null, userId: userId(), text: textMessage, files: null, date: null})
        // запрос на доавбление
        // setTimeout(() => {
        //     sDialog.messages[sDialog.messages.length - length].messageId = id.toString()
        //     sDialog.messages[sDialog.messages.length - length].date = new Date().getTime()
        //     selectDialog(sDialog)
        //     // console.log(dialogsMessages)
        //     // console.log(length)
        //     // console.log("Complete")
        // }, 3000);

        //добавляем все сообщения полученые за время последнено запроса, но с web сокетом такимх ситуаций не должно быть

        //обновляем в хранилище

        //выполнено успешно

    }
    const userId = () => user.user.userId;

    function delay(ms: number) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    //           text-overflow: ellipsis; /* will make [...] at the end */
    // width: 370px; /* change to your preferences */
    // white-space: nowrap; /* paragraph to one line */
    // overflow:hidden; /* older browsers */
    return (
        <div style={{ display: "flex", justifyContent: "center", marginTop: "20px", height: '100%',maxHeight: "100%", marginBottom:"20px", boxSizing:"border-box"}}>
            <ChatList></ChatList>
            <div style={{ display: 'flex', background: "honeydew", maxWidth: "900px", width: "700px", maxHeight: "100%", flexDirection: "column" }}>

                <div style={{ display: "flex", flexDirection: "column", width: "100%",  minHeight:' min-content', maxHeight: "100%",  overflow: 'auto'}}>
                    {
                        messenger.selectedDialog ?
                            (messenger.dialogMessages? messenger.dialogMessages.map((message: {messageId: string|null, files: string|null, text: string|null, firstName: string, userSenderId: string, createDate :any|null, updateDate: any|null}) =>
                                    <div  style={{display: "flex", alignItems: "center", minHeight:' min-content', marginRight: (userId() === message.userSenderId ? "5px": ""),
                                        marginLeft: (userId() === message.userSenderId ? "" : "5px"),}}
                                          key={message.messageId}>
                                        <div style={{ display: 'flex', width: "50px", height: "50px", justifyContent: "center", alignItems: "center" }}>
                                            {
                                                userId() === message.userSenderId?
                                                    null
                                                    :
                                                // messenger.dialogs.find((dialog: any) => dialog.dialogId = messenger.selectedDialog.dialogId)?.users.find((user: any)=> user.userId = message.userSenderId)?.image ?
                                                //         <img src={messenger.dialogs.find((dialog: any) => dialog.dialogId = messenger.selectedDialog.dialogId).users.find((user: any)=> user.userId = message.userSenderId).image} style={{ borderRadius: "50%" }} />
                                                //         :
                                                    <div style={{ width: "90%", height: '90%', borderRadius: "50%", backgroundColor: "green",}} />

                                            }
                                            {/*Проверить на ошибки*/}
                                        </div>
                                        <div  style={
                                        {display: 'inline-block', background: (userId() === message.userSenderId ? "lightblue": "lightgreen"),
                                            marginRight: (userId() === message.userSenderId ? "5px": "auto"),
                                            marginLeft: (userId() === message.userSenderId ? "auto": "5px"),
                                            textAlign: "justify", whiteSpace: 'normal',wordWrap: 'break-word',
                                            marginTop: "5px", marginBottom: "5px",maxWidth: "70%",maxHeight: "auto",
                                            color: (message.createDate ? "black" : "red") }}
                                        >
                                            <div style={{marginLeft: "10px", marginTop: "2px", marginRight: "10px", fontWeight: '500'}}>
                                                {message.firstName}
                                            </div>
                                            <div style={{textAlign:"justify", color: "#424242", fontSize: '0.9rem',whiteSpace: 'normal',wordWrap: 'break-word', marginRight: "10px", marginLeft: "10px", marginTop: "2px"}}>
                                                {message.text}
                                            </div>

                                            <div style={{textAlign:"end", color: "#606161", fontSize: 'smaller',whiteSpace: 'normal',wordWrap: 'break-word'}}>
                                                {
                                                    [new Date(message.createDate).getHours(), new Date(message.createDate).getMinutes()].map(function (x) {
                                                        return x < 10 ? "0" + x : x
                                                    }).join(":")
                                                }
                                            </div>

                                        </div>
                                    </div>
                            ):
                            <div style={{ display: "flex", width: "100%", height: "100%", justifyContent: "center", alignItems:"center"}}>
                                Все еще нет ни одного сообщения, начните первым!
                            </div>)
                            :
                            null
                    }
                </div>
                {
                    messenger.selectedDialog ?
                        <MessageInput textMessage={textMessage} setTextMessage={setTextMessage} sendingMessage={sendingMessage}></MessageInput>
                        :
                        null
                }

            </div>


        </div>
    );
});

export default MessengerPage;