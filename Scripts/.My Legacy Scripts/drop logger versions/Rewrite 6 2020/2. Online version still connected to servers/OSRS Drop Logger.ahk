; Script options
    Menu, Tray, MainWindow ; open debug window for compiled script
    SetBatchLines, -1
    #SingleInstance, Force
    #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
    CoordMode, Mouse, Screen
    SetBatchLines, -1
    OnExit("ExitFunc")
    OnMessage(0x201, "OnWM_LBUTTONDOWN")
    #MaxMem, 400 ; downloadMissingItemImages()

; Global vars
    Global DEBUG_MODE       := false
    , APP_NAME              := RTrim(A_ScriptName, ".ahk")
    , PROJECT_WEBSITE       := "https://github.com/RB490/ahk-app-osrs-drop-logger"
    , DIR_ITEM_ICON         := A_ScriptDir "\res\img\item\icon"
    , DIR_ITEM_DETAIL       := A_ScriptDir "\res\img\item\detail"
    , DIR_ITEM_RUNELITE     := A_ScriptDir "\res\img\item\runelite"
    , DIR_MOB_IMAGES        := A_ScriptDir "\res\img\mobs"
    , DIR_GUI_ICONS         := A_ScriptDir "\res\img\ico"
    , PATH_RUNELITE_JSON    := A_ScriptDir "\res\runelite.json"
    , PATH_SETTINGS         := A_ScriptDir "\settings.json"
    , PATH_OSRSBOX_JSON     := A_ScriptDir "\res\osrsbox.json"
    , PATH_FILEINSTALL      := A_ScriptDir "\res\FileInstall.ahk"
    , DB_OSRSBOX            := {}
    , DB_SETTINGS           := {}
    , SELECTED_DROPS        := {}
    , OSRSBOX_API           := new ClassApiOSRSBox
    , RUNELITE_API          := new ClassApiRunelite
    , WIKI_API              := new ClassApiWiki
    , DROP_LOG              := new ClassDropLog
    , DROP_STATS            := new ClassDropStats
    , DROP_TABLE            := new ClassDropTable
    , ABOUT_GUI             := new ClassGuiAbout("About")
    , LOG_GUI               := new ClassGuiLog(APP_NAME)
    , MAIN_GUI              := new ClassGuiMain(APP_NAME)
    , P                     := new ClassGuiProgress(APP_NAME)
    , QUANTITY_GUI          := new ClassGuiQuantity(APP_NAME)
    , SETTINGS_GUI          := new ClassGuiSettings("Settings")
    , STATS_GUI             := new ClassGuiStats("Stats")
    , RETRIEVE_ALL          := new ClassRetrieve
    , MIN_DROP_SIZE         := 10
    , MAX_DROP_SIZE         := 80
    , MIN_ROW_LENGTH        := 1
    , MAX_ROW_LENGTH        := 25
    , MIN_TABLE_SIZE        := 1
    , ITEM_IMAGE_TYPES      := "Wiki Small|Wiki Detailed|RuneLite"

; Auto-execute
    FileCreateDir, % DIR_ITEM_ICON
    FileCreateDir, % DIR_ITEM_DETAIL
    FileCreateDir, % DIR_ITEM_RUNELITE
    FileCreateDir, % DIR_MOB_IMAGES
    LoadSettings()
    If A_IsCompiled and !DB_SETTINGS.setupHasRan
        Setup()
    If DEBUG_MODE
        Goto debugAutoexec 
    MAIN_GUI.Get()
return

; Global hotkeys
    ~^s::
        If DEBUG_MODE and !A_IsCompiled
            reload
    return
    ~f1::
        If !DEBUG_MODE
            return
    return

; Labels
    disableTooltip:
        tooltip
    return
    menuHandler:
    return
    updateStats:
        DROP_STATS.UpdateBasicStats()
        DROP_STATS.UpdateAdvancedStats()
    return
    debugAutoexec:
        Msg("Error", A_ThisLabel, "some textsome textsome text")
        Msg("Info", A_ThisLabel, "some textsome textsome text")
        return
        DROP_TABLE.Get(DB_SETTINGS.selectedMob)
        DROP_LOG.Get(DB_SETTINGS.selectedLogFile)
        LOG_GUI.Get()
    return

; Includes
    #Include, %A_ScriptDir%\inc
    #Include Class Api OSRSBox.ahk
    #Include Class Api RuneLite.ahk
    #Include Class Api Wiki.ahk
    #Include Class Drop Log.ahk
    #Include Class Drop Stats.ahk
    #Include Class Drop Table.ahk
    #Include Class Gui About.ahk
    #Include Class Gui Log.ahk
    #Include Class Gui Main.ahk
    #Include Class Gui Progress.ahk
    #Include Class Gui Quantity.ahk
    #Include Class Gui Settings.ahk
    #Include Class Gui Stats.ahk
    #Include Class Retrieve.ahk
    #Include Functions.ahk

; libraries
    #Include, %A_ScriptDir%\lib
    #Include, _QPC.ahk
    #Include, AddCommas.ahk
    #Include, AutoXYWH.ahk
    #Include, Class Gui.ahk
    #Include, CommandFunctions.ahk
    #Include, DownloadToFile.ahk
    #Include, DownloadToString.ahk
    #Include, FormatSeconds.ahk
    #Include, Gdip_All.ahk
    #Include, GuiButtonIcon.ahk
    #Include, IsPicture.ahk
    #Include, JSON.ahk
    #Include, LoadPictureType.ahk
    #Include, Msg.ahk
    #Include, MTimer.ahk
    #Include, ObjFullyClone.ahk
    #Include, ResConImg.ahk
    #Include, SetButtonIcon.ahk
    #Include, WinGetPos.ahk