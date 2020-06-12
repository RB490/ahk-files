/*
    TODO:
        ; KEEP RETRIEVING INFORMATION FROM THE WIKI INSIDE THE WIKI CLASS.. aka adjust dropTable.DownloadImages() and possibly others
        ; same for dropTable class. any droptable information retrieving should be done inside the class
        ; retrieving detail images: retrieve html from 10 or so pages and find a way to retrieve high detail link from each one.

        
        create drops class that handles retrieving information from drop table object
        
        guiSelect
            ++create gui class
            download mob image
        guiLog
            ++create gui class
            download item images

        wiki.get()
            handle https://oldschool.runescape.wiki/w/Black_demon it has duplicate drop tables. probably combine the drops of multiple categories
*/

testVar

; misc
    #SingleInstance, force
    #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
    OnExit("ExitFunc")

; global vars
    global  g_debug     := true
    global  g_itemsPath := A_ScriptDir "\res\img\items"
    global  settings    := {}
    global  wiki        := new class_wiki
    global  selectGui   := new class_gui_select("Mob select")
    global  dropGui     := new class_gui_drop("Drop logger")
    global  dropTable   := new class_dropTable()

; autoexec
    FileCreateDir, % g_itemsPath
    FileRead, Input, % A_ScriptDir "\settings.json"
    If (Input) and !(Input = "{}") and !(Input = """" """") ; double quotes
        settings := json.load(Input)
    ; selectGui.Setup()

    ;FileRemoveDir, % g_itemsPath, 1
    FileCreateDir, % g_itemsPath
    dropTable.Download(StrReplace(settings.selectedMob, A_Space, "_"))

    dropGui.Setup()
return

; global hotkeys
    ~^s::reload

; includes
    #Include, <JSON>
    #Include, <class gui>
    #Include, %A_ScriptDir%\inc
    #Include class dropTable.ahk
    #Include class gui drop.ahk
    #Include class gui select.ahk
    #Include class wiki.ahk
    #Include functions.ahk