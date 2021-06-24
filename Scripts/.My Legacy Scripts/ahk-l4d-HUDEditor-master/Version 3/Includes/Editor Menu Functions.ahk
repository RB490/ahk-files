EditorMenu_LoadMap() {
    SAVED_INFO.Game_Map := A_ThisMenuItem
    If (A_ThisMenuItem = "Main Menu") {
        EditorMenu_Disconnect()
        return
    }
    GAME_WIN.Cmd("map" A_Space A_ThisMenuItem A_Space SAVED_INFO.Game_Mode)
}

EditorMenu_Disconnect() {
    GAME_WIN.Cmd("disconnect")
}

EditorMenu_GamePos() {
    ; is the game running
    If !WinExist(GAME_INFO.ahkid)
        return

    ; save position
    If (A_ThisMenuItem = "Current")
        SAVED_INFO.Game_Pos := Round(xPos) "," Round(yPos)
    else
        SAVED_INFO.Game_Pos := A_ThisMenuItem
    
    ; set position
    GAME_WIN.RestorePos()
}

EditorMenu_GameRes() {
    ; retrieve user input
    xSplit := StrSplit(A_ThisMenuItem, "x")
    resW := xSplit[1], resH := xSplit[2]

    ; get video settings for building mat_setvideo command
    videoSetting := GetGameVideoSettingsObj()
    screenMode := videoSetting.fullscreen
    screenMode := !screenMode ; toggle to the right value for mat_setvideomode
    hasBorder := videoSetting.nowindowborder

    ; build mat_setvideocommand with user res input
    cmd := "mat_setvideomode" A_Space resW A_Space resH A_Space
    cmd .= screenMode A_Space hasBorder "; mat_savechanges"
    GAME_WIN.Cmd(cmd)

    ; wait a bit until the game finishes resizing then restore position
    sleep 250
    GAME_WIN.RestorePos()
}

EditorMenu_ShowPanel() {
    static previousInput
    input := MenuGetTextAfterTab(A_ThisMenuItem)

    ; add disable previous panel command
    If previousInput and (previousInput != "hide") {
        If InStr(previousInput, "debug_zombie_panel")
            cmd := "debug_zombie_panel 0; "
        else
            cmd := "hidepanel" A_Space previousInput "; "
    }
    
    ; add enable current panel command
    If (input != "hide") {
        ; show current panel
        If InStr(input, "debug_zombie_panel")
            cmd .= input
        else
            cmd .= "showpanel" A_Space input
    }
    
    ; run command
    GAME_WIN.Cmd(cmd)

    ; check active item for menu
    EDITORMENU_SHOWPANEL := A_ThisMenuItem

    previousInput := input
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

    GAME_WIN.Cmd(cmd)
}

EditorMenu_GameMode() {
    SAVED_INFO.Game_Mode := A_ThisMenuItem
    GAME_WIN.Cmd("map" A_Space SAVED_INFO.Game_Map A_Space SAVED_INFO.Game_Mode)
}

EditorMenu_CallVote() {
    selectedVote := MenuGetTextAfterTab(A_ThisMenuItem)
    GAME_WIN.Cmd("callvote" A_Space selectedVote)
}

EditorMenu_toggleInsecure:
    SAVED_INFO.Game_IsInsecure := !SAVED_INFO.Game_IsInsecure
    EditorMenu_RestartGame()
return

EditorMenu_MuteGame() {
    If (SAVED_INFO.Game_Mute = "volume 0") {
        GAME_WIN.Cmd("volume 1")
        SAVED_INFO.Game_Mute := "volume 1"
    } else {
        GAME_WIN.Cmd("volume 0")
        SAVED_INFO.Game_Mute := "volume 0"
    }
}

EditorMenu_HideGameWorld() {
    SAVED_INFO.Game_HideGameWorld := !SAVED_INFO.Game_HideGameWorld

    If SAVED_INFO.Game_HideGameWorld
        GAME_WIN.Cmd("hideWorld")
    else
        GAME_WIN.Cmd("showWorld")
}

EditorMenu_InspectHud() {
    If !EDITORMENU_VGUIDRAWTREE
        GAME_WIN.Cmd("vgui_drawtree 1")
    else ; can't run hotkeys ingame while vgui_drawtree is enabled
        GAME_WIN.SendKeys("!{F4}")
        
    EDITORMENU_VGUIDRAWTREE := !EDITORMENU_VGUIDRAWTREE
}

EditorMenu_CloseGame() {
    GAME_WIN.Close()
}

