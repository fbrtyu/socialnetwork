import React, {useContext, useState} from 'react';
// import {Button, Card, Container, Form, NavLink, Row} from "react-bootstrap";
import {LOGIN_ROUTE, REGISTRATION_ROUTE, MAIN_ROUTE} from "../utils/consts";
import {useLocation, useNavigate} from "react-router-dom";
import {registration, login} from "../http/userAPI";
import {observer} from "mobx-react-lite";
import {Context} from "../index";
import AuthPanel from "../components/AuthPanel/AuthPanel";
import TopPanel from "../components/TopPanel/TopPanel";
import NavBar from "../components/NavBar/NavBar";

const Auth = observer(() => {
    const {user} = useContext(Context)
    const location = useLocation()
    const isLogin = location.pathname === LOGIN_ROUTE
    const navigate = useNavigate()
    const [email, setEmail] = useState('')
    const [name, setName] = useState('')
    const [password, setPassword] = useState('')
    const [passwordCheck, setPasswordCheck] = useState('')
    const [error, setError] = useState('')

    const accept = async () => {
        try {
            let data: any;
            if (isLogin){
                if (!password || !email)
                    throw new Error('Не все поля заполнены')
                data = await login(email, password)
            }
            else
            {
                if (!password || !email || !name)
                    throw new Error('Не все поля заполнены')
                if (password !== passwordCheck)
                    throw new Error('Пароли не совпадают')
                data = await registration(email, password, name)
            }
            if (data.error)
                throw new Error(data.error)
            user.setUser({userId: data.id})
            user.setIsAuth(true)
            navigate(MAIN_ROUTE)
        } catch (e: any)
        {
            console.error(e.message)
            setError(e.message)
        }
    }
    return (
        <div className={"page center"}
            // style={{display: "flex", justifyContent: "center", alignItems: "center", height: "100%"}}
        >
            <AuthPanel
                setName={setName}
                setEmail={setEmail}
                name={name}
                email={email}
                error={error}
                isLogin={isLogin}
                setPassword={setPassword}
                setPasswordCheck={setPasswordCheck}
                password={password}
                passwordCheck={passwordCheck}
                accept={accept}
            ></AuthPanel>
        </div>
    );
});

export default Auth;