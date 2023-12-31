import React, {useContext} from 'react';
import {Routes, Route, Navigate} from 'react-router-dom'
import auth from "../pages/Auth";
import {authRoutes, publicRoutes} from "../routes";
// import {BUILD_ROUTE, SHOP_ROUTE} from "../utils/consts";
import {Context} from "../index";
import {MAIN_ROUTE} from "../utils/consts";

const AppRouter = () => {
    const  {user} = useContext(Context)
    console.log(user)
    return (
        <Routes>
            {user.isAuth && authRoutes.map(({path,Component}) =>
                <Route key={path} path={path} element={<Component/>} />

            )}
            {publicRoutes.map(({path,Component}) =>
                <Route key={path} path={path} element={<Component/>} />
            )}
            <Route path="*" element={<Navigate to={MAIN_ROUTE} replace={true}/>} />

        </Routes>
    );
};

export default AppRouter;