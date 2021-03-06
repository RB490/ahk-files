; save file in 'UTF-16 LE' format for symbols to display properly
class ClassGuiLog extends gui {
    Get() {
        ; create window
        if WinExist(this.ahkid) {
            this.SavePos()
            this.Destroy()
        }
        this.__New(APP_NAME)
        
        ; properties
        this.marginSize := 5
        btnW := 100

        ; controls
        ; this.Color("F0F0F0", "F0F0F0")
        this.Add("tab3", "x" this.marginSize " ", "")
        this._LoadDrops()

        DetectHiddenWindows, On ; for ControlGetPos
        ControlGetPos , tabX, tabY, tabW, tabH, SysTabControl321, % this.ahkid
        If (tabH < 185) {
            tabH := 185
            ControlMove, SysTabControl321, , , , % tabH, % this.ahkid
        }

        ; selected drops
        this.Add("edit", "x" this.marginSize " y" (this.marginSize * 2) + tabH " w" tabW  - this.marginSize + 3 " r1 section ReadOnly", "")

        ; btn clear drops
        this._btnClearDrops := this.Add("button", "x+" this.marginSize " ys-1  w23", "X", this.ClearDrops.Bind(this))

        ; btn undo
        this._btnUndo := this.Add("button", "x+" this.marginSize + 123 " w" 23 " h23", "", this.Undo.Bind(this))
        GuiButtonIcon(this._btnUndo, DIR_GUI_ICONS "\undo_32.png", 1, "s16")

        ; btn redo
        this._btnRedo := this.Add("button", "x+" this.marginSize " w" 23 " h23", "", this.Redo.Bind(this))
        GuiButtonIcon(this._btnRedo, DIR_GUI_ICONS "\redo_32.png", 1, "s16")

        ; btn log menu
        this._btnShowMenu := this.Add("button", "x+" this.marginSize " w" 23 " h23", "", this.ShowMenu.Bind(this))
        GuiButtonIcon(this._btnShowMenu, DIR_GUI_ICONS "\settings_hamburger_32.png", 1, "s16")

        ; drop log view
        this.Add("edit", "x" tabW + (this.marginSize * 2) + 27 " y" this.marginSize - 1 + 23 " w200 h" tabH - 22 " ReadOnly", "")

        ; btn add kill
        this._btnAddKill := this.Add("button", "x" tabW + this.marginSize + 3 " y" this.marginSize - 2 + 23 " w23 h" tabH - 20 "", "+", this.AddKill.Bind(this))

        ; btn start / stop death
        this.Font("s11")
        this._btnToggleDeath := this.Add("button", "x" tabW + this.marginSize + 3 " y" this.marginSize - 4 " w23 h23", "", this.ToggleDeath.Bind(this))
        this.Font("")

        ; btn start / stop trip
        this._btnToggleTrip := this.Add("button", "x+" this.marginSize " w" 98 " h23", "",this.ToggleTrip.Bind(this))

        ; btn new trip
        this._btnNewTrip := this.Add("button", "x+" this.marginSize " w" 98 " h23", "New Trip   ", this.NewTrip.Bind(this))
        GuiButtonIcon(this._btnNewTrip, DIR_GUI_ICONS "\agility_icon_23.png", 1, "s14 a0 l10 r0")

        ; hotkey
        Hotkey, IfWinActive, % this.ahkid
        Hotkey, Enter, ClassGuiLog_HotkeyEnter
        Hotkey, IfWinActive

        ; show
        this.ShowGui()
        this.CheckPos()
        If DB_SETTINGS.logGuiAutoShowStats
            STATS_GUI.Get()
        this.Update()
    }

