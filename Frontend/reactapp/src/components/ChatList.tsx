import React, {useContext} from 'react';
import {observer} from "mobx-react-lite";
import {Context} from "../index";
import {Dialog, DialogUser} from "../interfaces/IMessenger";

const ChatList = observer(() => {
    const {user, messenger} = useContext(Context)
    const userId = () => user.user.userId
    return (
        <div style={{ display: "flex", flexDirection: "column", maxWidth: "300px", minWidth:"300px", background: "#FBFFFF",maxHeight: "100%",
            boxSizing: "border-box",
            marginRight: "10px", borderRadius: "5px", overflow: "hidden"}}>
            {
                messenger.dialogs.map((dialog: Dialog) =>
                    <div
                        className={(messenger.selectedDialog == dialog? "selectedItem": "listItem")}
                        style={{ display: "flex", cursor: "pointer", border: "", width: "100%", height: "50px", alignItems: "center", boxSizing: "border-box"}}
                        key={dialog.dialogId}
                        onClick={() =>
                            {
                                if (messenger.selectedDialog !== dialog) {
                                    messenger.setSelectedDialog(dialog)
                                }
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
                            dialog.users.map((user: DialogUser) => {
                                    if (user.userId !== userId())
                                        return user.fN
                                }
                            ).join(" ")
                        }
                    </div>

                )
            }
        </div>
    );
});

export default ChatList;