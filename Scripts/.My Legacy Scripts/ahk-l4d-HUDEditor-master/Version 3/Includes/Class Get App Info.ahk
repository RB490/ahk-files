Class ClassGetAppInfo {
    __New(app) {
        switch app {
            case "Steam": obj := this.Steam()
            case "Left 4 Dead": obj := this.Game(app)
            case "Left 4 Dead 2": obj := this.Game(app)
            default: Msg("Fatal", A_ThisFunc, "Invalid app specified: " app)
        }
        return obj
    }

    Steam() {
        exe := "steam.exe"

        output := {}
        output.exe := exe
        output.dir := this.GetSteamDir(exe)
        output.exePath := output.dir "\" exe
        output.gameDir := output.dir "\steamapps\common"
        return output
    }

    GetSteamDir(exe) {
        ; search saved info
        dir := SAVED_INFO.Dir_Steam
        If this.DirContainsExe(dir, exe)
            return dir
        
        ; search registry
        RegRead, dir, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam, InstallPath
        exePath := dir "\" exe

        ; manually select
        If !FileExist(exePath)
            FileSelectFile, exePath, 3, , Select %exe%, %exe%

        ; check validity
        If !FileExist(exePath)
            Msg("Fatal", A_ThisFunc, "Invalid steam executable path: " exePath)

        ; save
        SAVED_INFO.Dir_Steam := dir
        return dir
    }

    Game(gameVersion) {
        output := {}
        
        ; game specific
        switch gameVersion {
            case "Left 4 Dead": {
                output.appid := 500
                output.exe := "left4dead.exe"
            }
            case "Left 4 Dead 2": {
                output.appid := 550
                output.exe := "left4dead2.exe"
            }
            default: Msg("Fatal", A_ThisFunc, "Invalid game version specified: " gameVersion)
        }

        ; general
        output.version := gameVersion
        output.versionNoSpaces := StrReplace(output.version, A_Space)
        output.templatesDir := A_ScriptDir "\Assets\Hud Templates\" output.version
        output.dir := this.GetGameDir(output.exe, output.appid, output.version)
        output.mainDir := output.dir "\" output.versionNoSpaces
        output.cfgDir := output.mainDir "\cfg"
        output.editorCfgPath := output.cfgDir "\hud_editor_cfg.cfg"
        output.AddonsDir := output.mainDir "\addons"
        output.exePath := output.mainDir "\" output.exe
        output.ahkExe := "ahk_exe" A_Space output.exe

        output.sourcemodFilesDir := A_ScriptDir "\Assets\Hud Dev Sourcemod"
        output.raymansAdminSystemDir := A_ScriptDir "\Assets\Rayman1103 Admin System\source"

        idFileName := output.versionNoSpaces "_hud_editor_dev_folder_identifier_do_not_delete"
        output.idFileRelativePath := output.versionNoSpaces "\expressions\" idFileName

        ; dirs with pak01s
        output.dirsWithPak01s := {}
        If (gameVersion = "Left 4 Dead") {
            output.dirsWithPak01s.push(output.dir "\left4dead")
            output.dirsWithPak01s.push(output.dir "\left4dead_dlc3")
        }
        If (gameVersion = "Left 4 Dead 2") {
            output.dirsWithPak01s.push(output.dir "\left4dead2")
            output.dirsWithPak01s.push(output.dir "\left4dead2_dlc1")
            output.dirsWithPak01s.push(output.dir "\left4dead2_dlc2")
            output.dirsWithPak01s.push(output.dir "\left4dead2_dlc3")
            output.dirsWithPak01s.push(output.dir "\update")
        }

        return output
    }

    GetGameDir(exe, appid, gameVersion) {
        ; search saved info
        If (gameVersion = "Left 4 Dead")
            dir := SAVED_INFO.Dir_Left4Dead
        If (gameVersion = "Left 4 Dead 2")
            dir := SAVED_INFO.Dir_Left4Dead2
        
        ; search registry
        If !this.DirContainsExe(dir, exe)
            RegRead, dir, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App %appid%, InstallLocation

        ; search steam folder
        If !this.DirContainsExe(dir, exe) {
            loop, files, % STEAM_INFO.gameDir "\*.*", D
            {
                SplitPath, A_LoopFileFullPath, , , , loopDir
                If (loopDir = gameVersion)
                    dir := A_LoopFileFullPath
            }
        }

        ; manually select
        If !this.DirContainsExe(dir, exe) {
            FileSelectFile, userSelection, 3, % STEAM_INFO.gameDir, Select %exe%, %exe%
            SplitPath, userSelection, , dir
        }

        ; check validity
        If !this.DirContainsExe(dir, exe)
            Msg("Fatal", A_ThisFunc, "Invalid game directory")

        ; ensure the game folder has the correct name
        SplitPath, % dir, , dirParent, , dirName
        If (dirName != gameVersion)
            Msg("Fatal", A_ThisFunc, "Invalid game directory name '" dirName "' expected: " gameVersion)

        ; save
        If (gameVersion = "Left 4 Dead")
            SAVED_INFO.Dir_Left4Dead := dir
        If (gameVersion = "Left 4 Dead 2")
            SAVED_INFO.Dir_Left4Dead2 := dir
        return dir
    }

    DirContainsExe(dir, exe) {
        If FileExist(dir "\" exe)
            return true
    }
}