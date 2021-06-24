ExitFunc(ExitReason, ExitCode) {
    SaveSettings()

    WinSet, Transparent, 255, % TEXT_EDITOR_INFO.ahkId
    return

    FinishHudEditing()

    If DEV_SETUP_ACTIVE ; script closes during setup
        DEV_SETUP.ExitThenDeleteDeveloperEnvironment()
}

SaveSettings() {
    FileDelete, % PATH_SETTINGS
    FileAppend, % json.dump(SAVED_SETTINGS,,2), % PATH_SETTINGS
}

LoadSettings() {
    SAVED_SETTINGS := json.load(FileRead(PATH_SETTINGS))
    If !IsObject(SAVED_SETTINGS) {
        Msg("IfDebugMode", A_ThisFunc, "Resetting settings")
        SAVED_SETTINGS := {}
    }
    ValidateSettings()
}

ValidateSettings() {
    defaultSettings := {}
    defaultSettings.devModeSetupCompleted := false
    defaultSettings.editorGuiPos := ""
    defaultSettings.StoredHuds := {}

    defaultSettings.Reload_ClicksEnabled := false
    defaultSettings.Reload_ClickCoord1 := ""
    defaultSettings.Reload_ClickCoord2 := ""
    defaultSettings.Reload_Type := "Hud"

    defaultSettings.ExePath_Steam := ""
    defaultSettings.ExePath_TextEditor := ""
    defaultSettings.ExePath_Left4Dead := ""
    defaultSettings.ExePath_Left4Dead2 := ""

    defaultSettings.Game_MuteGame := "volume 0"
    defaultSettings.Game_HideGameWorld := "r_drawworld 1; r_drawentities 1"
    defaultSettings.Game_Map := "tutorial_standards"
    defaultSettings.Game_GameMode := "Coop"
    defaultSettings.Game_PosX := ""
    defaultSettings.Game_PosY := ""

    ; check for missing keys
    for defaultSetting in defaultSettings {
        If !SAVED_SETTINGS.HasKey(defaultSetting)
            SAVED_SETTINGS[defaultSetting] := defaultSettings[defaultSetting]
    }

    ; check for extra keys
    for setting in SAVED_SETTINGS {
        If !defaultSettings.HasKey(setting) {
            Msg("Info", A_ThisFunc, "SAVED_SETTINGS contains additional key: " setting "`n`nResetting settings")
            SAVED_SETTINGS := defaultSettings
            break
        }
    }
}


