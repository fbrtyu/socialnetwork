import React, {useContext, useState} from 'react';
import SearchInput from "../components/SearchInput/SearchInput";
import {WebsocketContext} from "../utils/WebSocketProvider";
import TopPanel from "../components/TopPanel/TopPanel";
import NavBar from "../components/NavBar/NavBar";

const FriendsPage = () => {
    const [status, latestMessage, send] = useContext(WebsocketContext)
    const [searchValue, setSearchValue] = useState<string>('')
    const [friendList, setFriendList] = useState<any>([])
    console.log(status)
    return (
        <div
             className={"page"}
        >
            <div
                className={"flexColumn subPanel"}
            >
                <TopPanel>
                    <NavBar/>
                    <SearchInput searchValue={searchValue} setSearchValue={setSearchValue} placeholder={"Поиск"}></SearchInput>
                </TopPanel>

                <div style={{display:"flex", maxHeight:"min-content", justifyContent: "center",
                    alignItems: "center",backgroundColor: "#2BB98B"}}>
                    <div style={{color: "white"}}>
                        Показать фильтры
                    </div>
                </div>
                <div className={"listItem"}>Список друзей</div>
                <div className={"listItem"}>Поиск людей</div>
            </div>
            <div
                className={"contentBlock mainPanel"}
            >
                <div className={"flexColumn"}>
                    {/*<div style={{display:"flex"}}>Все</div>*/}
                    {/*<div style={{display:"flex"}}>Онлайн</div>*/}
                </div>
            </div>
        </div>
    );
};

export default FriendsPage;