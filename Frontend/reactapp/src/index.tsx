import React, {createContext} from 'react';
import ReactDOM from 'react-dom/client';
import './index.scss';
import App from './App';
// import reportWebVitals from './reportWebVitals';
import UserStore from "./storage/UserStorage";
import MessengerStorage from "./storage/MessengerStorage";
import WebSocketProvider from "./utils/WebSocketProvider";

export const Context:React.Context<any> = createContext(null)
export const WebsocketContext:React.Context<any> = createContext({ready: false, value: null, send: null})
const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
      <Context.Provider value={{
          user: new UserStore(),
          messenger: new MessengerStorage(),
          ws: null,
      }}>
          <WebSocketProvider>
              <App />
          </WebSocketProvider>
      </Context.Provider>

);


// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
// reportWebVitals();
