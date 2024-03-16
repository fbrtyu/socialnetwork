import React, {useContext} from 'react';
import MessageInput from "./MessageInput";
import {Context} from "../index";
import {observer} from "mobx-react-lite";
import {action} from "mobx";

const DialogWindow = observer((props: any) => {
    const {user,messenger} = useContext(Context)
    const {textMessage, setTextMessage, sendingMessage, selectMessage} = props


    const userId = () => user.user.userId
    return (
        <div style={{ display: 'flex', background: "#FBFFFF", maxWidth: "900px", width: "700px", maxHeight: "100%", flexDirection: "column",  boxSizing:"border-box", borderRadius: "5px", overflow: "hidden" }}>
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
                                        className={"message" + (message.selected ? " selectMessage" : "")}
                                        style={{display: "flex", alignItems: "center", minHeight: 'min-content', maxHeight: '100%', paddingRight: (userId() === message.userSenderId ? "5px": ""),
                                        paddingLeft: (userId() === message.userSenderId ? "" : "5px"), boxSizing:"border-box", justifyContent: (userId() === message.userSenderId?  "end": "start"),}}
                                        key={message.messageId}
                                        onMouseEnter={action(() => {message.active = true})}
                                        onMouseLeave={action(() => {delete message.active})}
                                        onClick={action(() => {
                                            // selectMessage(message.userSenderId)
                                            message.selected ? delete message.selected : message.selected = true
                                        })}
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
                                                color: (message.createDate ? "black" : "red"), boxSizing:"border-box", borderRadius:"5px", order: (userId() === message.userSenderId? '4': '2')}}
                                        >
                                            <div style={{marginLeft: "10px", marginTop: "2px", marginRight: "10px", fontWeight: '500'}}>
                                                {message.firstName}
                                            </div>
                                            <div style={{textAlign:"justify", color: "#424242", fontSize: '0.9rem',whiteSpace: 'normal',wordWrap: 'break-word', marginRight: "10px", marginLeft: "10px", paddingTop: "2px", boxSizing: "border-box"}}>
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
                                                    <div style={{display:"flex", height: "20px", width: "20px", alignItems: "center", justifyContent: 'center'}}>x</div>
                                                    <div style={{display:"flex", height: "20px", width: "20px", alignItems: "center", justifyContent: 'center'}}>y</div>
                                                    <div style={{display:"flex", height: "20px", width: "20px", alignItems: "center", justifyContent: 'center'}}>z</div>
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
                    <MessageInput textMessage={textMessage} setTextMessage={setTextMessage} sendingMessage={sendingMessage}></MessageInput>
                    :
                    null
            }
        </div>
    );
});

export default DialogWindow;