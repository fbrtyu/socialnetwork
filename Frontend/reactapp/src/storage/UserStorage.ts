// import {makeAutoObservable} from "mobx";

export default class UserStore{
    _isAuth: boolean
    _user: any
    constructor() {
        this._isAuth = true
        this._user = {userId: '2', image: null}
        // makeAutoObservable(this)
    }

    setIsAuth(bool: boolean) {
        this._isAuth = bool
    }

    setUser(user: any) {
        this._user = user
    }

    get isAuth() {
        return this._isAuth
    }
    get user() {
        return this._user
    }

}