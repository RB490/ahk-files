Class ClassGameWindow {
    Run() {
        ; close other source game instance, if not the right game
        WinGet, Valve001ProcessExe, ProcessName, ahk_class Valve001
        If (Valve001ProcessExe != GAME_INFO.exe) {
            process, close, % Valve001ProcessExe
            WinWaitClose, ahk_class Valve001
        }

        ; write game config
        this._WriteConfig()

        ; check if game is already running
        If WinExist(GAME_INFO.ahkExe) {
            this._GetWindowHandle()
            return
        }

        ; run game through steam launch options: https://developer.valvesoftware.com/wiki/Command_Line_Options
        opts := "-applaunch" A_Space GAME_INFO.appid ; steam app id
        opts .= A_Space "-nointro"                   ; no intro vids
        pos := StrSplit(SAVED_INFO.Game_Pos, ",")
        opts .= A_Space "-x " pos[1] " -y " pos[2]
        opts .= A_Space "-console"                   ; enable developer console
        If SAVED_INFO.Game_IsInsecure
            opts .= A_Space "-insecure"                  ; enable sourcemod
        Run, % STEAM_INFO.ExePath A_Space opts
        WinWait, % GAME_INFO.ahkExe

        ; get game window handle
        this._GetWindowHandle()

        ; restore game pos
        this.RestorePos()
    }

    _GetWindowHandle() {
        GAME_INFO.hwnd := WinExist(GAME_INFO.ahkExe)
        GAME_INFO.ahkid := "ahk_id" A_Space GAME_INFO.hwnd
    }

    _DisableAddonsInDir(dir) {
        ; don't recurse so sourcmod doesn't break + game doesn't read subfolder addons
        loop, files, % dir "\*.*", F
        {
            SplitPath, % A_LoopFileFullPath, loopFileName, loopDir, loopExtension, loopNameNoExt, loopDrive      
            If (loopExtension != "vpk") and (loopExtension != "dll")
                Continue
            FileDelete % A_LoopFileFullPath
            FileAppend, , % A_LoopFileFullPath
        }
    }

    _WriteConfig() {
        If !GAME_DEV.ModeIsEnabled()
            return
        
        ; disable addons by overwriting them
        this._DisableAddonsInDir(GAME_INFO.MainDir "\addons")
        this._DisableAddonsInDir(GAME_INFO.MainDir "\addons\workshop")
        
        ; delete current config
        FileDelete % GAME_INFO.CfgDir "\config.cfg"
        FileAppend,, % GAME_INFO.CfgDir "\config.cfg" ; to remove console msg 'wrote config.cfg'
        FileDelete % GAME_INFO.CfgDir "\config_default.cfg"
        FileAppend,, % GAME_INFO.CfgDir "\config_default.cfg" ; to remove console error 'couldn't exec config_default.cfg'

        ; editor config
        editorCfgPath := A_ScriptDir "\Assets\hud_editor_cfg.cfg"
        FileDelete % GAME_INFO.CfgDir "\valve.rc"
        FileAppend, % "exec" A_Space "hud_editor_cfg.cfg", % GAME_INFO.CfgDir "\valve.rc"
        FileCopy, % editorCfgPath, % GAME_INFO.editorCfgPath, 1

        ; editor config user settings
        FileAppend, % "`nmap" A_Space SAVED_INFO.Game_Map A_Space SAVED_INFO.Game_Mode, % GAME_INFO.editorCfgPath
        FileAppend, % "`n" SAVED_INFO.Game_Mute, % GAME_INFO.editorCfgPath
        If SAVED_INFO.Game_HideGameWorld
            FileAppend, % "`nr_drawWorld 0; r_drawEntities 0", % GAME_INFO.editorCfgPath

        ; video settings disable fullscreen
        videoSettingsFile := GAME_INFO.CfgDir "\video.txt"
        FileRead, videoSettings, % videoSettingsFile
        fullscreenKey = "setting.fullscreen"		"1"
        disableFullscreenKey = "setting.fullscreen"		"0"
        videoSettings := StrReplace(videoSettings, fullscreenKey, disableFullscreenKey)
        FileDelete, % videoSettingsFile
        FileAppend, % videoSettings, % videoSettingsFile

        ; add map
        FileCopyDir, % A_ScriptDir "\Assets\Hud Dev Map\" GAME_INFO.Version "\export", % GAME_INFO.MainDir, 1
    }

    Close() {
        process, close, % GAME_INFO.exe
        WinWaitClose, % GAME_INFO.ahkExe
    }

    GetRunningVersion() {
        DetectHiddenWindows, On ; On so game is detected while on another virtual desktop
        WinGetTitle, runningVersion, ahk_class Valve001
        return runningVersion
    }

    RestorePos() {
        WinGetPos, xPos, yPos, gW, gH, % GAME_INFO.ahkid

        ; get saved pos
        If InStr(SAVED_INFO.Game_Pos, ",") {
            ; custom coordinates
            pos := StrSplit(SAVED_INFO.Game_Pos, ",")
            xPos := pos[1]
            yPos := pos[2]
        }
        else {
            ; set position on the screen
            Switch SAVED_INFO.Game_Pos {
                Case "Center": xPos := (A_ScreenWidth/2)-(gW/2), yPos := (A_ScreenHeight/2)-(gH/2)
                
                Case "Left": xPos := 0, yPos := (A_ScreenHeight/2) - (gH/2)
                Case "Right": xPos := A_ScreenWidth-gW, yPos := (A_ScreenHeight/2) - (gH/2)

                Case "Top Left": xPos := 0, yPos := 0
                Case "Top": xPos := (A_ScreenWidth/2)-(gW/2), yPos := 0
                Case "Top Right": xPos := (A_ScreenWidth-gW), yPos := 0

                Case "Bottom Left": xPos := 0, yPos := (A_ScreenHeight-gH)
                Case "Bottom": xPos := (A_ScreenWidth/2)-(gW/2), yPos := (A_ScreenHeight-gH)
                Case "Bottom Right": xPos := (A_ScreenWidth-gW), yPos := (A_ScreenHeight-gH)
            }
        }

        WinMove, % GAME_INFO.ahkid, , % xPos, % yPos
    }

    ResyncHud() {
        ; update changes to game
        SYNC_HUD.Sync()
        
        ; reload hud based on setting
        Switch SAVED_INFO.Reload_Type {
            Case "All": cmd := "ReloadEverything"
            Case "Hud": cmd := "hud_reloadscheme"
            Case "Menu": cmd := "ui_reloadscheme"
            Case "Materials": cmd := "mat_reloadallmaterials"
            Case "Fonts": cmd := "ReloadFonts"
        }
        GAME_WIN.Cmd(cmd)

        ; click the mouse
        If SAVED_INFO.Reload_ClicksEnabled {
            If SAVED_INFO.Reload_ClickCoord1 {
                coord := StrSplit(SAVED_INFO.Reload_ClickCoord1, ",")
                MouseClick, Left, % coord[1], coord[2], 1, 0 ; clickcount=1, speed=0 (fastest)
            }

            If SAVED_INFO.Reload_ClickCoord2 {
                coord := StrSplit(SAVED_INFO.Reload_ClickCoord2, ",")
                MouseClick, Left, % coord[1], coord[2], 1, 0 ; clickcount=1, speed=0 (fastest)
            }
        }

        ; reopen menu
        If SAVED_INFO.Reload_ReopenMenu {
            sleep 250   ; wait until completely finished
            Send {escape}
            sleep 25    ; ensure the key presses are both detected
            Send {escape}
        }
    }

    SendKeys(keys) {
        _previouslyActive := WinExist("A")
        MouseGetPos, mouseX, mouseY

        WinActivate, % GAME_INFO.ahkid
        WinWaitActive, % GAME_INFO.ahkid

        Send % keys
        WinActivate, % "ahk_id" A_Space _previouslyActive

        ; don't move the mouse if the game is active
        If (_previouslyActive = GAME_INFO.hwnd)
            return
        
        MouseMove, % mouseX, % mouseY, 0
    }

    Cmd(command) {
        If !WinExist(GAME_INFO.ahkid) {
            Msg("Info", A_ThisFunc, "Game handle or not set or game is not running")
            return
        }
        new this.ClassRunCommand(this, command)
    }

    Class ClassRunCommand {
        __New(parentInstance, command) {
            this.parent := parentInstance
            ; get console commands
            Switch command {
                case "ReloadEverything": cmd := "hud_reloadscheme; ui_reloadscheme; mat_reloadallmaterials; " this._GetReloadFontsCmd()
                case "ReloadFonts": cmd := this._GetReloadFontsCmd() "; hud_reloadscheme; ui_reloadscheme" ; no reason not to also reload these
                case "hideWorld": cmd := "r_drawWorld 0; r_drawEntities 0"
                case "showWorld": cmd := "r_drawWorld 1; r_drawEntities 1"
                case "giveAllItems": cmd := "give pistol; give pistol_magnum; give autoshotgun; give shotgun_chrome; give pumpshotgun; give shotgun_spas; give smg; give smg_mp5; give smg_silenced; give rifle_ak47; give rifle_sg552; give rifle; give rifle_m60; give rifle_desert; give hunting_rifle; give sniper_military; give sniper_awp; give sniper_scout; give weapon_grenade_launcher; give vomitjar; give molotov; give pipe_bomb; give first_aid_kit; give defibrilator; give adrenaline; give pain_pills; give chainsaw; give frying_pan; give electric_guitar; give katana; give machete; give tonfa"
                case "giveAllGuns": cmd := "give pistol; give pistol_magnum; give autoshotgun; give shotgun_chrome; give pumpshotgun; give shotgun_spas; give smg; give smg_mp5; give smg_silenced; give rifle_ak47; give rifle_sg552; give rifle; give rifle_m60; give rifle_desert; give hunting_rifle; give sniper_military; give sniper_awp; give sniper_scout; give weapon_grenade_launcher"
                case "giveAllMelees": cmd := "give chainsaw; give frying_pan; give electric_guitar; give katana; give machete; give tonfa"
                case "giveAllPickups": cmd := "give vomitjar; give molotov; give pipe_bomb; give first_aid_kit; give defibrilator; give adrenaline; give pain_pills"
                default: cmd := command
                ; default: Msg("Info", A_ThisFunc, "todo: run custom command")
            }

            ; close / re-open vgui_drawtree
            If EDITORMENU_VGUIDRAWTREE and !InStr(cmd, "vgui_drawtree") { ; !InStr(cmd, "vgui_drawtree") = ignore this code of the current command already shows it
                this.parent.SendKeys("!{F4}")
                cmd .= "; vgui_drawtree 1"
            }

            ; force close panels with alt+f4  that don't close with hud_reloadscheme
            If EDITORMENU_SHOWPANEL {
                panel := MenuGetTextAfterTab(EDITORMENU_SHOWPANEL)
                If (panel = "team") or (panel = "info") ; 'team' = 'chooseteam', 'info' = 'motd'
                    this.parent.SendKeys("!{F4}")
            }

            ; re-show panel, if set. wait commands makes sure the previous action is completed
            ;   eg. resizing the game to a different resolution
            If EDITORMENU_SHOWPANEL and !InStr(cmd, "panel") { ; !InStr(cmd, "panel") = ignore this code if the current command contains showpanel or hidepanel
                If InStr(EDITORMENU_SHOWPANEL, "debug_zombie_panel")
                    cmd .= "; wait; " MenuGetTextAfterTab(EDITORMENU_SHOWPANEL)
                else
                    cmd .= "; wait; " "showpanel" A_Space MenuGetTextAfterTab(EDITORMENU_SHOWPANEL)
            }

            ; write command to file
            FileDelete, % GAME_INFO.CfgDir "\hud_editor_execute_command.cfg"
            FileAppend, % cmd, % GAME_INFO.CfgDir "\hud_editor_execute_command.cfg"
            OutputDebug(A_ThisFunc A_Space "Sent cmd: " cmd)

            ; execute file
            If (SAVED_INFO.Reload_Type = "Hud")
                this._ControlSendF11()
            else
                this.parent.SendKeys("{F11}")

            ; restore game pos
            this.parent.RestorePos()
        }

        _ControlSendF11() {
            ; ControlSend Keystroke to game to execute command file
            KEY_SCANCODE := "57" ; 57 = F11 https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
            WM_KEYDOWN := "0x100"
            WM_KEYUP := "0x101"
            WM_KEYDOWN_PARAM := "0x00" KEY_SCANCODE "0001"	; eg: 0x001e0001    https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-keydown
            WM_KEYUP_PARAM := "0x20" KEY_SCANCODE "0001"		; eg; 0x201e0001    https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-keyup

            SendMessage, WM_KEYDOWN, , WM_KEYDOWN_PARAM,, % GAME_INFO.ahkid
            SendMessage, WM_KEYUP, , WM_KEYUP_PARAM,, % GAME_INFO.ahkid
        }

        _GetReloadFontsCmd() {
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
    }
}