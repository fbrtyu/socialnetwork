import React, {useCallback, useContext, useEffect, useRef, useState} from 'react';

import { observer } from "mobx-react-lite";
import { Context } from "../index";
import {getMessages} from "../http/messengerAPI";


//WebSocket
// const WS = new WebSocket('ws://localhost:9000');
// WS.onopen = function () {
//     console.log('Подключился');
// };
// //Функция для получения сообщений из Вебсокета
// WS.onmessage = function (message) {
//     console.log('Message: %s', message.data);
//     trig = !trig
// };
//
// function wsSendPing() {
//     WS.send(JSON.stringify({ action: 'PING' }));
// };

//Функция для получения новых сообщений из БД по groupid


const MessengerPage = observer(() => {
    //Получение новых сообщений из БД

    const ws = useRef<any>(null);

    //Функция для отправки сообщения в Вебсокет
    function wsSendEcho() {
        const text = textMessage;
        //Пока такие данные, их надо будет хранить у клиента и получать из переменных
        // const index = messenger.dialogMessages.push({messageId: null, userId: userId(), text: textMessage, files: null, date: null}) - 1
        ws.current.send(JSON.stringify({ action: 'ECHO', data: text, groupid: messenger.selectedDialog.dialogId, usersenderid: userId(), createdate: null, updatedate: null }));
    };
    // const mockWSOnMes = WS.onmessage
    const mock = () => {
        // expect(mockWSOnMes).toHaveBeenCalled()
    }
    // await wait(() => {
    //     expect(mockWSOnMes).toBeCalled();
    // });

    const { user, messenger } = useContext(Context)

    const [flagWSOnMes, setFlagWSOnMes] = useState<boolean>(false)
    //Как результат запроса на сервер
    // const [dialogsMessages, setDialogsMessages] = useState<{ dialogId: string, messages: { messageId: string | null, files: string | null, text: string | null, userId: string, date: number | null }[] }[]>(
    //     [
    //         {
    //             dialogId: '1', messages:
    //                 [
    //                     { messageId: '5', userId: '1234', text: 'asdwads', files: null, date: 127 },
    //                     { messageId: '4', userId: '5432', text: 'Sample Text', files: null, date: 126 },
    //                     { messageId: '3', userId: '1234', text: 'asdwads', files: null, date: 125 },
    //                     {
    //                         messageId: '2', userId: '5432', text: 'Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Text',
    //                         files: null, date: 124
    //                     },
    //                     { messageId: '1', userId: '5432', text: 'Sample Text', files: null, date: 123 },
    //                 ],
    //         },
    //         {
    //             dialogId: '2', messages:
    //                 [
    //
    //                     { messageId: '5', userId: '1234', text: 'Привет', files: null, date: 127 },
    //                     { messageId: '4', userId: '2342', text: 'Sample Text', files: null, date: 126 },
    //                     { messageId: '3', userId: '1234', text: 'asfdasd ', files: null, date: 125 },
    //                     {
    //                         messageId: '2', userId: '2342', text: 'Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Text',
    //                         files: null, date: 124
    //                     },
    //                     { messageId: '1', userId: '2342', text: 'Sample Text', files: null, date: 123 },
    //                 ],
    //         }
    //     ])
    const [dialogsMessages, setDialogsMessages] = useState<{
        dialogId: string,
        messageId: string | null,
        text: string | null,
        userSenderId: string,
        createDate: any | null,
        updateDate: any | null,
    }[]|null>(null)

    // {id: '2', groupid: '1', usersenderid: '1', createdate: '2000-12-31T21:00:00.000Z', updatedate: '2000-12-31T21:00:00.000Z', …}
    // const [dialogMessages, setDialogMessages] = useState<any>()
    const [textMessage, setTextMessage] = useState<string | null>('')
    const [status, setStatus] = useState("")
    const [flagWS, setFlagWS] = useState<boolean>(false)
    const [latestMessage,setLatestMessage] = useState<any>(null)

    // const uploadDialogMessages = () => {
    //     getMessages(messenger.selectedDialog.dialogId).then(data => {
    //         setDialogsMessages(data.map((row: any) => ({dialogId: row.groupid,
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
        ws.current.onopen = () => setStatus("Соединение открыто");	// callback на ивент открытия соединения
        ws.current.onclose = () => setStatus("Соединение закрыто");
        getWSMessages()
    }, [ws]);

    const getWSMessages = useCallback(() => {
        ws.current.onmessage = (message: MessageEvent<any>) => {
            // setFlagWS(!flagWS)
            setLatestMessage(message)
            console.log('Message: %s', message.data);
        }
    }, [latestMessage])
    useEffect(() => {
        if (!messenger.selectedDialog)
            return
        getMessages(messenger.selectedDialog.dialogId).then(data => {
            console.log("Вызов")
            // console.log(flagWS)
                console.log(data?.filter((dialog: any) => dialog.groupid === messenger.selectedDialog.dialogId))
            messenger.setDialogMessages(data.filter((dialog: any) => dialog.groupid === messenger.selectedDialog.dialogId)?.map((message: any) =>
                ({
                        messageId: message.id,
                        text: message.text,
                        userSenderId: message.usersenderid,
                        createDate: message.createdate,
                        updateDate: message.updatedate,
                        files: null
                })))
            }

        )
    }, [messenger.selectedDialog,  latestMessage]);
    // const selectDialog = (sDialog: any) => {
    //     getMessages(sDialog.dialogId).then(data => {
    //             setDialogsMessages(data.map((row: any) => ({dialogId: row.groupid,
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

    return (
        <div style={{ display: "flex", justifyContent: "center" }}>
            <div style={{ display: "flex", flexDirection: "column", width: "300px", height: "500px", background: "bisque" }}>
                {
                    messenger.dialogs.map((dialog: { dialogId: string, dialogName: string | null, dialogImage: string | null, users: { userId: string, fN: string, image: string | null }[] }) =>
                        <div
                            style={{ display: "flex", cursor: "pointer", border: "solid 1px black", width: "100%", height: "50px", alignItems: "center" }}
                            key={dialog.dialogId}
                            onClick={async () => {
                                if (messenger.selectedDialog !== dialog)
                                    messenger.setSelectedDialog(dialog)

                            }
                        }
                        >
                            <div style={{ display: 'flex', width: "50px", height: "50px", justifyContent: "center", alignItems: "center" }}>
                                {
                                    dialog.dialogImage ? <img src={dialog.dialogImage} style={{ borderRadius: "50%" }} />
                                        :
                                        <div style={{ display: 'flex', width: "90%", height: '90%', borderRadius: "50%", backgroundColor: "blue" }} />

                                }
                            </div>
                            {dialog.dialogName ? dialog.dialogName
                                :
                                dialog.users.map((user: { userId: string, fN: string, image: string | null }) => {
                                    if (user.userId !== userId())
                                        return user.fN
                                }
                                ).join(" ")
                            }
                        </div>

                    )
                }
            </div>
            <div style={{ display: 'flex', background: "honeydew", maxWidth: "900px", width: "700px", minHeight: "500px", flexDirection: "column" }}>

                <div style={{ display: "flex", flexDirection: "column", width: "100%", height: "100%", justifyContent: "end"}}>
                    {
                        messenger.selectedDialog ?
                            (messenger.dialogMessages? messenger.dialogMessages.map((message: {messageId: string|null, files: string|null, text: string|null, userSenderId: string, createDate :any|null, updateDate: any|null}) =>
                                <div key={message.messageId} style={userId() === message.userSenderId ? { background: "lightblue", marginRight: "35px", marginLeft: "auto", marginTop: "5px", marginBottom: "5px", color: (message.createDate ? "black" : "red") } : { background: "lightgreen", marginRight: "auto", marginLeft: "35px", marginTop: "5px", marginBottom: "5px", }}>{message.text}</div>
                            ):
                            <div style={{ display: "flex", width: "100%", height: "100%", justifyContent: "center", alignItems:"center"}}>
                                Все еще не ни одного сообщения, начните первым!
                            </div>)
                            :
                            null
                    }
                </div>
                {
                    messenger.selectedDialog ?
                        <div style={{ display: "flex", marginBottom: "0px", marginTop: "auto", background: "yellowgreen", width: "100%", maxHeight: "120px", paddingTop: "", alignItems: "center" }}>

                            <div style={{ marginBottom: "0px", marginTop: "auto", width: "30px", height: "30px", marginLeft: "auto" }}>X</div>
                            <div contentEditable={"true"} style={{ padding: "3px", borderRadius: "5px", background: "yellow", width: "450px", minHeight: "30px", maxHeight: "120px", resize: "none", marginTop: "5px", marginBottom: "5px", overflowX: "hidden", overflowY: "auto", textAlign: "start", boxSizing: "border-box" }}
                                onInput={(e: React.ChangeEvent<HTMLInputElement>) => {
                                    setTextMessage(e.currentTarget.textContent)
                                }}
                                suppressContentEditableWarning={true}
                            >
                                {textMessage}
                            </div>
                            <input
                                type={"button"}
                                value={"X"}
                                style={{ marginRight: "auto", marginLeft: "5px", width: "25px", height: "25px", }}
                                onClick={() => sendingMessage()}
                            />
                        </div>
                        :
                        null
                }

            </div>


        </div>
    );
});

export default MessengerPage;