import React, {useState} from 'react';
import {observer} from "mobx-react-lite";

const MessengerPage = observer(() => {
    const id = 1234
    const [dialogMessagges, setDialogMessagese] = useState([{id: 1,sender: 1234, text: "texs12w", date: ""},
        {id: 2,sender: 1234, text: "texs12w", date: ""},
        {id: 3,sender: 1234512, text: "texs12w", date: ""},
        {id: 4,sender: 1234, text: "texs12w", date: ""},
        {id: 5,sender: 1234512, text: "texs12w", date: ""},
        {id: 6,sender: 1234512, text: "texs12w", date: ""},
        {id: 7,sender: 1234, text: "texs12w", date: ""}])
    return (
        <div style={{display:"flex"}}>
            <div style={{display: 'flex', background: "honeydew", maxWidth: "900px", width: "700px", minHeight: "500px", flexDirection: "column"}}>
                <div style={{display: "flex", flexDirection: "column-reverse", width: "100%", height: "100%"}}>
                    {
                        dialogMessagges.map(message =>
                                <div  key={message.id} style={id === message.sender ? {background: "lightblue", marginRight:"35px", marginLeft: "auto", marginTop: "5px", marginBottom:"5px"}: {background: "lightgreen", marginRight:"auto", marginLeft: "35px", marginTop: "5px", marginBottom:"5px"}}>{message.text}</div>
                            )
                    }
                </div>
                <div style={{display: "flex", marginBottom: "0px", marginTop: "auto", background: "yellowgreen", width: "100%", maxHeight: "120px", paddingTop: "", alignItems: "center"}}>
                    <div style={{marginBottom: "0px", marginTop: "auto", width: "30px", height: "30px",  marginLeft: "auto"}}>X</div>
                    <div contentEditable={"true"} style={{padding: "3px", borderRadius: "5px", background: "yellow", width: "450px", minHeight: "30px",maxHeight: "120px", resize: "none", marginTop: "5px", marginBottom:"5px", overflowX: "hidden", overflowY: "auto", textAlign: "start", boxSizing: "border-box"}}></div>
                    <input type={"button"} value={"X"} style={{marginRight: "auto", marginLeft: "5px", width: "25px", height: "25px",}}/>
                </div>
            </div>


        </div>
    );
});

export default MessengerPage;