import React, {useContext} from 'react';
import UserStore from "../storage/UserStorage";
import {
    ADMIN_ROUTE,
    LOGIN_ROUTE, MAIN_ROUTE,
    REGISTRATION_ROUTE,
    MESSENGER_ROTE
} from "../utils/consts";
import {Context} from "../index";
import {observer} from "mobx-react-lite";
import {useLocation, useNavigate} from "react-router-dom";
import Auth from "../pages/Auth";

const NavBar = observer( () => {
    const {user, order} = useContext(Context)
    const navigate = useNavigate()
    const location = useLocation()
    const isAuth = location.pathname === (LOGIN_ROUTE || REGISTRATION_ROUTE)
    const logOut = () => {
        user.setUser({})
        user.setIsAuth(false)
    }
    return (
        <nav style={{backgroundColor: "#2BB98BFF"}}>
            <div onClick={() => navigate(MAIN_ROUTE)}>Главная</div>
            <div onClick={() => navigate(MESSENGER_ROTE)}>Messenger</div>
            <div onClick={() => navigate(LOGIN_ROUTE)}>Login</div>
            {/*<div>*/}
            {/*    <a style={{color:'white'}} href={MAIN_ROUTE}>PCStore</a>*/}
            {/*    <div className={'me-0 ms-auto'} aria-controls={`offcanvasNavbar-expand-md`} />*/}
            {/*    /!*<div*!/*/}
            {/*    /!*    id={`offcanvasNavbar-expand-md`}*!/*/}
            {/*    /!*    aria-labelledby={`offcanvasNavbarLabel-expand-md`}*!/*/}
            {/*    /!*    // placement="end"*!/*/}
            {/*    /!*>*!/*/}
            {/*            {user.isAuth ?*/}
            {/*                <nav className="ml-auto">*/}
            {/*                    /!*<Nav.Link className={"text-md-center"} onClick={() => navigate(MAIN_ROUTE)}>Каталог</Nav.Link>*!/*/}
            {/*                    /!*<input type={"button"} className={"buttonStyle2 ms-2"} onClick={() => navigate(ORDER_ROUTE)}>Корзина</input>*!/*/}
            {/*                    <input type={"button"} className={"buttonStyle2 ms-2"} onClick={() => navigate(ADMIN_ROUTE)}>Панель изменений</input>*/}
            {/*                    <input type={"button"} className={"buttonStyle2 ms-2"} onClick={() =>*/}
            {/*                    {*/}
            {/*                        navigate(MESSENGER_ROTE)*/}
            {/*                        logOut()*/}

            {/*                    }}*/}
            {/*                    >Выход</input>*/}
            {/*                </nav>*/}
            {/*                :*/}
            {/*                <nav className="ml-auto">*/}
            {/*                    <a onClick={() => navigate(MAIN_ROUTE)}>Каталог</a>*/}
            {/*                    <a onClick={() => navigate(MESSENGER_ROTE)}>Конфигуратор</a>*/}
            {/*                    {!isAuth ?*/}
            {/*                        <input className={"buttonStyle2"} onClick={() => navigate(LOGIN_ROUTE)}>Авторизация</input>*/}
            {/*                        :*/}
            {/*                        null}*/}
            {/*                </nav>*/}
            {/*            }*/}

            {/*    /!*</div>*!/*/}
            {/*</div>*/}
        </nav>

    );
});

export default NavBar;