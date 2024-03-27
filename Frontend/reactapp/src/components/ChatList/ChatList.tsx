import React, {useContext} from 'react';
import {observer} from "mobx-react-lite";
import {Context} from "../../index";
import {Dialog, DialogUser} from "../../interfaces/IMessenger";
import SearchInput from "../SearchInput/SearchInput";
import NavBar from "../NavBar/NavBar";
import styles from "./ChatList.module.scss"
import TopPanel from "../TopPanel/TopPanel";

const ChatList = observer((props: any) => {
    const {user, messenger} = useContext(Context)
    const filter = () =>
    {
        return props.searchValue? messenger.dialogs.filter((dialog: Dialog) =>
            dialog.dialogName?.includes(props.searchValue)): messenger.dialogs
    }

    const userId = () => user.user.userId
    return (
        <div className={"subPanel"}>
            <TopPanel>
                <NavBar/>
                <SearchInput  searchValue={props.searchValue} setSearchValue={props.setSearchValue} placeholder={"Поиск"}></SearchInput>
            </TopPanel>
            {
                filter().map((dialog: Dialog) =>
                    <div
                        className={(messenger.selectedDialog === dialog? "selectedItem" : "listItem")}
                        style={{ display: "flex", border: "", width: "100%", height: "50px", alignItems: "center", boxSizing: "border-box"}}
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