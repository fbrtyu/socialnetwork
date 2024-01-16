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
                data = await login(email,password)
            }
            else
            {
                if (password === passwordCheck)
                    data = await registration(email, password, name)
                else
                    setError('Пароли не совпадают')

            }
            console.log(data)
            user.setUser(data.id)
            user.setIsAuth(true)
            navigate(MAIN_ROUTE)

        } catch (e: any)
        {
            alert(e.response.data.message)
        }
    }
    return (
        <div
            className={"d-flex justify-content-center align-items-center"}
            style={{height: window.innerHeight - 54}}
        >
            <div style={{width: 600}} className="p-5">
                <h2 className="m-auto">{isLogin ? 'Вход' : 'Регистрация'}</h2>
                <form className="d-flex flex-column" method={"post"}>
                    <input
                        type={"text"}
                        className="mt-4"
                        placeholder="Email"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                    />
                    {isLogin ?
                        <div></div>
                        :
                        <input
                            type={"text"}
                            className="mt-4"
                            placeholder="Имя"
                            value={name}
                            required
                            onChange={e => setName(e.target.value)}
                        />

                    }
                    <input
                        className="mt-4"
                        placeholder="Пароль"
                        value={password}
                        type={"password"}
                        required
                        onChange={e => setPassword(e.target.value)}
                    />
                    {isLogin ?
                        null
                        :
                        <input
                            className="mt-4"
                            placeholder="Повторите пароль"
                            value={passwordCheck}
                            type={"password"}
                            onChange={e => setPasswordCheck(e.target.value)}
                        />

                    }

                    <div>
                        {isLogin ?
                            <div className={"d-flex mt-2 justify-content-between"}>
                                <div onClick={() => navigate(REGISTRATION_ROUTE)}>Регистрация</div>
                            </div>
                            :
                            <div className={"d-flex mt-2 justify-content-between"}>
                                <div onClick={() => navigate(LOGIN_ROUTE)}>Есть аккаунт? Войдите</div>
                            </div>
                        }

                    </div>
                    <input
                        type = {"submit"}
                        onClick={() => accept()}
                        className={"mt-2 buttonStyle"}
                        value={isLogin ? 'Войти' : 'Зарегистрироваться'}
                    >

                    </input>

                </form>
            </div>

        </div>
    );
});

export default Auth;