GetGameVideoSettingsObj() {
    input := FileRead(GAME_INFO.MainDirMain "\cfg\video.txt")
    output := {}
    loop, parse, input, `n
    {
        If InStr(A_LoopField, ".") {
            setting := StringBetween(A_LoopField, """", """")
            value := StringBetween(A_LoopField, A_Tab A_Tab """", """")
            output[StrReplace(setting, "setting.")] := value
        }
    }
    return output
}

GetCmdForReloadFonts() {
    videoSetting := GetGameVideoSettingsObj()
    width := videoSetting.defaultres
    height := videoSetting.defaultresHeight
    screenMode := videoSetting.fullscreen
    screenMode := !screenMode ; toggle to the right value for mat_setvideomode
    hasBorder := videoSetting.nowindowborder
    ; mat_setvideomode <width> <height> <fullscreen bool, true = windowed> <borderless bool, true = borderless>
        ; note: this command doesn't have any effect when the current video settings are identical
    command := "mat_setvideomode" A_Space 1 A_Space 1 A_Space screenMode A_Space hasBorder
    command .= ";mat_setvideomode" A_Space width A_Space height A_Space screenMode A_Space hasBorder
    return command
}

ReloadHud() {
    ; reload hud based on setting
    Switch SAVED_SETTINGS.Reload_Type {
        Case "All": cmd := "ReloadEverything"
        Case "Hud": cmd := "hud_reloadscheme"
        Case "Menu": cmd := "ui_reloadscheme"
        Case "Materials": cmd := "mat_reloadallmaterials"
        Case "Fonts": cmd := "ReloadFonts"
    }
    RunGameCommand(cmd)

    ; click the mouse
    If SAVED_SETTINGS.Reload_ClicksEnabled {
        If SAVED_SETTINGS.Reload_ClickCoord1 {
            coord := StrSplit(SAVED_SETTINGS.Reload_ClickCoord1, ",")
            MouseClick, Left, % coord[1], coord[2], 1, 0 ; clickcount=1, speed=0 (fastest)
        }

        If SAVED_SETTINGS.Reload_ClickCoord2 {
            coord := StrSplit(SAVED_SETTINGS.Reload_ClickCoord2, ",")
            MouseClick, Left, % coord[1], coord[2], 1, 0 ; clickcount=1, speed=0 (fastest)
        }
    }

    ; re-show panel, if set
    If ACTIVE_SHOWPANEL_MENUITEM
        RunGameCommand("showpanel" A_Space GetMenuItemStringAfterTab(ACTIVE_SHOWPANEL_MENUITEM))
}

StartHudEditing(gameVersion) {
    SetGameInfoFor(gameVersion)
    SetTextEditorInfo()
    DEV_SETUP.Mode("Developer")
    HUD_IO.Sync()
    RunGame()
    RunTextEditor()
    EDITOR_GUI.Get()
    ; ExitAppWhenGameCloses()
    FinishHudEditingWhenGameOrTextEditorCloses()
}

FinishHudEditing() {
    If !HUD_IO.isSynced
        return
    
    EDITOR_GUI.Hide()
    EDITOR_GUI.SavePos()
    CloseGame()
    HUD_IO.Restore()
    DEV_SETUP.Mode("Default")
    MAIN_GUI.Get()
}

ExitAppWhenGameCloses() {
    WinWait, % "ahk_exe" A_Space GAME_INFO.exe
    WinWaitClose, % "ahk_exe" A_Space GAME_INFO.exe
    DetectHiddenWindows, Off ; for some reason WinWinExist detects hidden editor gui here, but not in autoexec
    If WinExist(EDITOR_GUI.ahkid) ; the editor did not close the game, so:
        exitapp ; <- also calls FinishHudEditing()
}

FinishHudEditingWhenGameOrTextEditorCloses() {
    If WinExist(TEXT_EDITOR_INFO.ahkId)
        WINWAITCLOSE_TEXT_EDITOR := true

    If WinExist(GAME_INFO.ahkId)
        WINWAITCLOSE_GAME := true
    
    SetTimer, WinWaitCloseGameAndTextEditor, 50
}

WinWaitCloseGameAndTextEditor:
    finish := false

    If WINWAITCLOSE_TEXT_EDITOR and !WinExist(TEXT_EDITOR_INFO.ahkId)
        finish := true

    If WINWAITCLOSE_GAME and !WinExist(GAME_INFO.ahkId)
        finish := true

    If finish {
        SetTimer, WinWaitCloseGameAndTextEditor, Off
        FinishHudEditing()
    }
return

FormatTimeStamp(YYYYMMDDHH24MISS) {
    FormatTime, output, % YYYYMMDDHH24MISS, HH:mm:ss
    return output
}

CloseGame() {
    timeoutSeconds := 5
    process, close, % GAME_INFO.exe
    WinWaitClose, % "ahk_exe " GAME_INFO.exe, , % timeoutSeconds
    If ErrorLevel
        Msg("FatalError", A_ThisFunc, "Could not close game after this many seconds: " timeoutSeconds)
}

RunTextEditor() {
    _textEditor := WinExist("ahk_exe" A_Space TEXT_EDITOR_INFO.exe)
    If !_textEditor {
        If (TEXT_EDITOR_INFO.exe = "Code.exe") {
            ; open hud in vscode
            cmdWorkingDir := HUD_INFO.dir
            run % A_ComSpec A_Space "/C code .", % cmdWorkingDir, Hide, runPID
        }
        else
            Run, % TEXT_EDITOR_INFO.exePath, , , runPID
        WinWait, % "ahk_exe" A_Space TEXT_EDITOR_INFO.exe
        ; WinWait, % "ahk_pid" A_Space runPID
    }

    TEXT_EDITOR_INFO.hwnd := _textEditor
    TEXT_EDITOR_INFO.ahkId := "ahk_id" A_Space _textEditor

    WinSet, Transparent, 245, % TEXT_EDITOR_INFO.ahkId
}

RunGame() {
    ; incase game is hidden
    DetectHiddenWindows, On

    ; check for missing variables
    If !FileExist(SAVED_SETTINGS.ExePath_Steam)
        Msg("FatalError", A_ThisFunc, "Steam path not set")
    If !GAME_INFO.appid
        Msg("FatalError", A_ThisFunc, "Game appid not set")

    ; close other source game instance, if not the right game
    WinGet, Valve001ProcessExe, ProcessName, ahk_class Valve001
    If (Valve001ProcessExe != GAME_INFO.exe) {
        process, close, % Valve001ProcessExe
        WinWaitClose, ahk_class Valve001
    }

    ; activate game if already running
    If WinExist("ahk_class Valve001") {
        ; WinActivate, ahk_class Valve001
        GetGameWindowHandle()
        return
    }

    ; write config
    WriteGameConfig()

    ; build steam run command, info:  https://developer.valvesoftware.com/wiki/Command_Line_Options
    cmdOpts := "-applaunch" A_Space GAME_INFO.appid ; steam app id
    cmdOpts .= A_Space "-nointro"                   ; no intro vids
    cmdOpts .= A_Space "-window"                    ; windowed mode
    cmdOpts .= A_Space "-x " SAVED_SETTINGS.Game_PosX " -y " SAVED_SETTINGS.Game_PosY
    Run, % SAVED_SETTINGS.ExePath_Steam A_Space cmdOpts, , , gamePID
    WinWait, % GAME_INFO.ahkExe
    GetGameWindowHandle()
}

RunGameCommand(action) {  
    ; write command file
    Switch action {
        case "ReloadResourceFiles": cmd := "hud_reloadscheme; ui_reloadscheme"
        case "ReloadEverything": cmd := "hud_reloadscheme; ui_reloadscheme; mat_reloadallmaterials; " GetCmdForReloadFonts()
        case "ReloadMaterials": cmd := "mat_reloadallmaterials"
        case "ReloadFonts": cmd := GetCmdForReloadFonts()
        case "disableDrawWorld": cmd := "r_drawWorld 0; r_drawEntities 0"
        case "enableDrawWorld": cmd := "r_drawWorld 1; r_drawEntities 1"
        case "giveAllItems": cmd := "give pistol; give pistol_magnum; give autoshotgun; give shotgun_chrome; give pumpshotgun; give shotgun_spas; give smg; give smg_mp5; give smg_silenced; give rifle_ak47; give rifle_sg552; give rifle; give rifle_m60; give rifle_desert; give hunting_rifle; give sniper_military; give sniper_awp; give sniper_scout; give weapon_grenade_launcher; give vomitjar; give molotov; give pipe_bomb; give first_aid_kit; give defibrilator; give adrenaline; give pain_pills; give chainsaw; give frying_pan; give electric_guitar; give katana; give machete; give tonfa"
        case "giveAllGuns": cmd := "give pistol; give pistol_magnum; give autoshotgun; give shotgun_chrome; give pumpshotgun; give shotgun_spas; give smg; give smg_mp5; give smg_silenced; give rifle_ak47; give rifle_sg552; give rifle; give rifle_m60; give rifle_desert; give hunting_rifle; give sniper_military; give sniper_awp; give sniper_scout; give weapon_grenade_launcher"
        case "giveAllMelees": cmd := "give chainsaw; give frying_pan; give electric_guitar; give katana; give machete; give tonfa"
        case "giveAllPickups": cmd := "give vomitjar; give molotov; give pipe_bomb; give first_aid_kit; give defibrilator; give adrenaline; give pain_pills"
        default: cmd := action
        ; default: Msg("Info", A_ThisFunc, "todo: run custom command")
    }

    FileDelete, % GAME_INFO.pathGameCfgExecuteCommand
    FileAppend, % cmd, % GAME_INFO.pathGameCfgExecuteCommand

    If (SAVED_SETTINGS.Reload_Type = "Hud") {
        RunGameCustomControlSendF11()
        return
    }
    RunGameKeyStroke("{F11}") ; exec command bind. does not trigger in main neu

    If InStr(cmd, "mat_setvideomode") and (SAVED_SETTINGS.Game_PosX != "")
        WinMove, % GAME_INFO.ahkId, , % SAVED_SETTINGS.Game_PosX, % SAVED_SETTINGS.Game_PosY
}

RunGameKeyStroke(keystrokes) {
    previouslyActive := WinExist("A")
    MouseGetPos, mouseX, mouseY

    WinActivate, % GAME_INFO.ahkId
    WinWaitActive, % GAME_INFO.ahkId
    Send % keystrokes
    WinActivate, % "ahk_id" A_Space previouslyActive

    MouseMove, % mouseX, % mouseY, 0
}

RunGameCustomControlSendF11() {
    ; ControlSend Keystroke to game to execute command file
    KEY_SCANCODE := "57" ; 57 = F11 https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
    WM_KEYDOWN := "0x100"
    WM_KEYUP := "0x101"
    WM_KEYDOWN_PARAM := "0x00" KEY_SCANCODE "0001"	; eg: 0x001e0001    https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-keydown
    WM_KEYUP_PARAM := "0x20" KEY_SCANCODE "0001"		; eg; 0x201e0001    https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-keyup

    SendMessage, WM_KEYDOWN, , WM_KEYDOWN_PARAM,, % GAME_INFO.ahkId
    SendMessage, WM_KEYUP, , WM_KEYUP_PARAM,, % GAME_INFO.ahkId
}

SyncHudThenReload() {
    HUD_IO.Sync()
    ReloadHud()
}

GetGameWindowHandle() {
    GAME_INFO.hwnd := WinExist(GAME_INFO.ahkExe)
    GAME_INFO.ahkId := "ahk_id " GAME_INFO.hwnd
}

WriteGameConfig() {
    if !DEV_SETUP.isDevModeEnabled()
        return
    
    ; disable addons
    file := GAME_INFO.MainDirMain "\addonlist.txt"
    content := StrReplace(FileRead(file), "1", "0")
    FileDelete % file
    FileAppend, % content, % file

    ; overwrite addons with empty data so they can't load
    loop, files, % GAME_INFO.MainDirMain "\addons\*.*", FR
    {
        SplitPath, % A_LoopFileFullPath, loopFileName, loopDir, loopExtension, loopNameNoExt, loopDrive      
        If (loopExtension != "vpk") and (loopExtension != "dll")
            Continue
        FileDelete % A_LoopFileFullPath
        FileAppend, , % A_LoopFileFullPath
    }

    ; overwrite current config
    FileDelete % GAME_INFO.MainDirMain "\cfg\config.cfg"
    FileAppend,, % GAME_INFO.MainDirMain "\cfg\config.cfg" ; to remove console msg 'wrote config.cfg'
    FileDelete % GAME_INFO.MainDirMain "\cfg\config_default.cfg"
    FileAppend,, % GAME_INFO.MainDirMain "\cfg\config_default.cfg" ; to remove console error 'couldn't exec config_default.cfg'
    FileDelete % GAME_INFO.MainDirMain "\cfg\valve.rc"

    ; copy hud editor config file into game dir
    SplitPath, % PATH_HUD_EDITOR_CFG_SOURCE, editorCfgFileName, editorCfgDir, editorCfgExtension, editorCfgNameNoExt, editorCfgDrive
    FileAppend, % "exec " editorCfgFileName, % GAME_INFO.MainDirMain "\cfg\valve.rc"
    FileCopy, % PATH_HUD_EDITOR_CFG_SOURCE, % GAME_INFO.MainDirMain "\cfg\", 1

    ; append hud editor config variable settings inside game dir
    If !(SAVED_SETTINGS.Game_Map = "Main Menu")
        FileAppend, % "`nmap " SAVED_SETTINGS.Game_Map, % GAME_INFO.MainDirMain "\cfg\" editorCfgNameNoExt ".cfg"
    FileAppend, % "`n"SAVED_SETTINGS.Game_MuteGame, % GAME_INFO.MainDirMain "\cfg\" editorCfgNameNoExt ".cfg"
    FileAppend, % "`n"SAVED_SETTINGS.Game_HideGameWorld, % GAME_INFO.MainDirMain "\cfg\" editorCfgNameNoExt ".cfg"
}

