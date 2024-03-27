import React, {useContext, useEffect, useState} from 'react';
import './App.scss';
import {Context} from "./index"
import {check} from "./http/userAPI";
import NavBar from "./components/NavBar/NavBar";
import {BrowserRouter} from "react-router-dom";
import AppRouter from "./components/AppRouter/AppRouter";
import {observer} from "mobx-react-lite";
import WebSocketProvider from "./utils/WebSocketProvider";



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
        <WebSocketProvider>
            <div className={"App"}>
                <BrowserRouter>
                    <NavBar/>
                    <div style={{display: "flex", maxHeight: "100%"}}></div>
                    <AppRouter></AppRouter>
                </BrowserRouter>
            </div>
        </WebSocketProvider>

      );
    })

export default App;
