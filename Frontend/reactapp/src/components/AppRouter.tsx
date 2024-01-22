import React, {useContext} from 'react';
import {Routes, Route, Navigate} from 'react-router-dom'
// import auth from "../pages/Auth";
import {authRoutes, publicRoutes} from "../routes";
// import {BUILD_ROUTE, SHOP_ROUTE} from "../utils/consts";
import {Context} from "../index";
import {MAIN_ROUTE} from "../utils/consts";
import ProtectedRoute from "./ProtectedRoute";
import {observer} from "mobx-react-lite";

const AppRouter = observer(() => {
    const {user} = useContext(Context)
    return (
        <Routes>//добавить проверку на авторизацию
            {authRoutes.map(({path,Component}) =>
                <Route key={path} path={path} element={
                    <ProtectedRoute>
                        <Component/>
                    </ProtectedRoute>
                } />

            )}
            {publicRoutes.map(({path,Component}) =>
                <Route key={path} path={path} element={<Component/>} />
            )}
            {/*<Route path="*" element={<Navigate to={MAIN_ROUTE} replace={true}/>} />*/}
        </Routes>
    );
});

export default AppRouter;