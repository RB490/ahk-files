Msg(type, func, msg) {
    switch type {
        case "Info": id := 4160
        case "InfoYesNo": id := 36
        case "Error": id := 16
        case "Fatal": { 
            id := 16
            If DEBUG_MODE {
                msg .= "`n`nReloading.."
            } else {
                msg .= "`n`nCheck: " PROJECT_WEBSITE
                msg .= "`n`nClosing.."
            }
        }
        case "FatalIfErrorLevel": {
            If !ErrorLevel
                return
            Msg("Fatal", func, msg)
            return
        }
        case "IfDebugMode": {
            If !DEBUG_MODE
                return
            Msg("Info", func, msg)
            return
        }
        default: {
            msgbox, 4160, , % A_ThisFunc ": Unhandled type specified. `n`nReloading.."
            reload
            sleep 999999 ; prevent script from continuing
        }
    }

    If DEBUG_MODE
        msgbox, % id, % func, % msg
    else
        msgbox, % id, % APP_NAME, % msg

    If (type = "Fatal") {
        If DEBUG_MODE
            reload
        else
            exitapp
        sleep 999999 ; prevent script from continuing
    }
}