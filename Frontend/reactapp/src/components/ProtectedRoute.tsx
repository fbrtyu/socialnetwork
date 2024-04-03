import React, {useContext} from 'react';
import {Context} from "../index";
import {Navigate} from "react-router-dom";

const ProtectedRoute = ({children}: any)=> {
    const { user } = useContext(Context);
    if (!user.isAuth) {
        // user is not authenticated
        return <Navigate to="/main" />;
    }
    return (children);
};

export default ProtectedRoute;