CopyOrMoveDirSourceToDestination(action, sourceDir, destDir) {
    Loop, Files, % sourceDir "\*.*", DFR
        actions++
    P.B1(actions)

    FileCreateDir, % destDir
    Loop, Files, % sourceDir "\*.*", DFR
    {
        target := StrReplace(A_LoopFileFullPath, sourceDir, destDir)

        If IsDir(A_LoopFileFullPath)
            FileCreateDir, % target
        else {
            switch action {
                case "copy": FileCopy, % A_LoopFileFullPath, % target, 0
                case "move": FileMove, % A_LoopFileFullPath, % target, 1
                default: Msg("FatalError", A_ThisFunc, "Invalid action specified: " action)
            }
        }

        P.B1(), P.T2(A_LoopFileShortName)
    }

    If (action = "move")
        FileRemoveDir, % sourceDir, true
}

IsDir(input) {
    return FileExist(input) = "D"
}

IsInteger(input) {
    If input is integer
        return true
}

GetCoordOnMouseClick(ByRef mouseX, ByRef mouseY) {
    KeyWait, LButton, D
    MouseGetPos, mouseX, mouseY
}

Vpk(target) {
    If IsDir(target) ; compile
        exe := PATH_VPKEXE_COMPILE
    else ; extract
        exe := PATH_VPKEXE_EXTRACT

    RunWait % exe A_Space """" target """", , Hide
}

