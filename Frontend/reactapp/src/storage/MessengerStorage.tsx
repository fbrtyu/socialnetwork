import {makeAutoObservable} from "mobx";


export default class MessengerStorage{
    _dialogs: {dialogId: string, dialogName: string|null, userCreatorId: string, dialogImage: string| null, users: {userId: string, fN: string, image: string|null}[]}[];
    _dialogMessages: {messageId: string|null, files: string|null, text: string|null, userSenderId: string, firstName: string, createDate: any|null, updateDate: any|null}[]|null;
    _selectedDialog: {dialogId: string, dialogName: string}|null
    constructor() {
        this._dialogs = [
            // {dialogId: "1", dialogName: null, dialogImage: null, users: [
            //         {userId: '1234', fN: "Александр", image: null},
            //         {userId: '5432', fN: "Илья", image: null},
            //     ]
            // },
            // {dialogId: "2", dialogName: null, dialogImage: null, users: [
            //         {userId: '1234', fN: "Александр", image: null},
            //         {userId: '2342', fN: "Вова", image: null},
            //     ]
            // },
        ]
        this._dialogMessages = [
            // {messageId: '1', userId: '1231', text: 'asdwads', files: null, date: 123},
            // {messageId: '2', userId: '5432', text: 'Sample Text', files: null, date: 124},
            // {messageId: '3', userId: '1231', text: 'asdwads', files: null, date: 125},
            // {messageId: '4', userId: '5432', text: 'Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Text',
            //     files: null, date: 126},
            // {messageId: '5', userId: '5432', text: 'Sample Text', files: null, date: 127},
        ]
        this._selectedDialog = null
        //
        // this._page = 1
        // this._totalCount = 0
        // this._limit = 6

        makeAutoObservable(this)
    }

    setDialogs(dialogs: []) {
        this._dialogs = dialogs
    }
    setDialogMessages(messages: {messageId: string|null, files: string|null, text: string|null, userSenderId: string, firstName: string, createDate :any|null, updateDate: any|null}[]) {
        this._dialogMessages = messages
    }
    // pushDialogMessages(message:{messageId: string|null, files: string|null, text: string|null, userId: string, createDate :any|null, updateDate: any|null})
    // {
    //     this._dialogMessages.push(message)
    // }


    setSelectedDialog(selected: {dialogId: string, dialogName: string}|null){
        this._selectedDialog = selected
        // this._selectedPurpose = selected.id === this._selectedPurpose.id ? {} : {id: selected.id}

    }

    get dialogs() {
        return this._dialogs
    }

    get selectedDialog(){
        return this._selectedDialog
    }

    get dialogMessages() {
        return this._dialogMessages
    }


    // get page() {
    //     return this._page
    // }
    // get totalCount() {
    //     return this._totalCount
    // }
    //
    // get limit() {
    //     return this._limit
    // }


}