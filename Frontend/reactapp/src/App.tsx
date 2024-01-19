import React, {useContext, useEffect, useState} from 'react';
import './App.css';
import MessengerPage from "./pages/MessengerPage";
import SideMenu from "./components/SideMenu";
import {Context} from "./index"
import {check} from "./http/userAPI";
import NavBar from "./components/NavBar";
import {BrowserRouter} from "react-router-dom";
import {JwtPayload} from "jwt-decode";
import AppRouter from "./components/AppRouter";



export

function App() {
    const {user} = useContext(Context)
    // const {order} = useContext(Context)


    const [card, setCard] = useState()
    const [modal, setModal] = useState(false)
    const [selectedSort, setSelectedSort] = useState('')
    const [searchQuery, setSearchQuery] = useState('')
    const [filter, setFilter] = useState({ sort: '', query: '' })
    // const sortedAndSearchedItems = useItems(items, filter.sort, filter.query)
    const [loading, setLoading] = useState(true)

    useEffect(() => {
            // setTimeout(() => {
            //     check().then(data => {
            //         const {userId} = data
            //             user.setUser(userId)
            //             user.setIsAuth(true)
            //
            //
            //     }).finally(() => setLoading(false))
            //
            // }, 1000)
        }
        ,[])

    // if (loading) {
    //     return <div>Loading</div>
    // }
  return (
    <div className="App" style={{display: "flex", flexDirection: "column", maxWidth: "100vw", height: "100vh"}}>
        <BrowserRouter>
            <NavBar/>

            {/*<nav style={{minWidth: "100%", height: "50px", background: "gray", marginBottom: "5px",display: "flex"}}></nav>*/}
            <div style={{display: "flex", marginLeft: "auto", marginRight: "auto"}}>
                {/*<SideMenu></SideMenu>*/}
                {/*<MessegerPage></MessegerPage>*/}
            </div>
            <AppRouter></AppRouter>
        </BrowserRouter>
    </div>
  );
}

export default App;