GetMenuItemStringAfterTab(MenuItem) {
    tabPart := StrSplit(MenuItem, A_Tab)
    return LTrim(tabPart[2], A_Space)
}

SetHudInfoFor(StoredHudDir) {
    for index, hud in SAVED_SETTINGS.StoredHuds
        If (hud.dir = StoredHudDir)
            StoredHudIndex := A_Index
    
    If !StoredHudIndex {
        Msg("Info", A_ThisFunc, "Could not find hud with folder: " StoredHudDir)
        return
    }

    obj := SAVED_SETTINGS.StoredHuds[StoredHudIndex]
    If !IsDir(obj.dir) {
        Msg("Info", A_ThisFunc, "Folder for " obj.name " does not exist: " obj.dir)
        return
    }
    HUD_INFO := obj
    return true
}

SetGameInfoFor(gameVersion) {
    SetSteamExePath()

    ; get executable path
    exePath := SAVED_SETTINGS.ExePath_[StrReplace(gameVersion, A_Space)]
    If !FileExist(exePath) {
        exePath := GetGameExePath(gameVersion)
        If !FileExist(exePath)
            Msg("FatalError", A_ThisFunc, "Cannot edit hud without game")
        
        If (gameVersion = "Left 4 Dead")
            SAVED_SETTINGS.ExePath_Left4Dead := exePath
        If (gameVersion = "Left 4 Dead 2")
            SAVED_SETTINGS.ExePath_Left4Dead2 := exePath
        ; it's like this^^ because method below creates an array for some reason:
            ; SAVED_SETTINGS.ExePath_[StrReplace(gameVersion, A_Space)] := exePath
    }

    ; set game version specific variables
    SplitPath, % exePath, gameExe, gameExeDir, gameExeExtension, gameExeNameNoExt, gameExeDrive
    obj := {}
    obj.version := gameVersion
    obj.versionNoSpaces := StrReplace(gameVersion, A_Space)
    obj.exe := gameExe
    obj.ahkExe := "ahk_exe" A_Space gameExe
    obj.exePath := exePath
    obj.MainDir := gameExeDir
    obj.MainDirMain := obj.MainDir "\" obj.versionNoSpaces
    obj.BackupDirDeveloper := obj.MainDir ".hud_developer_mode"
    obj.BackupDirDefault := obj.MainDir ".default_backup"
    obj.CfgDir := obj.MainDirMain "\cfg"
    obj.pathGameCfgExecuteCommand := obj.CfgDir "\hud_editor_execute_command.cfg"
    obj.pathGameCfgLoadSettings := obj.CfgDir "\hud_editor_load_settings.cfg"
    dirsContainingPak01 := {}
    If (gameVersion = "Left 4 Dead") {
        obj.appid := 500
        obj.templateDir := A_ScriptDir "\res\HUD Templates\" obj.version

        dirsContainingPak01.push(obj.MainDir "\left4dead")
        dirsContainingPak01.push(obj.MainDir "\left4dead_dlc3")
    }
    If (gameVersion = "Left 4 Dead 2") {
        obj.appid := 550
        obj.templateDir := A_ScriptDir "\res\HUD Templates\" obj.version
        
        dirsContainingPak01.push(obj.MainDir "\left4dead2")
        dirsContainingPak01.push(obj.MainDir "\left4dead2_dlc1")
        dirsContainingPak01.push(obj.MainDir "\left4dead2_dlc2")
        dirsContainingPak01.push(obj.MainDir "\left4dead2_dlc3")
        dirsContainingPak01.push(obj.MainDir "\update")
    }
    obj.dirsContainingPak01 := dirsContainingPak01
    GAME_INFO := obj

    If !WinExist(GAME_INFO.ahkId)
        GetGameWindowHandle()
}

