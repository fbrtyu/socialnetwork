import React, {useState} from 'react';

const SideMenu = () => {
    const [menuList, setMenuList] = useState([{name: "Мессенджер", link: ""},
        {name: "Игры", link: ""},{name: "Транстляции", link: ""}])
    return (
        <div style={{display: "flex", flexDirection: "column", padding: "5px", background: "ghostwhite", maxWidth: "250px", minWidth: "250px", marginRight: "5px", marginLeft:"5px", boxSizing: "border-box"}}>
            {
                menuList.map(select =>
                    <div style={{display: "flex",border: "1px solid", borderRadius: "4px", justifyContent: "start", height: "35px", alignItems: "center", textAlign: "center", paddingLeft: "5px", marginTop: "2px", marginBottom: "2px"}}>{select.name}</div>
                )
            }
        </div>
    );
};

export default SideMenu;