
import {
    ADMIN_ROUTE,
    LOGIN_ROUTE,
    REGISTRATION_ROUTE,
    MAIN_ROUTE,
    MESSENGER_ROTE, FRIEND_ROTE
} from "./utils/consts";
import Auth from "./pages/Auth";
import MessengerPage from "./pages/MessengerPage";
import Main from "./pages/Main";
import Admin from "./pages/Admin";
import FriendsPage from "./pages/FriendsPage";


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
        path: FRIEND_ROTE,
        Component: FriendsPage
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
        path: MAIN_ROUTE,
        Component: Main
    }
]