SetTextEditorInfo() {
    exePath := SAVED_SETTINGS.ExePath_TextEditor
    If !FileExist(exePath)
        exePath := SAVED_SETTINGS.ExePath_TextEditor := GetTextEditorExePath()

    SplitPath, exePath, exeFileName, exeDir, exeExtension, exeNameNoExt, exeDrive
    TEXT_EDITOR_INFO.exePath := exePath
    TEXT_EDITOR_INFO.exe := exeFileName
}

GetTextEditorExePath() {
    ; search environment variable for vs code's path as registry doesn't seem to have any keys?
    EnvGet, envPath, Path  ; For explanation, see #NoEnv.
    loop, parse, envPath, `;
        If InStr(A_LoopField, "code\bin")
            output := A_LoopField
    SplitPath, output, , output ; get parent
    If FileExist(output "\Code.exe")
        return output "\Code.exe"
    else
        output := ""

    ; manually select
    FileSelectFile, output, 3, , Select %gameVersionExe%, (*.exe)
    If !FileExist(output)
        Msg("FatalError", A_ThisFunc, "Text editor required")
}

GetGameExePath(gameVersion) {
    gameVersionExe := StrReplace(gameVersion, A_Space) ".exe"
    If (gameVersionExe = "Left4Dead")
        appId := 500
    else
        appId := 550

    ; try to find game install path from registry
    RegRead, output, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App %appId%, InstallLocation
    If IsDir(output)
        return output "\" gameVersionExe

    ; try to find game install path from steam executable
    SplitPath, % SAVED_SETTINGS.ExePath_Steam, steamExeFileName, steamExeDir, steamExeExtension, steamExeNameNoExt, steamExeDrive
    If steamExeDir {
        loop, files, % steamExeDir "\steamapps\common\*.*", D ; directories
        {
            SplitPath, % A_LoopFileFullPath, loopDirFileName, loopDirDir, loopDirExtension, loopDirNameNoExt, loopDirDrive
            If (loopDirFileName = gameVersion)
                return A_LoopFileFullPath "\" gameVersionExe
        }
    }

    ; manually select
    FileSelectFile, pathGameExe, 3, , Select %gameVersionExe%, (*.exe)
    return pathGameExe
}

SetSteamExePath() {
    If FileExist(SAVED_SETTINGS.ExePath_Steam)
        return
    
    If A_Is64bitOS {
        SetRegView 64
        RegRead, steamInstallPath, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam, InstallPath
    } else {
        SetRegView 32
        RegRead, steamInstallPath, HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam, InstallPath
    }
    If !steamInstallPath {
        FileSelectFile, steamInstallPath, 3, , Select steam.exe, (steam.exe)
        If !steamInstallPath
            Msg("FatalError", A_ThisFunc, "Steam path is required to launch the game")
    }
    SAVED_SETTINGS.ExePath_Steam := steamInstallPath "\steam.exe"
}