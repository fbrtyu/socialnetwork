import React from 'react';
import TopPanel from "../components/TopPanel/TopPanel";
import NavBar from "../components/NavBar/NavBar";

const Main = () => {
    return (
        <div className={"page"}>
            <div className={"mainPanel"}>
                <TopPanel>
                    <NavBar/>
                </TopPanel>
            </div>
        </div>
    );
};

export default Main;