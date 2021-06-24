; script options
    #SingleInstance, Force
    #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
    SetBatchLines, -1
    OnExit("ExitFunc")

; globals
    Global DEBUG_MODE       := true
    , APP_NAME              := "HUD Editor"
    , PROJECT_WEBSITE       := "https://github.com/RB490/ahk-app-l4d-hud-editor"
    , DIR_ICONS             := A_ScriptDir "\res\Icons"
    , APP_ICON              := DIR_ICONS "\paintbrush.ico"
    , PATH_SETTINGS         := A_ScriptDir "\" APP_NAME " Settings.json"
    , PATH_VPKEXE_COMPILE   := A_ScriptDir "\res\VPK Tool\left4dead\vpk.exe"
    , PATH_VPKEXE_EXTRACT   := A_ScriptDir "\res\VPK Tool\nosteam\vpk.exe"
    , PATH_HUD_EDITOR_CFG_SOURCE := A_ScriptDir "\res\hud_editor_cfg.cfg"
    , PATH_DELETE_DEVMODE   := A_ScriptDir "\res\DeleteDeveloperEnvironment.ahk"
    , DIR_FILE_DESCRIPTIONS := A_ScriptDir "\res\HUD File Descriptions"
    , SAVED_SETTINGS        := {}
    , GAME_INFO             := {}
    , TEXT_EDITOR_INFO      := {}
    , HUD_INFO              := {game: game, name: name, dir: dir}
    , DEV_SETUP             := new DeveloperModeSetup
    , DEV_SETUP_ACTIVE      := false
    , HUD_IO                := new ClassHudIoV2
    , MAIN_GUI              := new ClassGuiMain(APP_NAME)
    , EDITOR_GUI            := new ClassGuiEditor("Editor: F5") ; sits in bottom-left when minimized
    , P                     := new ClassGuiProgress("Progress")
    , ACTIVE_SHOWPANEL_MENUITEM   := ""
    , WINWAITCLOSE_GAME           := false
    , WINWAITCLOSE_TEXT_EDITOR    := false

; autoexecute
    LoadSettings()
    If DEBUG_MODE
        Goto debugAutoexecute
    MAIN_GUI.Get()
return

; labels
    debugAutoexecute:
        Gosub SetDebugInfo
        MAIN_GUI.Get()
    return
    dummylabel:
    return

; global hotkeys
    ~^s::
        reload
        return
        
        If !A_IsCompiled and !HUD_IO.isSynced {
            reload
            return
        }
        If HUD_IO.isSynced {
            SyncHudThenReload()
        }
    return
    hideTooltip:
        tooltip
    return
    f5::EditorMenu_ToggleFocusBetweenGameAndEditor()
    SetDebugInfo:
        HUD_INFO.game := "Left 4 Dead 2"
        HUD_INFO.dir := "D:\Downloads\l4d2-inkhud\source"
        HUD_INFO.name := "inkhud"

        SetGameInfoFor("Left 4 Dead 2")
        SetTextEditorInfo()
    return

; libraries
    #Include %A_ScriptDir%\lib
    #Include _QPC.ahk
    #Include Class Gui Progress.ahk
    #Include Class Gui.ahk
    #Include CommandFunctions.ahk
    #Include Gdip_all.ahk
    #Include GetFileFolderSizeInGB.ahk
    #Include GuiButtonIcon.ahk
    #Include JSON.ahk
    #Include LoadPictureType.ahk
    #Include Msg.ahk
    #Include ResConImg.ahk
    #Include StringBetween.ahk
    #Include WinGetPos.ahk

; includes
    #Include %A_ScriptDir%\inc
    #Include Class DeveloperModeSetup.ahk
    #Include Class Gui About.ahk
    #Include Class Gui Editor.ahk
    #Include Class Gui Main.ahk
    #Include Class HudIo.ahk
    #Include Functions.ahk
    #Include Editor Menu Labels.ahk


Class TestMainSetupGuiClass extends gui {
    Get() {
        this.Show("w250 h250 x0 y0")
    }
}