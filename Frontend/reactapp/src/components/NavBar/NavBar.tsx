import React, {useContext, useState} from 'react';
import {
    // ADMIN_ROUTE,
    LOGIN_ROUTE, MAIN_ROUTE,
    REGISTRATION_ROUTE,
    MESSENGER_ROTE, FRIEND_ROTE
} from "../../utils/consts";
import {Context} from "../../index";
import {observer} from "mobx-react-lite";
import {useLocation, useNavigate} from "react-router-dom";
import styles from './NavBar.module.scss'

const NavBar = observer( () => {
    const {user} = useContext(Context)
    const navigate = useNavigate()
    const location = useLocation()
    const [isActive, setIsActive] = useState<boolean>(true)
    const changeActive = () => {
        setIsActive((prev) => !prev)
    }
    // const isAuth: boolean =  !!user.user//location.pathname === (LOGIN_ROUTE || REGISTRATION_ROUTE)
    const isCurrentLocation = (compLoc: string) => compLoc === location.pathname
    const logOut = () => {
        // console.log(isAuth)
        localStorage.removeItem("token")
        localStorage.removeItem("refreshToken")
        user.setUser({})
        user.setIsAuth(false)
        navigate(MAIN_ROUTE)
    }
    return (
        <nav className={"navHidden " + (isActive? styles.navActive: "")}>
            <div className={styles.bMenu}
                 onClick={() => changeActive()}
            >
                <svg fill="none" className={isActive? styles.bMenuActive : ''} width="100%" height="100%" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4 18L20 18"  strokeWidth="2" strokeLinecap="round"/>
                    <path d="M4 12L20 12"  strokeWidth="2" strokeLinecap="round"/>
                    <path d="M4 6L20 6"  strokeWidth="2" strokeLinecap="round"/>
                </svg>
            </div>
            {
                user.isAuth ?
                    <div className={styles.routes + " " + (isActive? "": styles.hidden)}
                        onClick={() => setIsActive(true)}
                    >
                        <div className={(isCurrentLocation(MAIN_ROUTE)? styles.currentLocation: "")
                            + " " + (isActive? "": styles.short)} onClick={() => navigate(MAIN_ROUTE)}
                        >
                            {isActive? 'Main': "M"}
                        </div>
                        <div className={(isCurrentLocation(MESSENGER_ROTE)? styles.currentLocation: "")
                            + " " + (isActive? "": styles.short)} onClick={() => navigate(MESSENGER_ROTE)}
                        >
                            {isActive? 'Messenger': "Mes"}
                        </div>
                        <div className={(isCurrentLocation(FRIEND_ROTE)? styles.currentLocation: "")
                            + " " + (isActive? "": styles.short)} onClick={() => navigate(FRIEND_ROTE)}
                        >
                            {isActive? 'Friends': "Fr"}
                        </div>
                        {/*<div onClick={() => navigate(ADMIN_ROUTE)}>Admin</div>*/}
                        <div onClick={() => logOut()}
                        >
                            {isActive? 'Logout': "Out"}
                        </div>
                    </div>
                    :
                    <div className={styles.routes + " " + (isActive? "": styles.short)}
                         onClick={() => setIsActive(true)}
                    >
                        <div className={isCurrentLocation(MAIN_ROUTE)? styles.currentLocation: ""} onClick={() => navigate(MAIN_ROUTE)}>Main</div>
                        <div className={isCurrentLocation(LOGIN_ROUTE)? styles.currentLocation: ""} onClick={() => navigate(LOGIN_ROUTE)}>Sing in</div>
                        <div className={isCurrentLocation(REGISTRATION_ROUTE)? styles.currentLocation: ""} onClick={() => navigate(REGISTRATION_ROUTE)}>Sing up</div>
                    </div>
            }
        </nav>

    );
});

export default NavBar;