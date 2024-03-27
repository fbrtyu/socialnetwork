import React, { useContext, useEffect, useState} from 'react';
import { observer } from "mobx-react-lite";
import { Context } from "../index";
import {getChatMessages, getChats} from "../http/messengerAPI";
import ChatList from "../components/ChatList/ChatList";
import DialogWindow from "../components/DialogWindow/DialogWindow";
import {WebsocketContext} from "../utils/WebSocketProvider";


const MessengerPage = observer(() => {
    // const ws = useRef<any>(null);
    const { user, messenger } = useContext(Context)
    const [status, latestMessage, send] = useContext(WebsocketContext)

    //Функция для отправки сообщения в Вебсокет
    function wsSendEcho() {
        //Пока такие данные, их надо будет хранить у клиента и получать из переменных
        send(JSON.stringify({ action: 'ECHO', data: textMessage, chatid: messenger.selectedDialog.dialogId, usersenderid: userId(), createdate: null, updatedate: null }));
    }
    const [textMessage, setTextMessage] = useState<string | null>('')
    // const [status, setStatus] = useState("")
    // const [latestMessage,setLatestMessage] = useState<any>(null)
    const [selectedOwnMessages, setSelectedOnwMessages] = useState<boolean[]>([])
    const [selectedOtherMessages, setSelectedOtherMessages] = useState<boolean[]>([])
    const [searchValue, setSearchValue] = useState<string>('')
    const selectMessage = (id: number) => {
        if (userId() === id)
        {
            selectedOwnMessages[id] ? delete selectedOwnMessages[id] : selectedOwnMessages[id] = true
            console.log(selectedOwnMessages.length)
        }
        else
        {
            selectedOtherMessages[id] ? delete selectedOtherMessages[id] : selectedOtherMessages[id] = true
            console.log(selectedOtherMessages.length)
        }
    }

    useEffect(() => {
        getChats(userId()).then((data) => { //: {Count: number, Chats: any[]}[]
                console.log(userId())
                console.log(data)
            messenger.setDialogs(data.Chats.map((chat: any) => (
                {
                    dialogId: chat.chatid,
                    dialogName: chat.chatname,
                    dialogImage: null,
                    userCreatorId: chat.usercreaterid,
                    users: chat.Users
                })))
            }
        )
    }, [latestMessage]);

    // Триггер: выбор диалога или получение нового сообщения из WS
    useEffect(() => {
        if (!messenger.selectedDialog)
            return
        getChatMessages(messenger.selectedDialog.dialogId, userId()).then(data => { //Вот тут бы не скачивать заново из БД, а брать из вебсокета
            console.log(data)
            console.log("Вызов")
            messenger.setDialogMessages(data.LastMessages.filter((chat: any) => chat.chatid === messenger.selectedDialog.dialogId)?.map((message: any) =>
                ({
                    date:  [new Date(message.createdate).getDate(), new Date(message.createdate).getMonth() + 1,new Date(message.createdate).getFullYear()].map(function (x) {
                            return x < 10 ? "0" + x : x
                    }).join("."),
                    messageId: message.id,
                    text: message.text,
                    userSenderId: message.usersenderid,
                    firstName: message.firstname,
                    createDate: message.createdate,
                    updateDate: message.updatedate,
                    files: null
                })).reduce(function (r: any, a: any) {
                r[a.date] = r[a.date] || [];
                r[a.date].push(a);
                return r;
            }, Object.create(null)))
                console.log(messenger.dialogMessages)
            }
        )
    }, [messenger.selectedDialog,  latestMessage]);

    //Отправка сообщения через WS
    const sendingMessage = () => {
        if (!textMessage || !textMessage.replace(/^\s+|\s+$/g, ''))
            return;
        console.log("строка: " + textMessage)
        wsSendEcho();
        // uploadDialogMessages()
        //Обнуление окна ввода
        setTextMessage("")
    }

    // Временно!
    // Сброс скролла диалога к последним сообщениям при выборе диалога
    useEffect(() => {
        var block = document.getElementById("chat");
        if (block)
            block.scrollTop = block.scrollHeight;
    }, [messenger.selectedDialog && messenger.dialogMessages]);
    function delay(ms: number) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    const userId = () => user.user.userId;
    //           text-overflow: ellipsis; /* will make [...] at the end */
    // width: 370px; /* change to your preferences */
    // white-space: nowrap; /* paragraph to one line */
    // overflow:hidden; /* older browsers */
    return (
        <div className={"page"}>
            <ChatList setSearchValue={setSearchValue} searchValue={searchValue}/>
            <DialogWindow
                sendingMessage={sendingMessage}
                textMessage={textMessage}
                setTextMessage={setTextMessage}
                selectMessage={selectMessage}
            />
        </div>
    );
});

export default MessengerPage;