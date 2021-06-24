Class ClassGuiMain extends gui {
    Get() {
        If this.IsCreated {
            this.Show()
            return
        }

        this.SubGui := new this.ClassSubGui()
        this.SubGui.SetParent(this)

        this.margin(10, 10)
        this.font("s11")
        this.HudLv := new this.ListView(this, "w650 r10 AltSubmit +hdr -multi -LV0x10 AltSubmit", "Game|Hud|Location", this.HudLvHandler.Bind(this)) ; -hdr
        ; this.font("")

        this.noPicPic := DIR_ICONS "\cross128.png"
        this._hudPicture := this.add("picture", "w78 h78 section Border")
        this.Control(, this._hudPicture, this.noPicPic)

        _btnEdit := this.Add("button", "x+5 ys w165 h80", "Edit", this.btnEdit.Bind(this))
        GuiButtonIcon(_btnEdit, DIR_ICONS "\paintbrush.png", 1, "s32 a0 l15")

        _btnOpen := this.Add("button", "x+5 ys-1 w165 r2 section", "Open", this.btnOpen.Bind(this))
        GuiButtonIcon(_btnOpen, DIR_ICONS "\folder.png", 1, "s16 a0 l10")

        _btnModify := this.Add("button", "xs ys+50 w80", "Modify", this.btnModify.Bind(this))
        GuiButtonIcon(_btnModify, DIR_ICONS "\modify.png", 1, "s14 a0 l2 r0")

        _btnRemove := this.Add("button", "x+5 w80", "Remove", this.btnRemove.Bind(this))
        GuiButtonIcon(_btnRemove, DIR_ICONS "\trash.png", 1, "s14 a0 l2 r0")

        _btnNew := this.Add("button", "x+68 ys w80 section", "New", this.btnNew.Bind(this))
        GuiButtonIcon(_btnNew, DIR_ICONS "\star.png", 1, "s14 a0 l2 r0")

        _btnAdd := this.Add("button", "x+5 w80", "Add", this.btnAdd.Bind(this))
        GuiButtonIcon(_btnAdd, DIR_ICONS "\plus.png", 1, "s14 a0 l2 r0")

        this.LvRefresh()
        this.Show("")
    }

    LvRefresh() {
        this.HudLv.Delete() ; clear

        HudLvIl := new this.ImageList(,,0) ; large icons
        this.HudLv.SetImageList(HudLvIl.ID)
        HudLvIl.Add(DIR_ICONS "\Left 4 Dead.ico")
        HudLvIl.Add(DIR_ICONS "\Left 4 Dead 2.ico")

        for index, hud in SAVED_SETTINGS.StoredHuds {
            If (hud.game = "Left 4 Dead")
                gameIcon := 1
            else
                gameIcon := 2

            this.HudLv.Add("Icon" gameIcon,hud.Game, hud.Name, hud.dir)
        }
        
        loop 3
            this.HudLv.ModifyCol(A_Index, "AutoHDR")
    }

    HudLvHandler() {
        If !(A_GuiEvent = "Normal")
            return

        selectedRow := this.HudLv.GetNext()
        If !selectedRow
            return
        dir := this.HudLv.GetText(selectedRow, 3)
        pic := dir "\addonimage.jpg"
        If !FileExist(pic)
            pic := this.noPicPic
        this.Control(, this._hudPicture, pic)
    }

    btnNew() {
        this.SubGui.Get("CreateNewHud")
    }

    btnAdd() {
        this.SubGui.Get("AddExistingHud")
    }

    btnModify() {
        selectedRow := this.HudLv.GetNext()
        If !selectedRow
            return
        this.SubGui.Get("ModifyExistingHud", selectedRow)
    }

    btnRemove() {
        selectedRow := this.HudLv.GetNext()
        If !selectedRow
            return
        SAVED_SETTINGS.StoredHuds.RemoveAt(selectedRow)
        this.LvRefresh()
    }

    btnOpen() {
        selectedRow := this.HudLv.GetNext()
        If !selectedRow
            return
        dir := this.HudLv.GetText(selectedRow, 3)
        If !IsDir(dir) {
            Msg("Error", A_ThisFunc, "HUD Folder does not exist: " dir)
            return
        }
        run % dir
    }

    btnEdit() {
        selectedRow := this.HudLv.GetNext()
        If !selectedRow
            return
        selectedDir := this.HudLv.GetText(selectedRow, 3)
        If !IsDir(selectedDir) {
            Msg("Info", A_ThisFunc, selectedDir A_Space "does not exist!")
            return
        }
        success := SetHudInfoFor(selectedDir)
        If !success
            return

        If !IsDir(HUD_INFO.dir) {
            Msg("Error", A_ThisFunc, "HUD Folder does not exist: " HUD_INFO.dir)
            return
        }
        this.Hide()
        StartHudEditing(HUD_INFO.game)
    }

    Close() {
        exitapp
    }

    Class ClassSubGui extends gui {
        SetParent(parent) {
            this.parent := parent
        }

        Get(action, param := "") {
            ; process input
            this.modifyHudIndex := ""
            this.action := action
            Switch this.action {
                case "AddExistingHud": guiTitle := "Add HUD"
                case "CreateNewHud": guiTitle := "New HUD"
                case "ModifyExistingHud": {
                    this.modifyHudIndex := param
                    guiTitle := "Modify" A_Space SAVED_SETTINGS.StoredHuds[this.modifyHudIndex].name
                }
                case default: Msg("FatalError", A_ThisFunc, "Invalid action specified")
            }
            this.__New(guiTitle)
            this.parent.Disable()
            
            If (this.modifyHudIndex)
                modifyHud := SAVED_SETTINGS.StoredHuds[this.modifyHudIndex]

            ; controls
            width := 250
            margin := 10
            this.Margin(margin, margin)
            
            this.Add("text", "w" width, "Game")
            this.Add("dropdownlist", "w" width, "Left 4 Dead|Left 4 Dead 2||")
            If (modifyHud.game)
                this.Control(, "ComboBox1", modifyHud.game "||")

            this.Add("text", "w" width, "Folder")
            this._dirEdit := this.Add("edit", "w" width - 19 - margin, modifyHud.dir, this.editFolderHandler.Bind(this))
            _btnChooseDir := this.Add("button", "x+5 yp-1 w25", "", this.btnBrowseDir.Bind(this))
            GuiButtonIcon(_btnChooseDir, DIR_ICONS "\folder.png", 1, "s14 a0 l2 r0")

            this.Add("text", "x" margin A_Space  "w" width, "Name")
            this._nameEdit := this.Add("edit", "w" width, modifyHud.name)

            _btnSave := this.Add("button", "w" width + 3 " x" margin - 1, "        Save", this.btnSave.Bind(this))
            GuiButtonIcon(_btnSave, DIR_ICONS "\save.png", 1, "s14 a4 r30")

            ; close
            this.Show()
            WinWaitClose, % this.ahkid
            this.parent.Enable()
            this.parent.Show()
            this.parent.LvRefresh()
        }

        editFolderHandler() {
            If this.GetText(this._nameEdit)
                return
            SplitPath, % this.GetText(this._dirEdit), OutFileName, OutDir, OutExtension, dirName, OutDrive
            this.SetText(this._nameEdit, dirName)
        }

        btnBrowseDir() {
            FileSelectFolder, selectedDir , , , Choose hud folder
            If !IsDir(selectedDir)
                return
            this.SetText(this._dirEdit, selectedDir)
        }

        btnSave() {
            game := this.GetText("ComboBox1")
            name := this.GetText(this._nameEdit)
            dir := this.GetText(this._dirEdit)

            If !name {
                Msg("Info", A_ThisFunc, "No name specified")
                return
            }
            If !IsDir(dir) and (this.action != "CreateNewHud") {
                Msg("Info", A_ThisFunc, "Invalid dir specified")
                return
            }
            ; prevent multiple huds with identical dirs from being saved
            ; because 'SwitchToHud'/'SetHudInfoFor' use dir to read the correct info from settings
            If this.modifyHudIndex ; (temporarily) remove modified hud so it isn't detected as a duplicate
                SAVED_SETTINGS.StoredHuds.RemoveAt(this.modifyHudIndex)
            for index, hud in SAVED_SETTINGS.StoredHuds {
                if (hud.dir = dir) {
                    Msg("Info", A_ThisFunc, hud.name " already uses this folder!")
                    return
                }
            }

            ; on CreateNewHud
            If (this.action = "CreateNewHud") {
                ; ask user if they want to use that folder, if it already contains files
                loop, files, % dir "\*.*", FDR
                    files++
                If (files) {
                    msg := "Folder already contains files. Are you sure you sure you want to create a new hud here?"
                    Msg("InfoYesNo", A_ThisFunc, msg)
                    IfMsgBox, No
                        return
                }
                ; move template hud into specified dir
                FileCopyDir, % GAME_INFO.templateDir, % dir, 1
            }

            ; save hud to settings
            SAVED_SETTINGS.StoredHuds.push({game: game, name: name, dir: dir})
            
            this.Hide()
        }
    }
}