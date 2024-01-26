import React, {useContext} from 'react';
import MessageInput from "./MessageInput";
import {Context} from "../index";

const DialogWindow = (props: any) => {
    const {user,messenger} = useContext(Context)
    const {textMessage, setTextMessage, sendingMessage} = props
    const userId = () => user.user.userId
    return (
        <div style={{ display: 'flex', background: "honeydew", maxWidth: "900px", width: "700px", maxHeight: "100%", flexDirection: "column",  boxSizing:"border-box" }}>
            <div id={"chat"} style={{ display: "flex", flexDirection: "column", width: "100%",  minHeight:'min-content', maxHeight: "100%",  overflow: 'auto', boxSizing:"border-box"}}>
                {
                    messenger.selectedDialog ?
                        (messenger.dialogMessages? Object.keys(messenger.dialogMessages).map((key: string) =>
                                <div key={key}>
                                    <div>{key}</div>
                                    {messenger.dialogMessages[key].map((message: any) =>
                                        <div  style={{display: "flex", alignItems: "center", minHeight: 'min-content', maxHeight: '100%', marginRight: (userId() === message.userSenderId ? "5px": ""),
                                            marginLeft: (userId() === message.userSenderId ? "" : "5px"), boxSizing:"border-box"}}
                                              key={message.messageId}>
                                            <div style={{ display: 'flex', width: "50px", height: "50px", justifyContent: "center", alignItems: "center",boxSizing:"border-box" }}>
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
                                                {display: 'inline-block', background: (userId() === message.userSenderId ? "lightblue": "lightgreen"),
                                                    marginRight: (userId() === message.userSenderId ? "5px": "auto"),
                                                    marginLeft: (userId() === message.userSenderId ? "auto": "5px"),
                                                    textAlign: "justify", whiteSpace: 'normal',wordWrap: 'break-word',
                                                    marginTop: "5px", marginBottom: "5px",maxWidth: "70%",maxHeight: "auto",
                                                    color: (message.createDate ? "black" : "red"), boxSizing:"border-box"}}
                                            >
                                                <div style={{marginLeft: "10px", marginTop: "2px", marginRight: "10px", fontWeight: '500'}}>
                                                    {message.firstName}
                                                </div>
                                                <div style={{textAlign:"justify", color: "#424242", fontSize: '0.9rem',whiteSpace: 'normal',wordWrap: 'break-word', marginRight: "10px", marginLeft: "10px", paddingTop: "2px", boxSizing: "border-box"}}>
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
                    <MessageInput textMessage={textMessage} setTextMessage={setTextMessage} sendingMessage={sendingMessage}></MessageInput>
                    :
                    null
            }

        </div>
    );
};

export default DialogWindow;