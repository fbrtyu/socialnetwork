import React from 'react';

const MessageInput = (props: any) => {
    return (
        <div style={{ display: "flex", marginBottom: "0px", marginTop: "auto", background: "yellowgreen", width: "100%", maxHeight: "120px", paddingTop: "", alignItems: "center" }}>

            <div style={{ marginBottom: "0px", marginTop: "auto", width: "30px", height: "30px", marginLeft: "auto" }}>X</div>
            <div contentEditable={"true"} style={{ padding: "3px", borderRadius: "5px", background: "yellow", width: "450px", minHeight: "30px", maxHeight: "120px", resize: "none", marginTop: "5px", marginBottom: "5px", overflowX: "hidden", overflowY: "auto", textAlign: "start", boxSizing: "border-box" }}
                 onInput={(e: React.ChangeEvent<HTMLInputElement>) => {
                     props.setTextMessage(e.currentTarget.textContent)
                 }}
                 suppressContentEditableWarning={true}
            >
                {props.textMessage}
            </div>
            <input
                type={"button"}
                value={"X"}
                style={{ marginRight: "auto", marginLeft: "5px", width: "25px", height: "25px", }}
                onClick={() => props.sendingMessage()}
            />
        </div>
    );
};

export default MessageInput;