    Update() {
        this.SetText("edit2", DROP_LOG.GetFormattedLog())

        ; drops
        loop % SELECTED_DROPS.length()
            drops .= SELECTED_DROPS[A_Index].quantity " x " SELECTED_DROPS[A_Index].name ", "
        drops := RTrim(drops, ", ")
        this.SetText("edit1", drops)

        ; buttons
        If DROP_LOG.TripActive() {
            this.Control("Enable", this._btnToggleDeath)
            this.Control("Enable", this._btnAddKill)
            this.Control("Enable", this._btnClearDrops)

            this.SetText(this._btnToggleTrip, "End Trip   ") ; end trip
            GuiButtonIcon(this._btnToggleTrip, DIR_GUI_ICONS "\stop_32.png", 1, "s14 a0 l10 r0")
        } else {
            this.Control("Disable", this._btnToggleDeath)
            this.Control("Disable", this._btnAddKill)
            this.Control("Disable", this._btnClearDrops)

            this.SetText(this._btnToggleTrip, "Start Trip   ") ; start trip
            GuiButtonIcon(this._btnToggleTrip, DIR_GUI_ICONS "\start_32.png", 1, "s14 a0 l10 r0")
        }

        If DROP_LOG.DeathActive() {
            this.SetText(this._btnToggleDeath, "♥") ; end death
            this.Control("Disable", this._btnAddKill)
            this.Control("Disable", this._btnClearDrops)
            this.Control("Disable", this._btnNewTrip)
            this.Control("Disable", this._btnToggleTrip)
        } else {
            this.SetText(this._btnToggleDeath, "☠") ; start death
            this.Control("Enable", this._btnNewTrip)
            this.Control("Enable", this._btnToggleTrip)
        }

        If DROP_LOG.redoActions.length()
            this.Control("Enable", this._btnRedo)
        else
            this.Control("Disable", this._btnRedo)

        If DROP_LOG.undoActions.length()
            this.Control("Enable", this._btnUndo)
        else
            this.Control("Disable", this._btnUndo)

        If SELECTED_DROPS.length() {
            this.Control("Enable", this._btnAddKill)
            this.Control("Enable", this._btnClearDrops)
        }
        else {
            this.Control("Disable", this._btnAddKill)
            this.Control("Disable", this._btnClearDrops)
        }

        SetTimer, updateStats, -1
    }

    ShowMenu() {
        Gosub MiscMenu_Show
    }

    ClearDrops() {
        SELECTED_DROPS := {}
        this.SetText("Edit1")
        this.Update()
    }

    AddKill() {
        DROP_LOG.AddKill(SELECTED_DROPS)
        this.ClearDrops()
        this.Update()
    }

    Undo() {
        DROP_LOG.Undo()
        this.ClearDrops()
        this.Update()
    }

    Redo() {
        DROP_LOG.Redo()
        this.ClearDrops()
        this.Update()
    }

    StartTrip() {
        DROP_LOG.StartTrip()
        this.ClearDrops()
        this.Update()
    }

    EndTrip() {
        DROP_LOG.EndTrip()
        this.ClearDrops()
        this.Update()
    }

    ToggleTrip() {
        DROP_LOG.ToggleTrip()
        this.ClearDrops()
        this.Update()
    }

    ToggleDeath() {
        DROP_LOG.ToggleDeath()
        this.ClearDrops()
        this.Update()
    }

    NewTrip() {
        DROP_LOG.NewTrip()
        this.ClearDrops()
        this.Update()
    }

    _LoadDrops() {
        this.Margin(0, 0)
        dropSize := DB_SETTINGS.logGuiDropSize
        maxRowDrops := DB_SETTINGS.logGuiMaxRowDrops ; after this amount of drops a new row is started


        imageDir := GetItemImageDirFromSetting()

        loop % DROP_TABLE.obj.length() {
            tab := DROP_TABLE.obj[A_Index].title
            drops := DROP_TABLE.obj[A_Index].drops

            this.Control(,"SysTabControl321", tab) ; create tab
            this.Tab(tab) ; select tab

            ; add drops
            rowDrops := 0
            loop % drops.length() {
                If (rowDrops = maxRowDrops)
                    rowDrops := 0

                If (drops[A_Index].name = "Nothing")
                    dropImg := A_ScriptDir "\res\img\Nothing.png"
                else
                    dropImg := imageDir "\" RUNELITE_API.GetItemId(drops[A_Index].name) ".png"

                totalItems++
                dropVar := "g_vLogGuiItem#" totalItems

                If (A_Index = 1)
                    this.AddGlobal("picture", "x+0 section w" dropSize " h" dropSize " v" dropVar " border", dropImg) ; first drop
                else if !rowDrops
                    this.AddGlobal("picture", "xs ys+" dropSize + 1 " section w" dropSize " h" dropSize " v" dropVar " border", dropImg) ; first drop of a new row
                else
                    this.AddGlobal("picture", "xp+" dropSize + 1 "  w" dropSize " h" dropSize " v" dropVar " border", dropImg) ; add normal drop

                rowDrops++
            }
        }

        this.Tab("") ; Future controls are not part of any tab control.
        this.Margin(this.marginSize, this.marginSize) ; restore margin size
    }

