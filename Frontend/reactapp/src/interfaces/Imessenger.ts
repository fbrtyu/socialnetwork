export interface DialogMessage {
    [date: string]: any,
    message: {
        messageId: string|null,
        files: string|null,
        text: string|null,
        userSenderId: string,
        firstName: string,
        createDate: any|null,
        updateDate: any|null
    }[]
}

export interface Dialog {
    dialogId: string,
    dialogName: string|null,
    userCreatorId: string,
    dialogImage: string| null,
    users:
        {
            userId: string,
            fN: string,
            image: string|null
        }[]
}

export interface SelectedDialog {
    dialogId: string,
    dialogName: string
}