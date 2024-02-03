import React, {useContext, useState} from 'react';
// import {Button, Card, Container, Form, NavLink, Row} from "react-bootstrap";
import {LOGIN_ROUTE, REGISTRATION_ROUTE, MAIN_ROUTE} from "../utils/consts";
import {useLocation, useNavigate} from "react-router-dom";
import {registration, login} from "../http/userAPI";
import {observer} from "mobx-react-lite";
import {Context} from "../index";

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
                data = await login(email, password)
            }
            else
            {
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
        <div

            style={{display: "flex", justifyContent: "center", alignItems: "center", height: "100%"}}
        >
            <div style={{display: "flex", flexDirection: "column", width: 500, height: 400, background: "#ffffff", borderRadius: "5%",  justifyContent: "center", alignItems: "center",
                boxSizing: "border-box",
                paddingBottom: "20px"}}>
                <h2 className="m-auto">{isLogin ? 'Вход' : 'Регистрация'}</h2>
                    <input
                        type={"text"}
                        style={{marginBottom:"5px"}}
                        placeholder="Email"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                    />
                    {isLogin ?
                        <div></div>
                        :
                        <input
                            type={"text"}
                            style={{marginBottom:"5px"}}
                            placeholder="Имя"
                            value={name}
                            required
                            onChange={e => setName(e.target.value)}
                        />
                    }
                    <input
                        placeholder="Пароль"
                        style={{marginBottom:"5px"}}
                        value={password}
                        type={"password"}
                        required
                        onChange={e => setPassword(e.target.value)}
                    />
                    {isLogin ?
                        null
                        :
                        <input
                            placeholder="Повторите пароль"
                            style={{marginBottom:"5px"}}
                            value={passwordCheck}
                            type={"password"}
                            onChange={e => setPasswordCheck(e.target.value)}
                        />

                    }
                            <div style={{marginBottom:"10px"}}>
                                {isLogin ?
                                    <div onClick={() => navigate(REGISTRATION_ROUTE)}>Регистрация</div>
                                    :
                                    <div onClick={() => navigate(LOGIN_ROUTE)}>Есть аккаунт? Войдите</div>
                                }
                            </div>
                    <input
                        type = {"submit"}
                        onClick={() => accept()}
                        className={"mt-2 buttonStyle"}
                        value={isLogin ? 'Войти' : 'Зарегестрироваться'}
                        style={{marginBottom:"10px"}}
                    >
                    </input>
                {
                    error?
                        <div style={{color: "red"}}>{error}</div>
                        :
                        null
                }
            </div>

        </div>
    );
});

export default Auth;