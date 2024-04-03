import React, {useContext} from 'react';
import MessageInput from "../MessageInput/MessageInput";
import {Context} from "../../index";
import {observer} from "mobx-react-lite";
import {action} from "mobx";
import styles from "./dialogWindow.module.scss"


const DialogWindow = observer((props: any) => {
    const {user,messenger} = useContext(Context)
    const {textMessage, setTextMessage, sendingMessage, selectMessage, editableMessage,
        setEditableMessage, editMessage} = props


    const userId = () => user.user.userId
    return (
        <div
            className={"mainPanel"}
            style={{}}
        >
            <div
                style={{display: (messenger.selectedDialog ? "flex" : "none"), justifyContent: "space-between", alignItems: "center",boxSizing: "border-box", border: "1px", borderColor: "#ababab", borderBottomStyle: "solid", height: "40px", cursor:"",
                    paddingRight: "5px", paddingLeft: "5px"
                }}

            >
                <div style={{paddingLeft: "5px"}}>
                    <div style={{margin: "0px", textAlign:"start", fontWeight: "700"
                    }}
                    >{messenger.selectedDialog?.dialogName}</div>
                    <div>Участников: {messenger.selectedDialog?.users?.length}</div>
                </div>
            </div>
            <div id={"chat"} style={{ display: "flex", flexDirection: "column", width: "100%",  overflow: 'auto', boxSizing:"border-box", flex: "1 1 0px"}}>
                {
                    messenger.selectedDialog ?
                        (messenger.dialogMessages? Object.keys(messenger.dialogMessages).map((key: string) =>
                            <div key={key}>
                                <div>{
                                    (
                                        new Date().getFullYear() === Number(key.split('.')[2]) &&
                                        new Date().getMonth() + 1 ===  Number(key.split('.')[1]) &&
                                        new Date().getDate() === Number(key.split('.')[0])
                                    ) ? "Сегодня" : key
                                }</div>
                                {messenger.dialogMessages[key].map((message: any) =>
                                    <div
                                        className=
                                            {
                                                styles.messageContainer + " " +
                                                (
                                                    userId() === message.userSenderId ?
                                                        styles.messageContainerOwner
                                                        :
                                                        styles.messageContainerOther
                                                ) +
                                                " " + (message.selected ? styles.selectMessage : "")
                                            }
                                        key={message.messageId}
                                        onMouseEnter={action(() => {message.active = true})}
                                        onMouseLeave={action(() => {delete message.active})}
                                    >
                                        <div style={{ display: 'flex', width: "50px", height: "50px", justifyContent: "center", alignItems: "center",boxSizing:"border-box", order: 1}}>
                                            {
                                                userId() === message.userSenderId?
                                                    null
                                                    :
                                                    // messenger.dialogs.find((dialog: any) => dialog.dialogId = messenger.selectedDialog.dialogId)?.users.find((user: any)=> user.userId = message.userSenderId)?.image ?
                                                    //         <img src={messenger.dialogs.find((dialog: any) => dialog.dialogId = messenger.selectedDialog.dialogId).users.find((user: any)=> user.userId = message.userSenderId).image} style={{ borderRadius: "50%" }} />
                                                    //         :
                                                    <div style={{ width: "90%", height: '90%', borderRadius: "50%", backgroundColor: "green",boxSizing:"border-box"}} />

                                            }
                                            {/*Проверить на ошибки*/}
                                        </div>
                                        <div  style={
                                            {
                                                display: 'inline-block', background: (userId() === message.userSenderId ? "lightblue": "lightgreen"),
                                                marginRight: (userId() === message.userSenderId ? "5px": ""),
                                                marginLeft: (userId() === message.userSenderId ? "": "5px"),
                                                textAlign: "justify", whiteSpace: 'normal',wordWrap: 'break-word',
                                                marginTop: "5px", marginBottom: "5px",maxWidth: "70%",maxHeight: "auto",
                                                color: (message.createDate ? "black" : "red"), boxSizing:"border-box",
                                                borderRadius:"5px", order: (userId() === message.userSenderId? '4': '2')}}
                                              onClick={action(() => {
                                                  message.selected ? delete message.selected : message.selected = true
                                              })}

                                        >
                                            <div style={{marginLeft: "10px", marginTop: "2px", marginRight: "10px", fontWeight: '500'}}>
                                                {message.firstName}
                                            </div>
                                            <div
                                                className={styles.text}
                                                style={{}}>
                                                {message.text}
                                            </div>

                                            <div style={{textAlign:"end", color: "#606161", fontSize: 'smaller',whiteSpace: 'normal',wordWrap: 'break-word', paddingRight: '3px', paddingBottom: '1px'}}>
                                                {

                                                    [new Date(message.createDate).getHours(), new Date(message.createDate).getMinutes()].map(function (x) {
                                                        return x < 10 ? "0" + x : x
                                                    }).join(":")
                                                }
                                            </div>
                                        </div>
                                        {
                                            message.active ?
                                                <div style={{order: "3", display: "flex", justifyContent: "space-between", paddingLeft: "5px", paddingRight: "5px"}}>
                                                    <div
                                                        className={"center "+ styles.actions}
                                                        style={{}}>x</div>
                                                    {
                                                        userId() === message.userSenderId &&
                                                        <div
                                                            className={"center "+ styles.actions}
                                                            onClick={() => {
                                                                if (editableMessage === message.messageId)
                                                                {
                                                                    setEditableMessage(false)
                                                                    setTextMessage('')
                                                                }
                                                                else {
                                                                    setEditableMessage(message.messageId)
                                                                    setTextMessage(message.text)
                                                                }
                                                            }
                                                            }
                                                            style={{}}>Ch</div>
                                                    }
                                                    <div
                                                        className={"center "+ styles.actions}
                                                        style={{}}>z</div>
                                                </div>
                                                :
                                                null
                                        }
                                    </div>
                                )}
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
                    <MessageInput
                        textMessage={textMessage}
                        setTextMessage={setTextMessage}
                        sendingMessage={sendingMessage}
                        editableMessage={editableMessage}
                        setEditableMessage={setEditableMessage}
                        editMessage={editMessage}
                    ></MessageInput>
                    :
                    null
            }
        </div>
    );
});

export default DialogWindow;