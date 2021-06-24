EditorMenu_GameRes() {
    xSplit := StrSplit(A_ThisMenuItem, "x")
    resW := xSplit[1], resH := xSplit[2]

    videoSetting := GetGameVideoSettingsObj()
    screenMode := videoSetting.fullscreen
    screenMode := !screenMode ; toggle to the right value for mat_setvideomode
    hasBorder := videoSetting.nowindowborder
    RunGameCommand("mat_setvideomode" A_Space resW A_Space resH A_Space screenMode A_Space hasBorder "; mat_savechanges")
}

EditorMenu_GamePos() {
    WinGetPos, gX, gY, gW, gH, % GAME_INFO.ahkId

    Switch A_ThisMenuItem {
        Case "Center": xPos := (A_ScreenWidth/2)-(gW/2), yPos := (A_ScreenHeight/2)-(gH/2)
        
        Case "Top Left": xPos := 0, yPos := 0
        Case "Top": xPos := (A_ScreenWidth/2)-(gW/2), yPos := 0
        Case "Top Right": xPos := (A_ScreenWidth-gW), yPos := 0

        Case "Bottom Left": xPos := 0, yPos := (A_ScreenHeight-gH)
        Case "Bottom": xPos := (A_ScreenWidth/2)-(gW/2), yPos := (A_ScreenHeight-gH)
        Case "Bottom Right": xPos := (A_ScreenWidth-gW), yPos := (A_ScreenHeight-gH)
    }

    WinMove, % GAME_INFO.ahkId, , % xPos, % yPos
}

EditorMenu_SwitchTeam() {
    Switch A_ThisMenuItem {
        case "Spectate": cmd := "jointeam 1"
        case "Infected": cmd := "jointeam 3"
        
        case "Bill": cmd := "sb_takecontrol Bill"
        case "Francis": cmd := "jointeam 2 Francis"
        case "Louis": cmd := "sb_takecontrol Louis"
        case "Zoey": cmd := "sb_takecontrol Zoey"

        case "Coach": cmd := "sb_takecontrol Coach"
        case "Nick": cmd := "sb_takecontrol Nick"
        case "Ellis": cmd := "sb_takecontrol Ellis"
        case "Rochelle": cmd := "sb_takecontrol Rochelle"
    }

    RunGameCommand(cmd)
}

EditorMenu_ShowPanel() {
    activePanel := GetMenuItemStringAfterTab(ACTIVE_SHOWPANEL_MENUITEM)
    
    If activePanel {
        ; disable active panel
        If InStr(activePanel, "debug_")
            RunGameCommand("debug_zombie_panel 0")
        else If (activePanel = "info")
            RunGameKeyStroke("!{F4}")
        else
            RunGameCommand("hidepanel" A_Space GetMenuItemStringAfterTab(ACTIVE_SHOWPANEL_MENUITEM))

        ; show new panel, if selected
        If (A_ThisMenuItem != ACTIVE_SHOWPANEL_MENUITEM) {
            ACTIVE_SHOWPANEL_MENUITEM := A_ThisMenuItem
            RunGameCommand("showpanel" A_Space GetMenuItemStringAfterTab(A_ThisMenuItem))
        }
        else
            ACTIVE_SHOWPANEL_MENUITEM := ""
    }
    else {
        ; show new panel
        ACTIVE_SHOWPANEL_MENUITEM := A_ThisMenuItem
        RunGameCommand("showpanel" A_Space GetMenuItemStringAfterTab(A_ThisMenuItem))
    }
    LoadEditorMenu()
}

EditorMenu_ShowZombiePanel() {
    ; deselect showpanel
    If !InStr(ACTIVE_SHOWPANEL_MENUITEM, "debug_")
        RunGameCommand("hidepanel" A_Space GetMenuItemStringAfterTab(ACTIVE_SHOWPANEL_MENUITEM))
    
    RunGameCommand(GetMenuItemStringAfterTab(A_ThisMenuItem))
    ACTIVE_SHOWPANEL_MENUITEM := A_ThisMenuItem

    LoadEditorMenu()
    ; todo: reload on hud reload
}

EditorMenu_InspectHud() {
    static isEnabled

    If !isEnabled
        RunGameCommand("vgui_drawtree 1")
    else ; can't run hotkeys ingame while vgui_drawtree is enabled
        RunGameKeyStroke("!{F4}")
    isEnabled := !isEnabled
}

EditorMenu_ToggleFocusBetweenGameAndEditor() {
    ; Instead of hiding the editor gui on ingame mode just minimize it incase the user forgets the hotkey.?
    static gameFocused, previouslyFocused

    ; check if game is already focused
    WinGetClass, activeWindowClass, A
    If (activeWindowClass = "Valve001")
        gameFocused := true

    ; switch focus
    If !gameFocused {
        previouslyFocused := WinExist("A")
        WinMinimize, % EDITOR_GUI.ahkId
        WinActivate, % GAME_INFO.ahkId
    } else {
        WinActivate, % EDITOR_GUI.ahkId
        WinActivate, % "ahk_id" A_Space previouslyFocused
    }

    gameFocused := !gameFocused
}