EditorMenu_RestartGame() {
    ; Msg("InfoYesNo", A_ThisFunc, "Are you sure you want to restart the game?")
    ; IfMsgBox, No
    ;     return
    SetTimer, StopHudEditWhenGameCloses, Off
    GAME_WIN.Close()
    GAME_WIN.Run()
    SetTimer, StopHudEditWhenGameCloses, On
}

EditorMenu_ResyncHud() {
    GAME_WIN.ResyncHud()
}

EditorMenu_RunAfterTab() {
    run % """" MenuGetTextAfterTab(A_ThisMenuItem) """"
}

EditorMenu_OpenFolderAfterTab() {
    dir := MenuGetTextAfterTab(A_ThisMenuItem)

    run %A_WinDir%\explorer.exe "%dir%"
}

EditorMenu_OpenHudInVsCode() {
    run %A_ComSpec% /c code ., % HUD_INFO.dir, Hide
}

EditorMenu_OpenHudFolder() {
    run, % HUD_INFO.dir
}

EditorMenu_GiveItems() {
    Switch A_ThisMenuItem {
        Case "Everything": cmd := "giveAllItems"
        Case "Guns": cmd := "giveAllGuns"
        Case "Melee Weapons": cmd := "giveAllMelees"
        Case "Pickups": cmd := "giveAllPickups"
    }
    GAME_WIN.Cmd(cmd)
}

EditorMenu_LoadHud() {
    If !HUD_INFO.count() {
        Msg("Info", A_ThisFunc, "No hud loaded!")
        return
    }
    StartHudEditing(HUD_INFO)
}

EditorMenu_UnloadHud() {
    If !HUD_INFO.count() {
        Msg("Info", A_ThisFunc, "No hud loaded!")
        return
    }
    SYNC_HUD := ""
    GAME_WIN.Cmd("ReloadEverything")
}

EditorMenu_UnsyncHud() {
    SYNC_HUD := ""
    HUD_INFO := ""
    GAME_WIN.Cmd("ReloadEverything")
}

EditorMenu_DescribeHudFile() {
    FileSelectFile, hudFilePath, 3, % HUD_INFO.dir, Select Hud File To Be Described, Resource File (*.res)
    If !FileExist(hudFilePath)
        return
    AddHudFileDescriptionsToFile(hudFilePath)
}

EditorMenu_ReloadType() {
    part := StrSplit(A_ThisMenuItem, "`t")
    SAVED_INFO.Reload_Type := part[1]
    GAME_WIN.ResyncHud()
}

EditorMenu_ReopenMenuOnReload() {
    SAVED_INFO.Reload_ReopenMenu := !SAVED_INFO.Reload_ReopenMenu
}

EditorMenu_ClickOnReload() {
    SAVED_INFO.Reload_ClicksEnabled := !SAVED_INFO.Reload_ClicksEnabled
}

EditorMenu_ClickOnReloadCoord1() {
    GetMouseCoordOnClick(mX, mY)
    SAVED_INFO.Reload_ClickCoord1 := mX "," mY

    tooltip, Set!
    SetTimer, hideToolTip, -250
}

EditorMenu_ClickOnReloadCoord2() {
    GetMouseCoordOnClick(mX, mY)
    SAVED_INFO.Reload_ClickCoord2 := mX "," mY

    tooltip, Set!
    SetTimer, hideToolTip, -250
}

EditorMenu_OpenMainMenu() {
    MAIN_GUI.Get()
}

EditorMenu_SwitchToHud() {
    ; get selected hud information
    selectedHudDir := MenuGetTextAfterTab(A_ThisMenuItem)
    for index, loopHud in SAVED_INFO.StoredHuds {
        If (loopHud.dir = selectedHudDir) {
            hud := loopHud
            break
        }
    }

    If !IsObject(hud) or !hud.count() {
        Msg("Info", A_ThisFunc, "Could not find hud")
        return
    }

    StartHudEditing(hud)
    return
}

EditorMenu_CopyHotstring() {
    hotstring := MenuGetTextAfterTab(A_ThisMenuItem)
    File := A_ScriptDir "\Assets\Hotstrings\" hotstring ".res"
    FileRead, clipboard, % File
}

EditorMenu_BrowseHudFiles() {
    static hudFileBrowser, previousGameVersion

    If !IsObject(hudFileBrowser) or (GAME_INFO.Version != previousGameVersion)
        hudFileBrowser := new ClassGuiToolBrowseHudFiles()
    
    hudFileBrowser.Get()

    previousGameVersion := GAME_INFO.Version
}

EditorMenu_ModifyAllIntegerKeys() {
    new ClassGuiToolModifyAllIntegerKeys("Modify Integers").Get()
}

EditorMenu_ExportHudAsVpk() {
    ExportHudAsVpk(HUD_INFO.name, HUD_INFO.dir)
}