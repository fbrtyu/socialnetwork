import React, { useContext, useState } from 'react';

import { observer } from "mobx-react-lite";
import { Context } from "../index";

//WebSocket
const WS = new WebSocket('ws://localhost:9000');
WS.onopen = function () {
    console.log('Подключился');
};
//Функция для получения сообщений из Вебсокета
WS.onmessage = function (message) {
    console.log('Message: %s', message.data);
};

function wsSendPing() {
    WS.send(JSON.stringify({ action: 'PING' }));
};

//Функция для получения новых сообщений из БД по groupid
async function getmess(groupid: any) {
    const response = await fetch(`http://localhost:8080/getmessages?groupid=${groupid}`);
    const mess = await response.json();
    console.log(mess);
  }

const MessengerPage = observer(() => {
    //Получение новых сообщений из БД
    getmess(1);

    //Функция для отправки сообщения в Вебсокет
    function wsSendEcho() {
        let text = textMessage;
        //Пока такие данные, их надо будет хранить у клиента и получать из переменных
        WS.send(JSON.stringify({ action: 'ECHO', data: text, groupid: 1, usersenderid: 1, createdate: "01.01.2001", updatedate: "01.01.2001" }));
    };

    const { user, messenger } = useContext(Context)
    //Как результат запроса на сервер
    const [dialogsMessages, setDialogsMessages] = useState<{ dialogId: string, messages: { messageId: string | null, files: string | null, text: string | null, userId: string, date: number | null }[] }[]>(
        [
            {
                dialogId: '1', messages:
                    [
                        { messageId: '5', userId: '1234', text: 'asdwads', files: null, date: 127 },
                        { messageId: '4', userId: '5432', text: 'Sample Text', files: null, date: 126 },
                        { messageId: '3', userId: '1234', text: 'asdwads', files: null, date: 125 },
                        {
                            messageId: '2', userId: '5432', text: 'Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Text',
                            files: null, date: 124
                        },
                        { messageId: '1', userId: '5432', text: 'Sample Text', files: null, date: 123 },
                    ],
            },
            {
                dialogId: '2', messages:
                    [

                        { messageId: '5', userId: '1234', text: 'Привет', files: null, date: 127 },
                        { messageId: '4', userId: '2342', text: 'Sample Text', files: null, date: 126 },
                        { messageId: '3', userId: '1234', text: 'asfdasd ', files: null, date: 125 },
                        {
                            messageId: '2', userId: '2342', text: 'Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Text',
                            files: null, date: 124
                        },
                        { messageId: '1', userId: '2342', text: 'Sample Text', files: null, date: 123 },
                    ],
            }
        ])
    // const [dialogMessages, setDialogMessages] = useState<any>()
    const [textMessage, setTextMessage] = useState<string | null>('')
    const selectDialog = (sDialog: any) => {
        messenger.setSelectedDialog(sDialog)
        messenger.setDialogMessages(dialogsMessages.find(dialog => dialog.dialogId === sDialog.dialogId)?.messages)
    }
    const sendingMessage = () => {
        if (!textMessage)
            return;
        const id = Number(messenger.dialogMessages[0].messageId) + 1
        const sDialog = dialogsMessages.find(dialog => dialog.dialogId === messenger.selectedDialog.dialogId)
        if (!sDialog) {
            return
        }

        //Отправка сообщения в Вебсокет
        wsSendEcho();

        const length = sDialog?.messages.unshift({ messageId: new Date().getTime().toString(), userId: userId(), text: textMessage, files: null, date: null })
        selectDialog(sDialog)
        console.log(dialogsMessages)
        console.log(length)
        // messenger.dialogMessages.unshift({messageId: null, userId: userId(), text: textMessage, files: null, date: null})
        // запрос на доавбление
        setTimeout(() => {
            sDialog.messages[sDialog.messages.length - length].messageId = id.toString()
            sDialog.messages[sDialog.messages.length - length].date = new Date().getTime()
            selectDialog(sDialog)
            console.log(dialogsMessages)
            console.log(length)
            console.log("Complete")
        }, 3000);

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
                            onClick={() => selectDialog(dialog)}
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

                <div style={{ display: "flex", flexDirection: "column-reverse", width: "100%", height: "100%" }}>
                    {
                        messenger.selectedDialog ?
                            messenger.dialogMessages.map((message: { messageId: null | string; userId: any; text: string | null | undefined; date: number | null }) =>
                                <div key={message.messageId} style={userId() === message.userId ? { background: "lightblue", marginRight: "35px", marginLeft: "auto", marginTop: "5px", marginBottom: "5px", color: (message.date ? "black" : "red") } : { background: "lightgreen", marginRight: "auto", marginLeft: "35px", marginTop: "5px", marginBottom: "5px", }}>{message.text}</div>
                            )
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
                                    console.log(textMessage)
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