EditorMenu_GiveItems() {
    Switch A_ThisMenuItem {
        Case "Everything": cmd := "giveAllItems"
        Case "Guns": cmd := "giveAllGuns"
        Case "Melee Weapons": cmd := "giveAllMelees"
        Case "Pickups": cmd := "giveAllPickups"
    }
    RunGameCommand(cmd)
}

EditorMenu_CloseEditor() {
    CloseGame() ; trigger the script detecting the game closing and 'finishing hud editing'
}

EditorMenu_RestartGame() {
    Msg("InfoYesNo", A_ThisFunc, "Are you sure you want to restart the game?")
    IfMsgBox, No
        return
    CloseGame()
    RunGame()
}

EditorMenu_ShowAboutGui() {
    aboutGui := new ClassGuiAbout("About")
    aboutGui.Get()
}

EditorMenu_Run() {
    run % """" GetMenuItemStringAfterTab(A_ThisMenuItem) """"
}

EditorMenu_UpdateHudChangesToGame() {
    SyncHudThenReload()
}

EditorMenu_UnloadHud() {
    HUD_IO.Restore()
    HUD_INFO := "" ; HUD_IO.Sync won't load anything without this object
    LoadEditorMenu()
    RunGameCommand("ReloadEverything")
}

EditorMenu_SwitchToHud() {
    success := SetHudInfoFor(GetMenuItemStringAfterTab(A_ThisMenuItem))
    If !success
        return
    LoadEditorMenu()
    HUD_IO.Restore()
    HUD_IO.Sync()
    RunGameCommand("ReloadEverything")
}

EditorMenu_Setting_MuteGame() {
    If (SAVED_SETTINGS.Game_MuteGame = "volume 0") {
        RunGameCommand("volume 1")
        SAVED_SETTINGS.Game_MuteGame := "volume 1"
    } else {
        RunGameCommand("volume 0")
        SAVED_SETTINGS.Game_MuteGame := "volume 0"
    }
    LoadEditorMenu()
}

EditorMenu_Setting_SaveGamePos() {
    If !WinExist(GAME_INFO.ahkId)
        return
    WinGetPos, gX, gY, gW, gH, % GAME_INFO.ahkId
    
    If (gX < 0)
        gX := 0
    If (gY < 0)
        gY := 0

    SAVED_SETTINGS.Game_PosX := gX
    SAVED_SETTINGS.Game_PosY := gY
}

EditorMenu_Setting_DrawWorld() {
    If (SAVED_SETTINGS.Game_HideGameWorld = "r_drawworld 0; r_drawentities 0") {
        RunGameCommand("r_drawworld 1; r_drawentities 1")
        SAVED_SETTINGS.Game_HideGameWorld := "r_drawworld 1; r_drawentities 1"
    } else {
        RunGameCommand("r_drawworld 0; r_drawentities 0")
        SAVED_SETTINGS.Game_HideGameWorld := "r_drawworld 0; r_drawentities 0"
    }
    LoadEditorMenu() ; set checkboxes
}

EditorMenu_Setting_ReloadType() {
    tabSplit := StrSplit(A_ThisMenuItem, "`t")
    SAVED_SETTINGS.Reload_Type := tabSplit[1]
    LoadEditorMenu()
    ReloadHud()
}

EditorMenu_Setting_ClickOnReload() {
    SAVED_SETTINGS.Reload_ClicksEnabled := !SAVED_SETTINGS.Reload_ClicksEnabled
    Menu, ReloadOptions, ToggleCheck, Click On Reload
}

EditorMenu_Setting_ReloadClickCoord1() {
    GetCoordOnMouseClick(mX, mY)
    SAVED_SETTINGS.Reload_ClickCoord1 := mX "," mY

    tooltip, Set!
    SetTimer, hideToolTip, -250
}

EditorMenu_Setting_ReloadClickCoord2() {
    GetCoordOnMouseClick(mX, mY)
    SAVED_SETTINGS.Reload_ClickCoord2 := mX "," mY

    tooltip, Set!
    SetTimer, hideToolTip, -250
}

EditorMenu_Setting_LoadMap() {
    SAVED_SETTINGS.Game_Map := A_ThisMenuItem
    If (SAVED_SETTINGS.Game_Map = "Main Menu")
        RunGameCommand("disconnect")
    else
        RunGameCommand("map" A_Space SAVED_SETTINGS.Game_Map A_Space SAVED_SETTINGS.Game_GameMode)
}

EditorMenu_Setting_GameMode() {
    SAVED_SETTINGS.Game_GameMode := A_ThisMenuItem
    LoadEditorMenu()
    RunGameCommand("map" A_Space SAVED_SETTINGS.Game_Map A_Space SAVED_SETTINGS.Game_GameMode)
}