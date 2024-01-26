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
    const {user} = useContext(Context)
    const navigate = useNavigate()
    const location = useLocation()
    // const isAuth: boolean =  !!user.user//location.pathname === (LOGIN_ROUTE || REGISTRATION_ROUTE)
    const logOut = () => {
        // console.log(isAuth)
        localStorage.removeItem("token")
        localStorage.removeItem("refreshToken")
        user.setUser({})
        user.setIsAuth(false)
    }
    return (
        <nav style={{backgroundColor: "#2BB98BFF"}}>
            <div onClick={() => navigate(MAIN_ROUTE)}>Главная</div>
            {
                user.isAuth ?
                    <div>
                        <div onClick={() => navigate(MESSENGER_ROTE)}>Messenger</div>
                        <div onClick={() => navigate(ADMIN_ROUTE)}>Admin</div>
                        <div onClick={() => logOut()}>Logout</div>
                    </div>
                    :
                    <div>
                        <div onClick={() => navigate(LOGIN_ROUTE)}>Sing in</div>
                        <div onClick={() => navigate(REGISTRATION_ROUTE)}>Sing up</div>
                    </div>
            }
        </nav>

    );
});

export default NavBar;