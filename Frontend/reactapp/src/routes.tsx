
import {
    ADMIN_ROUTE,
    LOGIN_ROUTE,
    REGISTRATION_ROUTE,
    MAIN_ROUTE,
    MESSENGER_ROTE
} from "./utils/consts";
import Auth from "./pages/Auth";
import MessengerPage from "./pages/MessengerPage";
import Main from "./pages/Main";
import Admin from "./pages/Admin";
// import Admin from  "./pages/Admin";

export  const authRoutes =  [
    {
        path: ADMIN_ROUTE,
        Component: Admin
    },
    {
        path: MESSENGER_ROTE,
        Component: MessengerPage
    },
    {
        path: MAIN_ROUTE,
        Component: Main
    }
]
export  const publicRoutes = [
    {
        path: LOGIN_ROUTE,
        Component: Auth
    },
    {
        path: REGISTRATION_ROUTE,
        Component: Auth
    },
    {
        path: MESSENGER_ROTE,
        Component: MessengerPage
    }
    // {
    //     path: BUILD_ROUTE + '/:id',
    //     Component: Build
    // },


]