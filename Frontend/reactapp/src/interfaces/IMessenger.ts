export  interface Message {
    messageId: string|null,
    files: string|null,
    text: string|null,
    userSenderId: string,
    firstName: string,
    createDate: any|null,
    updateDate: any|null
}

export interface DialogMessage {
    [date: string]: Message
}

export interface Dialog {
    dialogId: string,
    dialogName: string|null,
    userCreatorId: string,
    dialogImage: string| null,
    users: DialogUser[]
}

export interface DialogUser {
    userId: string,
    fN: string,
    image: string|null
}
export interface SelectedDialog {
    dialogId: string,
    dialogName: string|null,
    userCreatorId: string,
    dialogImage: string| null,
    users: DialogUser[]
}