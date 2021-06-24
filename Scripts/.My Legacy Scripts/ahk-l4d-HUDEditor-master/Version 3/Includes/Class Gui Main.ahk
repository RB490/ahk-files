Class ClassGuiMain extends gui {
    Get() {
        If this.IsCreated {
            ; update pic / info
            this._LvFocusActiveHudRow()
            this.Show()
            return
        }

        this.SubGui := new this.ClassSubGui()
        this.SubGui.SetParent(this)

        this.margin(10, 10)
        this.font("s11")
        lvW := 650
        this.Lv := new this.ListView(this, "w" lvW " r10 AltSubmit +hdr -multi -LV0x10 AltSubmit", "Game|Hud|Location", this.LvHandler.Bind(this)) ; -hdr
        ; this.font("")

        ; buttons under listview

        this._btnEdit := this.Add("button", " w400 r2 section", "Edit", this.btnEdit.Bind(this))
        GuiButtonIcon(this._btnEdit, DIR_ICONS "\paintbrush.png", 1, "s32 a0 l15")

        _btnOpen := this.Add("button", "x+5 ys-1 w165 r2 section", "Open", this.btnOpen.Bind(this))
        GuiButtonIcon(_btnOpen, DIR_ICONS "\folder.png", 1, "s16 a0 l10")

        _btnExport := this.Add("button", "x+5 w165 r2", "Export", this.btnExport.Bind(this))
        GuiButtonIcon(_btnExport, DIR_ICONS "\airplane.png", 1, "s14 a0 l2 r0")

        ; buttons right of listview

        _btnNew := this.Add("button", "x" lvW + 20 " y10  w80 section", "New", this.btnNew.Bind(this))
        GuiButtonIcon(_btnNew, DIR_ICONS "\star.png", 1, "s14 a0 l2 r0")

        _btnAdd := this.Add("button", "xs y+5 w80", "Add", this.btnAdd.Bind(this))
        GuiButtonIcon(_btnAdd, DIR_ICONS "\plus.png", 1, "s14 a0 l2 r0")

        this.noPicPic := DIR_ICONS "\cross128.png"
        this._hudPic := this.add("picture", "xs+1 y+13 w78 h78 section Border")
        this.Control(, this._hudPic, this.noPicPic)

        _btnModify := this.Add("button", "xs-1 y+12 w80", "Modify", this.btnModify.Bind(this))
        GuiButtonIcon(_btnModify, DIR_ICONS "\modify.png", 1, "s14 a0 l2 r0")

        _btnRemove := this.Add("button", "y+5 w80", "Remove", this.btnRemove.Bind(this))
        GuiButtonIcon(_btnRemove, DIR_ICONS "\trash.png", 1, "s14 a0 l2 r0")

        this.LvRefresh()
        this._LvFocusActiveHudRow()
        ; this.Show("x0 y0 noactivate")
        this.Show("")
    }

    LvRefresh() {
        this.Lv.Delete() ; clear

        LvIl := new this.ImageList(,,0) ; large icons
        this.Lv.SetImageList(LvIl.ID)
        LvIl.Add(DIR_ICONS "\Left 4 Dead.ico")
        LvIl.Add(DIR_ICONS "\Left 4 Dead 2.ico")

        for index, hud in SAVED_INFO.StoredHuds {
            If (hud.game = "Left 4 Dead")
                gameIcon := 1
            else
                gameIcon := 2

            this.Lv.Add("Icon" gameIcon,hud.Game, hud.Name, hud.dir)
        }
        
        loop 3
            this.Lv.ModifyCol(A_Index, "AutoHDR")
    }

    LvHandler() {
        If !(A_GuiEvent = "Normal")
            return

        this._LvLoadSelectedRow()
    }

    _LvFocusActiveHudRow() {
        ; loop listview rows
        loop % this.Lv.GetCount() {
            row := A_Index
            game := this.Lv.GetText(row, 1)
            name := this.Lv.GetText(row, 2)
            dir := this.Lv.GetText(row, 3)

            If (game = HUD_INFO.game) and (name = HUD_INFO.name) and (dir = HUD_INFO.dir)
                this.Lv.Modify(row, "+select")
        }

        this._LvLoadSelectedRow()
    }

    _LvLoadSelectedRow() {
        ; get selected row
        selectedRow := this.Lv.GetNext()
        game := this.Lv.GetText(selectedRow, 1)
        name := this.Lv.GetText(selectedRow, 2)
        dir := this.Lv.GetText(selectedRow, 3)
                
        ; set hud picture
        If !selectedRow {
            pic := this.noPicPic
            this.Control(, this._hudPic, pic)
            return
        }
        pic := dir "\addonimage.jpg"
        If !FileExist(pic)
            pic := this.noPicPic
        this.Control(, this._hudPic, pic)

        ; switch 'edit' button between 'edit' and 'unsync'
        If SYNC_HUD and (game = HUD_INFO.game) and (name = HUD_INFO.name) and (dir = HUD_INFO.dir) { ; and SYNC_HUD and 
            ; this.Control("Disable", this._btnEdit)
            this.SetText(this._btnEdit, "Unsync") ; end death
        } else {
            ; this.Control("Disable", this._btnEdit)
            this.SetText(this._btnEdit, "Edit") ; end death
        }
    }

    btnNew() {
        this.SubGui.Get("New")
    }

    btnAdd() {
        this.SubGui.Get("Add")
    }

    btnModify() {
        selectedRow := this.Lv.GetNext()
        If !selectedRow
            return
        this.SubGui.Get("Modify", selectedRow)
    }

    btnRemove() {
        selectedRow := this.Lv.GetNext()
        If !selectedRow
            return
        SAVED_INFO.StoredHuds.RemoveAt(selectedRow)
        this.LvRefresh()
    }

    btnDescribe() {
        selectedRow := this.Lv.GetNext()
        If !selectedRow
            return
        dir := this.Lv.GetText(selectedRow, 3)

        AddHudFileDescriptionsToDir(dir)
    }

    btnExport() {
        ; get selected hud info
        selectedRow := this.Lv.GetNext()
        If !selectedRow
            return
        hudName := this.Lv.GetText(selectedRow, 2)
        hudDir := this.Lv.GetText(selectedRow, 3)

        ExportHudAsVpk(hudName, hudDir)
    }

    btnOpen() {
        selectedRow := this.Lv.GetNext()
        If !selectedRow
            return
        dir := this.Lv.GetText(selectedRow, 3)
        If !IsDir(dir) {
            Msg("Error", A_ThisFunc, "HUD Folder does not exist: " dir)
            return
        }
        run % dir
    }

    btnEdit() {
        ; is row selected
        selectedRow := this.Lv.GetNext()
        If !selectedRow
            return

        ; unsync if selected
        If (this.GetText(this._btnEdit) = "Unsync") {
            EditorMenu_UnsyncHud()
            ; update button
            this._LvFocusActiveHudRow()
            return
        }
        
        obj := []
        obj.game := this.Lv.GetText(selectedRow, 1)
        obj.name := this.Lv.GetText(selectedRow, 2)
        obj.dir := this.Lv.GetText(selectedRow, 3)
        this.Hide()
        StartHudEditing(obj)
        return
    }

    Close() {
        If SYNC_HUD ; WinExist(GAME_INFO.ahkExe)
            return
        exitapp
    }

    Class ClassSubGui extends gui {
        SetParent(parent) {
            this.parent := parent
        }

        Get(action, modifyHudIndex := "") {
            ; process params
            this.modifyHudIndex := modifyHudIndex
            this.action := action
            this.__New(action)
            this.parent.Disable()
            
            If (this.modifyHudIndex)
                modifyHud := SAVED_INFO.StoredHuds[this.modifyHudIndex]

            ; controls
            width := 250
            margin := 10
            this.Margin(margin, margin)
            
            this.Add("text", "w" width, "Game")
            this.Add("dropdownlist", "w" width, "Left 4 Dead|Left 4 Dead 2||")
            If (modifyHud.game)
                this.Control("Choose", "ComboBox1", modifyHud.game)

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
            DetectHiddenWindows, Off
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
            
            SplitPath, selectedDir, , , , selectedDirName
            this.SetText(this._nameEdit, selectedDirName)
        }

        btnSave() {
            game := this.GetText("ComboBox1")
            name := this.GetText(this._nameEdit)
            dir := this.GetText(this._dirEdit)

            If !name {
                Msg("Info", A_ThisFunc, "No name specified")
                return
            }
            If !IsDir(dir) and (this.action != "New") {
                Msg("Info", A_ThisFunc, "Invalid dir specified")
                return
            }
            ; prevent multiple huds with identical dirs from being saved
            ; so script can use dir to read the correct info from settings
            If this.modifyHudIndex ; (temporarily) remove modified hud so it isn't detected as a duplicate
                SAVED_INFO.StoredHuds.RemoveAt(this.modifyHudIndex)
            for index, hud in SAVED_INFO.StoredHuds {
                if (hud.dir = dir) {
                    Msg("Info", A_ThisFunc, hud.name " already uses this folder!")
                    return
                }
            }

            ; on New
            If (this.action = "New") {
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
                templatesDir := A_ScriptDir "\Assets\Hud Templates\" game
                FileCopyDir, % templatesDir, % dir, 1
                If ErrorLevel {
                    Msg("Info", A_ThisFunc, "Unable to create folder: " dir)
                    return
                }
                FileSetAttrib, -R, % dir "\*.*", 1, 1
            }

            ; save hud to settings
            SAVED_INFO.StoredHuds.push({game: game, name: name, dir: dir})
            
            this.Hide()
        }
    }
}