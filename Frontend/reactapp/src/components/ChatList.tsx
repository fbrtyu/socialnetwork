import React, {useContext} from 'react';
import {observer} from "mobx-react-lite";
import {Context} from "../index";

const ChatList = observer(() => {
    const {user, messenger} = useContext(Context)
    const userId = () => user.user.userId
    return (
        <div style={{ display: "flex", flexDirection: "column", width: "300px", minWidth:"300px", background: "bisque",maxHeight: "100%"}}>
            {
                messenger.dialogs.map((dialog: { dialogId: string, dialogName: string | null, dialogImage: string | null, users: { userId: string, fN: string, image: string | null }[] }) =>
                    <div
                        style={{ display: "flex", cursor: "pointer", border: "solid 1px black", width: "100%", height: "50px", alignItems: "center"}}
                        key={dialog.dialogId}
                        onClick={async () => {
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
    );
});

export default ChatList;