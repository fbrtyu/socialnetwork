import React, {useContext} from 'react';
import {Routes, Route} from 'react-router-dom'
import {authRoutes, publicRoutes} from "../../routes";
import {Context} from "../../index";
import ProtectedRoute from "../ProtectedRoute";
import {observer} from "mobx-react-lite";

const AppRouter = observer(() => {
    const {user} = useContext(Context)
    return (
        //добавить проверку на авторизацию
        <Routes>
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