import React from 'react';
// import iconSend from '../icons/send2.svg';

const MessageInput = (props: any) => {
    const onKeyDown = (e: any) =>{
        // обработайте нажатие клавиши.
        if (e.keyCode === 13 && !e.shiftKey){
            e.preventDefault();
            props.sendingMessage()
        }

    }
    return (
        <div style={{ display: "flex", marginBottom: "0px", marginTop: "auto", background: "#2BB98BFF", width: "100%", maxHeight: "200px", paddingTop: "", alignItems: "center", minHeight: "min-content"}}>

            <div style={{ marginBottom: "0px", marginTop: "auto", width: "30px", height: "30px", marginLeft: "auto"}}></div>
            <textarea
                placeholder={"Напишите сообщение"}
                onChange={(e) =>
                {
                    props.setTextMessage(e.target.value)
                    e.target.style.height = 'auto';
                    e.target.style.height = (e.target.scrollHeight) + 'px';//////console.log(this.scrollHeight);
                }
            }
                className={'inputBlockFocusOff inputBlock'}
                style={{
                    // padding: "3px",
                    background: "#FBFFFF",
                    borderRadius: "3px",
                    width: "450px", minHeight: 'min-content',
                    maxHeight: "180px", resize: "none",
                    marginTop: "5px", marginBottom: "5px",
                    overflowX: "hidden", overflowY: "auto",
                    paddingLeft: "10px", fontSize: "1rem",
                    fontFamily: " sans-serif",
                    verticalAlign: "middle",
                    textAlign: "start", boxSizing: "border-box",}}
                value={props.textMessage}
                onKeyDown={(e) => onKeyDown(e)}

            >
            </textarea>
            <div
                // className={"icon"}
                style={{display: "flex", flexShrink: "0", marginRight: "auto", marginLeft: "5px", width: "35px", height: "35px", border: "none", alignItems: "center",}}
                onClick={() => props.sendingMessage()}
            >
                <svg viewBox="0 -0.5 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" className={"icon"}>
                <path fillRule="evenodd" clipRule="evenodd" d="M18.455 9.8834L7.063 4.1434C6.76535 3.96928 6.40109 3.95274 6.08888 4.09916C5.77667 4.24558 5.55647 4.53621 5.5 4.8764C5.5039 4.98942 5.53114 5.10041 5.58 5.2024L7.749 10.4424C7.85786 10.7903 7.91711 11.1519 7.925 11.5164C7.91714 11.8809 7.85789 12.2425 7.749 12.5904L5.58 17.8304C5.53114 17.9324 5.5039 18.0434 5.5 18.1564C5.55687 18.4961 5.77703 18.7862 6.0889 18.9323C6.40078 19.0785 6.76456 19.062 7.062 18.8884L18.455 13.1484C19.0903 12.8533 19.4967 12.2164 19.4967 11.5159C19.4967 10.8154 19.0903 10.1785 18.455 9.8834V9.8834Z" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
            </div>
        </div>
    );
};

export default MessageInput;