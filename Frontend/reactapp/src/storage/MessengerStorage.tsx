import {makeAutoObservable} from "mobx";
import {Dialog, DialogMessage, SelectedDialog} from "../interfaces/Imessenger";


export default class MessengerStorage{
    _dialogs: Dialog[]|null;
    _dialogMessages: DialogMessage[]|null;
    _dialogMessagesWS: {messageId: string|null, files: string|null, text: string|null, userSenderId: string, firstName: string, createDate: any|null, updateDate: any|null}[]|null;

    _selectedDialog: SelectedDialog|null
    constructor() {
        this._dialogs = [

        ]
        this._dialogMessages = [

        ]
        this._dialogMessagesWS = [

        ]
        this._selectedDialog = null
        //
        // this._page = 1
        // this._totalCount = 0
        // this._limit = 6

        makeAutoObservable(this)
    }

    setDialogs(dialogs: Dialog[]|null) {
        this._dialogs = dialogs
    }
    setDialogMessages(messages: DialogMessage[]|null) {
        this._dialogMessages = messages
    }
    setDialogMessagesWS(messages: {messageId: string|null, files: string|null, text: string|null, userSenderId: string, firstName: string, createDate :any|null, updateDate: any|null}[]) {
        this._dialogMessagesWS = messages
    }
    // pushDialogMessages(message:{messageId: string|null, files: string|null, text: string|null, userId: string, createDate :any|null, updateDate: any|null})
    // {
    //     this._dialogMessages.push(message)
    // }

    setSelectedDialog(selected: SelectedDialog|null){
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