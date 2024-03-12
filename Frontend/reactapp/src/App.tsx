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
import {observer} from "mobx-react-lite";



const App = observer(() => {
    const {user} = useContext(Context)

    const [loading, setLoading] = useState(true)

    useEffect(() => {
            check().then(data => {
                    if (data.error)
                        console.log(data.error)
                    else
                    {
                        const {id} = data
                        user.setUser({userId: id})
                        user.setIsAuth(true)
                    }
            }).finally(() => setLoading(false))
        }
        ,[])

    if (loading) {
        return <div>Loading</div>
    }
    return (
        <div className="App" style={{display: "flex", flex: "0, 1", flexDirection: "column", maxWidth: "100vw", height: "100svh", background: "#d7d7d7"}}>
            <BrowserRouter>
                <NavBar/>
                {/*<nav style={{minWidth: "100%", height: "50px", background: "gray", marginBottom: "5px",display: "flex"}}></nav>*/}
                {/*<div style={{display: "flex", marginLeft: "auto", marginRight: "auto"}}>*/}
                {/*    /!*<SideMenu></SideMenu>*!/*/}
                {/*    /!*<MessegerPage></MessegerPage>*!/*/}
                {/*</div>*/}
                <div style={{display: "flex", maxHeight: "100%"}}></div>
                <AppRouter></AppRouter>
            </BrowserRouter>
        </div>
      );
    })

export default App;
