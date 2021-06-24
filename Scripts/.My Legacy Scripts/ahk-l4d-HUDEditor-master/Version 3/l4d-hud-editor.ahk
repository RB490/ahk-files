; script options
    
    #SingleInstance, Force
    #NoEnv
    SetBatchLines, -1
    OnExit("ExitFunc")
    DetectHiddenWindows, On ; On so game is detected while on another virtual desktop

; globals
    Global DEBUG_MODE           := true
    , PROJECT_WEBSITE           := "https://github.com/RB490/ahk-app-l4d-hud-editor"
    , APP_NAME                  := "L4D HUD Editor"
    , SYNC_HUD                  := false
    , GAME_WIN                  := new ClassGameWindow
    , SAVED_INFO                := new ClassSavedInfo("Load")
    , STEAM_INFO                := new ClassGetAppInfo("Steam")
    , MAIN_GUI                  := new ClassGuiMain(APP_NAME)
    , GAME_INFO                 := []
    , HUD_INFO                  := [] ; {game: game, dir: dir, name: name}
    , GAME_DEV                  := new ClassGameDevMode
    , P                         := new ClassGuiProgress
    , DEV_SETUP_ACTIVE          := false
    , DIR_ICONS                 := A_ScriptDir "\Assets\Images\Icons"
    , A_SpaceTab                := A_Space A_Space A_Space A_Space
    , EDITORMENU_SHOWPANEL      := ""
    , EDITORMENU_VGUIDRAWTREE   := false
    , HUD_DESC                  := new ClassFileDatabase

; autoexecute
    If DEBUG_MODE
        Goto debugAutoexec
    MAIN_GUI.Get()
    return

; labels
    debugAutoexec:
        HUD_INFO.dir := "D:\Programming and projects\l4d-addons-huds\4. l4d2-2020HUD\source"
        HUD_INFO.name := "2020HUD"
        HUD_INFO.game := "Left 4 Dead 2"
        GAME_INFO := new ClassGetAppInfo("Left 4 Dead 2")
        ; get game hwnd, if running
        If GAME_WIN.GetRunningVersion()
            GAME_WIN.Run()
        ; GAME_DEV.Mode(true)
        MAIN_GUI.Get()

        ; msgbox % json.dump(GAME_INFO,,2)

        ; ShowEditorMenu()
        ; hudFileBrowser := new ClassGuiToolBrowseHudFiles()
        ; hudFileBrowser.Get()
        ; ExportHudAsVpk("2020HUD", "D:\Programming and projects\l4d-addons-huds\4. l4d2-2020HUD\source")
        ; SetTimer, StopHudEditWhenGameCloses, On
    return

jsonReviverFuncDefinition(this, key, value)
{
	; If (value = "")
    ;     key := A_Now
    ; value := A_TickCount
    ; sleep 1
    ; msgbox % key "`n`n" value "`n`n" json.dump(this,,2)
    
    ; return value as is if you don't want to alter it
	return [value][1] ; for numeric values, preserve internally cached number
}

    dummylabel:
    return
    hideTooltip:
        tooltip
    return
    StopHudEditWhenGameCloses:
        DetectHiddenWindows, On ; On so game is detected while on another virtual desktop
        If !WinExist(GAME_INFO.ahkExe)
            StopHudEditing("switchBackToVanillaAndReturnToMainMenu")
    return

; global hotkeys
    ; f1::GAME_WIN.Cmd("hud_reloadscheme")
    ; f1::GAME_WIN.ResyncHud()
    f4::ShowEditorMenu()
    f5::EditorMenu_BrowseHudFiles()
    ~^s::
        If SYNC_HUD and WinExist(GAME_INFO.ahkId)
            GAME_WIN.ResyncHud()
        else if DEBUG_MODE
            reload
    return

; includes
    #Include, %A_ScriptDir%\Includes\Class File Database.ahk
    #Include, %A_ScriptDir%\Includes\Class Game Dev Mode.ahk
    #Include, %A_ScriptDir%\Includes\Class Game Window.ahk
    #Include, %A_ScriptDir%\Includes\Class Saved Info.ahk
    #Include, %A_ScriptDir%\Includes\Class Get App Info.ahk
    #Include, %A_ScriptDir%\Includes\Class Gui Main.ahk
    #Include, %A_ScriptDir%\Includes\Class Gui Tool Browse Hud Files.ahk
    #Include, %A_ScriptDir%\Includes\Class Gui Tool Modify All Integer Keys.ahk
    #Include, %A_ScriptDir%\Includes\Class Parse Vdf.ahk
    #Include, %A_ScriptDir%\Includes\Class Sync Hud.ahk
    #Include, %A_ScriptDir%\Includes\Editor Menu Functions.ahk
    #Include, %A_ScriptDir%\Includes\Func Msg.ahk
    #Include, %A_ScriptDir%\Includes\Functions.ahk

; libraries
    #Include, %A_ScriptDir%\Libraries\_QPC.ahk
    #Include, %A_ScriptDir%\Libraries\Class Gui.ahk
    #Include, %A_ScriptDir%\Libraries\Class Gui Progress.ahk
    #Include, %A_ScriptDir%\Libraries\CommandFunctions.ahk
    #Include, %A_ScriptDir%\Libraries\GetFileFolderSizeInGB.ahk
    #Include, %A_ScriptDir%\Libraries\GuiButtonIcon.ahk
    #Include, %A_ScriptDir%\Libraries\JSON.ahk
    #Include, %A_ScriptDir%\Libraries\StringBetween.ahk
    #Include, %A_ScriptDir%\Libraries\ObjFullyClone.ahk