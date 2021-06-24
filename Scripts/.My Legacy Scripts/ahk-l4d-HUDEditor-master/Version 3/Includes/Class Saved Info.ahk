Class ClassSavedInfo {
    __New(action, objSavedInfo := "") {
        this.file := A_ScriptDir "\" APP_NAME ".json"
        switch action {
            case "Load": {
                this.Load()
                return this.obj
            }
            case "Save": this.Save(objSavedInfo)
            default: Msg("Fatal", A_ThisFunc, "Invalid action: " action)
        }
    }

    Load() {
        this.obj := json.load(FileRead(this.file))
        If !IsObject(this.obj)
            this.obj := {}
        this.Validate()
    }

    Validate() {
        defaultKeys := {}
        defaultKeys.Dir_Steam := ""
        defaultKeys.Dir_Left4Dead := ""
        defaultKeys.Dir_Left4Dead2 := ""
        defaultKeys.StoredHuds := []

        defaultKeys.Reload_ReopenMenu := false
        defaultKeys.Reload_ClicksEnabled := false
        defaultKeys.Reload_ClickCoord1 := ""
        defaultKeys.Reload_ClickCoord2 := ""
        defaultKeys.Reload_Type := "Hud"
        
        defaultKeys.Game_IsInsecure := true
        defaultKeys.Game_Mute := "volume 0"
        defaultKeys.Game_HideGameWorld := false
        defaultKeys.Game_Map := "hud_dev_map"
        defaultKeys.Game_Mode := "Coop"
        defaultKeys.Game_Pos := ""

        /*
            It's important to have every key set here so their default value can be set properly
            and there's no guessing as to which data actually gets saved,
            Therefore check for missing & extra keys:
        */

        ; add missing keys
        for defaultKey in defaultKeys
            If !this.obj.HasKey(defaultKey)
                this.obj[defaultKey] := defaultKeys[defaultKey]

        ; reset on extra keys
        for key in this.obj {
            If !defaultKeys.HasKey(key) {
                Msg("Info", A_ThisFunc, "Found additional key: " key "`n`nResetting")
                this.obj := defaultKeys
                break
            }
        }
    }

    Save(object) {
        FileDelete, % this.file
        FileAppend, % json.dump(object,,2), % this.file
    }
}