    SavePos() {
        WinGetPos(this.hwnd, guiLogX, guiLogY, guiLogW, guiLogH, true) 
        If !guiLogW and !guiLogH
            return
        DB_SETTINGS.guiLogX := guiLogX
        DB_SETTINGS.guiLogY := guiLogY
    }

    CheckPos() {
        WinGetPos, guiLogX, guiLogY, guiLogW, guiLogH, % this.ahkid

        If (guiLogX < 0) ; offscreen-left
            DB_SETTINGS.guiLogX := 0
        If (guiLogY < 0) ; offscreen-top
            DB_SETTINGS.guiLogY := 0
        If (guiLogX + guiLogW > A_ScreenWidth) ; offscreen-right
            DB_SETTINGS.guiLogX := A_ScreenWidth - guiLogW
        If (guiLogY + guiLogH > A_ScreenHeight) ; offscreen-bottom
            DB_SETTINGS.guiLogY := A_ScreenHeight - guiLogH

        this.ShowGui()
    }

    ShowGui() {
        If !(DB_SETTINGS.guiLogX = "") and !(DB_SETTINGS.guiLogY = "")
            this.Show("x" DB_SETTINGS.guiLogX A_Space "y" DB_SETTINGS.guiLogY)
        else
            this.Show()
    }

    Close() {
        MAIN_GUI.Get()
        SaveSettings()
    }
}

ClassGuiLog_HotkeyEnter() {
    LOG_GUI.AddKill()
}

MiscMenu_Show:
    logGuiDropSize := DB_SETTINGS.logGuiDropSize
    logGuiMaxRowDrops := DB_SETTINGS.logGuiMaxRowDrops
    logGuiTablesMergeBelowX := DB_SETTINGS.logGuiTablesMergeBelowX
    logGuiItemImageType := DB_SETTINGS.logGuiItemImageType
    MiscMenu_Mob := DB_SETTINGS.selectedMob
    MiscMenu_LogFile := DB_SETTINGS.selectedLogFile
    
    ; controls
    menu, MiscMenu, add
    menu, MiscMenu, DeleteAll
    menu, MiscMenu, add, Mob `t%MiscMenu_Mob%, MiscMenu_Mob
    menu, MiscMenu, add, File `t%MiscMenu_LogFile%, MiscMenu_LogFile
    menu, MiscMenu, add
    menu, MiscMenu, add, Stats, MiscMenu_Stats
    menu, MiscMenu, add, Settings, MiscMenu_Settings
    menu, MiscMenu, add, About, MiscMenu_About

    ; properties
    menu, MiscMenu, Icon, Stats, % DIR_GUI_ICONS "\osrs_icons\Leagues_Tutor_icon.png", 1
    menu, MiscMenu, Icon, Settings, % DIR_GUI_ICONS "\osrs_icons\Bounty_Hunter_-_task_config_icon.png", 1
    menu, MiscMenu, Icon, About, % DIR_GUI_ICONS "\osrs_icons\Quest_start_icon.png", 1

    menu, MiscMenu, Icon, Mob `t%MiscMenu_Mob%, % DIR_MOB_IMAGES "\" MiscMenu_Mob ".png", 1, 15

    ; show
    menu, MiscMenu, show
return

MiscMenu_LogFile:
    DROP_LOG.Save()
    run, % DB_SETTINGS.selectedLogFile
return

MiscMenu_Mob:
    run, % WIKI_API.GetPageUrl(DB_SETTINGS.selectedMob)
return

MiscMenu_Stats:
    STATS_GUI.Get()
return

MiscMenu_Settings:
    LOG_GUI.Disable()
    savedSettings := SETTINGS_GUI.Get()
    LOG_GUI.Enable()
    If !savedSettings {
        LOG_GUI.Show() ; bring to front
        return
    }
    LOG_GUI.Get() ; redraw
return

MiscMenu_About:
    ABOUT_GUI.Get()
return