import React from 'react';

const SearchInput = (props: any) => {
    const {searchValue, setSearchValue, placeholder} = props
    return (
        <div
            style={{display:"flex", justifyContent: "center", alignItems: "center",boxSizing: "border-box", border: "1px", borderColor: "#ababab", borderBottomStyle: "solid", height: "40px", cursor:"",
            paddingRight: "5px", paddingLeft: "5px"
            }}
            onClick={() =>  document.getElementById("search")?.focus()}
        >
            <svg className={""} fill="#2BB98B" height="25px" width="25px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                 viewBox="0 0 176.292 176.292"
                style={{flexShrink:"0"}}
            >
                <path d="M24.027,46.333c-4.32,16.125-2.103,32.968,6.244,47.426c11.132,19.281,31.892,31.259,54.178,31.259
                    c8.411,0,16.745-1.729,24.474-5.03l32.507,56.303l12.99-7.5l-32.508-56.305c11.174-8.353,19.19-20.117,22.856-33.802
                    c4.32-16.125,2.103-32.968-6.244-47.426C127.393,11.978,106.633,0,84.347,0C73.435,0,62.647,2.899,53.148,8.383
                    C38.69,16.73,28.349,30.208,24.027,46.333z M84.347,15c16.944,0,32.727,9.104,41.188,23.759c6.344,10.988,8.029,23.789,4.745,36.044
                    c-3.283,12.255-11.143,22.499-22.131,28.842c-7.222,4.169-15.416,6.373-23.699,6.373c-16.944,0-32.727-9.104-41.188-23.759
                    c-6.344-10.988-8.029-23.788-4.745-36.043C41.801,37.96,49.66,27.717,60.648,21.373C67.87,17.204,76.064,15,84.347,15z"/>
            </svg>
            <input
                className={"inputBlockFocusOff"}
                type={"text"}
                value={searchValue}
                placeholder={placeholder}
                id={"search"}
                onChange={(e)=> setSearchValue(e.target.value)}
                style={{borderStyle: "none", width: "100%", height: '100%', padding: '5px', boxSizing:"border-box", fontSize: "1rem"}}
            />
            <div
                onClick={(e) => {
                    setSearchValue("")
                    document.getElementById("search")?.focus()
                    // console.log(e.currentTarget.previousSibling?.focus())
                    }
                }
                 style={{color:"#2BB98B", display:(searchValue? "block": "none")}}
            >X</div>
        </div>
    );
};

export default SearchInput;