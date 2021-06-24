

Class ClassGuiToolBrowseHudFiles extends gui {
    Get() {
        If !HUD_INFO.count() {
            Msg("Info", A_ThisFunc, "No hud active!")
            return
        }

        If !this.IsCreated {
            ; draw controls
            this.Add("Text",, "Search")
            this._SearchEdit := this.Add("edit", "w1000", "", this.Search.Bind(this))
            ; this.Add("Text",, "Files")
            this.Lv := new this.ListView(this, "r20 w1000 AltSubmit", "File|Description", this.LvHandler.Bind(this))

            this._btnAdd := this.Add("Button", "w100 Disabled", "Add", this.btnAdd.Bind(this))
            GuiButtonIcon(this._btnAdd, DIR_ICONS "\plus.png", 1, "s13 a0 l10")

            this._btnRecycle := this.Add("Button", "x+5 w100 Disabled", "Recycle", this.btnRecycle.Bind(this))
            GuiButtonIcon(this._btnRecycle, DIR_ICONS "\trash.png", 1, "s13 a0 l10")

            this._btnOpenFileDir := this.Add("Button", "x+5  w100 Disabled", "Open", this.btnOpenFileDir.Bind(this))
            GuiButtonIcon(this._btnOpenFileDir, DIR_ICONS "\folder.png", 1, "s13 a0 l10")

            this._btnOpenFileGameDir := this.Add("Button", "x+5  w100 Disabled", "Game", this.btnOpenFileGameDir.Bind(this))
            GuiButtonIcon(this._btnOpenFileGameDir, DIR_ICONS "\folder.png", 1, "s13 a0 l10")

            this._btnOpenFile := this.Add("Button", "x+5  w100 Disabled", "Open", this.btnOpenFile.Bind(this))
            GuiButtonIcon(this._btnOpenFile, DIR_ICONS "\file.png", 1, "s13 a0 l10")

            this._btnOpenFileDefault := this.Add("Button", "x+5 w100 Disabled", "Default", this.btnOpenFileDefault.Bind(this))
            GuiButtonIcon(this._btnOpenFileDefault, DIR_ICONS "\file.png", 1, "s13 a0 l10")

            this._btnModify := this.Add("Button", "x+5 w100 Disabled", "Modify", this.btnModify.Bind(this))
            GuiButtonIcon(this._btnModify, DIR_ICONS "\modify.png", 1, "s13 a0 l10")
        }
        else {
            ; this.SetText("Edit1") ; clear text 
            ControlFocus, this._SearchEdit, % this.ahkid
            Send ^a
        }

        ; hotkeys
        Hotkey, IfWinActive, % this.ahkid
        Hotkey, ^F, Hotkey_Edit1Focus
        ; Hotkey, Escape, Hotkey_Edit1DeleteText
        Hotkey, Enter, Hotkey_BrowseEnter
        Hotkey, IfWinActive
        
        ; show
        this.LvRefresh()
        ; this.Show("x0 y0 noactivate", "Browse Hud Files")
        this.Show("", "Browse Hud Files")
    }

    Escape() {
        this.hide()
    }

    btnAdd() {
        ; build path to hud folder
        newHudFilePath := HUD_INFO.Dir "\" this.selectedFileRelativePath

        ; create folder if necessary & copy file
        SplitPath, newHudFilePath, , newHudFileDir
        FileCreateDir, % newHudFileDir
        FileCopy, % this.selectedDefaultHudFilePath, % newHudFilePath, 0

        ; notify of error
        If ErrorLevel {
            Msg("Info", A_ThisFunc, "Could not copy file:`n`n" this.selectedDefaultHudFilePath "`n`n-->`n`n" newHudFilePath "`n`nDestination file most likely already exists")
            return
        }

        ; make file writeable
        FileSetAttrib, -R, % newHudFilePath

        ; ask to describe file
        Msg("InfoYesNo", A_ThisFunc, "Parse file & add file descriptions if available?")
        IfMsgBox, Yes
            AddHudFileDescriptionsToFile(newHudFilePath)

        run, % newHudFilePath
        this.Hide()
    }

    btnRecycle() {
        Msg("InfoYesNo", A_ThisFunc, "Are you sure you want to move this file to the recycle bin`n`n'" this.selectedHudFilePath "'?")
        IfMsgBox, No
            return
        FileRecycle, % this.selectedHudFilePath
        GAME_WIN.ResyncHud() ; removes deleted file from the game folder, and therefore from the hud file browser (if custom file)
        this.LvRefresh()
    }

    btnOpenFileDir() {
        SplitPath, % this.selectedHudFilePath, , hudFileDir
        run, % hudFileDir
        this.hide()
    }

    btnOpenFileGameDir() {
        SplitPath, % this.selectedFileRelativePath, , relativeDir
        run, % GAME_INFO.MainDir "\" relativeDir
        this.hide()
    }

    btnOpenFile() {
        If !FileExist(this.selectedHudFilePath)
            return
        run, % this.selectedHudFilePath
        this.Hide()
    }

    btnOpenFileDefault() {
        FileSetAttrib, +R, % this.selectedDefaultHudFilePath
        run, % this.selectedDefaultHudFilePath
        this.Hide()
    }

    LvRefresh() {
        this.Lv.Delete()
        this.Lv.Redraw(false)

        ; imagelist
        LvIl := new this.ImageList(,,0) ; large icons
        this.Lv.SetImageList(LvIl.ID)
        LvIl.Add(DIR_ICONS "\Verification.png")
        LvIl.Add(DIR_ICONS "\Cross.png")

        ; set any new key entries
        loop, files, % HUD_INFO.Dir "\*.*", FR
        {
            relativePath := StrReplace(A_LoopFileFullPath, HUD_INFO.Dir "\")
            HUD_DESC.GetFile(relativePath)
        }

        ; load listview
        files := []
        hudFileList := HUD_DESC.GetFiles()
        for index, f in hudFileList {
            
            ; check if this file should be added
            hudPath := HUD_INFO.Dir "\" f.fileRelativePath
            defaultPath := GetDefaultHudFile(f.fileRelativePath)
            If !FileExist(defaultPath) and !FileExist(hudPath)
                Continue
            
            ; set icon based on whether the file already exists in the hud
            If FileExist(hudPath)
                iconNo := 1
            else
                iconNo := 2

            ; add listview entry
            If this.SearchStr {
                If InStr(f.fileName, this.SearchStr) or InStr(f.fileDescription, this.SearchStr)
                    this.Lv.Add("Icon" iconNo, f.fileRelativePath, StrReplace(f.fileDescription, "`n", A_Space))
            }
            else
                this.Lv.Add("Icon" iconNo, f.fileRelativePath, StrReplace(f.fileDescription, "`n", A_Space))
        }

        ; adjust listview columns width
        this.Lv.ModifyCol(1, "AutoHdr")
        this.Lv.ModifyCol(2, "AutoHdr")

        this.Lv.Redraw(true)
    }

    LvHandler() {
        ; i = selected
        If (A_GuiEvent != "i") {
            ; get selection
            selectedRow := this.Lv.GetNext()
            If !selectedRow {
                this.Control("Disable", this._btnModify)
                return
            }
            this.Control("Enable", this._btnModify)

            ; retrieve variables
            this.selectedFileRelativePath := this.Lv.GetText(selectedRow, 1)
            this.selectedHudFilePath := HUD_INFO.Dir "\" this.selectedFileRelativePath
            this.selectedDefaultHudFilePath := GetDefaultHudFile(this.selectedFileRelativePath)

            ; toggle buttons
            If FileExist(this.selectedHudFilePath) {
                this.Control("Disable", this._btnAdd)
                this.Control("Enable", this._btnOpenFile)
                this.Control("Enable", this._btnRecycle)

                this.Control("Enable", this._btnOpenFileDir)
                this.Control("Enable", this._btnOpenFileGameDir)
            } else {
                this.Control("Enable", this._btnAdd)
                this.Control("Disable", this._btnOpenFile)
                this.Control("Disable", this._btnRecycle)

                this.Control("Disable", this._btnOpenFileDir)
                this.Control("Disable", this._btnOpenFileGameDir)
            }

            If FileExist(this.selectedDefaultHudFilePath)
                this.Control("Enable", this._btnOpenFileDefault)
            else
                this.Control("Disable", this._btnOpenFileDefault)
        }

        If (A_GuiEvent = "DoubleClick")
            this.btnOpenFile()
    }

    Search() {
        this.SearchStr := this.GetText(this._SearchEdit)
        this.LvRefresh()
    }

    btnModify() {
        this.Disable()


        ; debug
        ; relativeFilePath := "scripts\hudlayout.res"
        ; relativeFilePath := "addonimage.jpg"
        ; relativeFilePath := "resource\loadingdiscpanel.res"
        ; isSaved := new this.ClassGuiModifyFileDescription(relativeFilePath).Modify(relativeFilePath)


        ; normal
        isSaved := new this.ClassGuiModifyFileDescription(this.selectedFileRelativePath).Modify(this.selectedFileRelativePath)
        If isSaved
            this.LvRefresh()

        this.Enable()
        this.Show()
    }

    Class ClassGuiModifyFileDescription extends gui {
        Modify(key) {
            If !key
                Msg("Fatal", A_ThisFunc, "No key specified: " key)
            
            ; get variables
            this.key := key
            this.obj := HUD_DESC.GetFile(key)
            
            ; add controls
            this.Add("text", "w400", "Control Descriptions")
            this._controlsDropDown := this.Add("DropDownList", "w330 section", , this.dropDownHandler.Bind(this))
            _controlBtnAdd := this.Add("button", "x+5 ys-1 w30", "", this.btnAddControl.Bind(this))
            GuiButtonIcon(_controlBtnAdd, DIR_ICONS "\plus.png", 1, "s13 a4")
            _controlBtnDelete := this.Add("button", "x+5 ys-1 w30", "", this.btnDeleteControl.Bind(this))
            GuiButtonIcon(_controlBtnDelete, DIR_ICONS "\trash.png", 1, "s13 a4")
            this._controlEdit := this.Add("edit", "xs w400", "")
            
            this.Add("text", "w400", "File Description")
            this._fileDescriptionEdit := this.Add("edit", "w400 r10", this.obj.fileDescription)
            ControlGetPos, editX, editY, editW, editH, , % "ahk_id" A_Space this._fileDescriptionEdit

            this.Add("button", "w" editW, "Save", this.btnSave.Bind(this))
            
            ; show
            this.Show()
            this.dropDownRefresh()

            ; close
            DetectHiddenWindows, Off
            WinWaitClose, % this.ahkid
            return this.isSaved
        }

        btnAddControl() {
            CoordMode, Mouse, Screen
            MouseGetPos, mX, mY
            width := 250
            height := 110
            InputBox, newControl, Add Control Description, , , 250, 110, % mX - (width/2), % mY - (height/2)
            If !newControl
                return

            ; check if control already exists
            If this.obj.fileControls.HasKey(newControl) {
                Msg("Info", A_ThisFunc, "Description for '" newControl "' already exists!")
                return
            }

            ; add control
            this.obj.fileControls[newControl] := ""

            ; refresh dropdown
            this.dropDownRefresh()
        }

        btnDeleteControl() {
            selectedControl := this.GetText(this._controlsDropDown)
            this.obj.fileControls.Delete(selectedControl)
            this.dropDownRefresh()
        }

        dropDownHandler() {
            static previousSelectedControl
            
            ; get selected control
            selectedControl := this.GetText(this._controlsDropDown)

            ; save previous selected control description
            If previousSelectedControl {
                this.obj.fileControls[previousSelectedControl] := this.GetText(this._controlEdit)
                ; OutputDebug("Saved control " previousSelectedControl " ==text== " this.GetText(this._controlEdit))
            }

            ; load selected control description
            this.SetText(this._controlEdit, this.obj.fileControls[selectedControl])

            ; remember selected control
            previousSelectedControl := selectedControl
        }

        dropDownRefresh() {
            ; reload controls list
            for controlName, controlDescription in this.obj.fileControls
                controlsDisplayVar .= controlName "||"
            this.Control(, this._controlsDropDown, controlsDisplayVar)

            ; load selected control description
            this.SetText(this._controlEdit, this.obj.fileControls[this.GetText(this._controlsDropDown)])
        }

        btnSave() {
            ; save file description
            this.obj.fileDescription := this.GetText(this._fileDescriptionEdit)

            ; save potentially unsaved control description
            this.obj.fileControls[this.GetText(this._controlsDropDown)] := this.GetText(this._controlEdit)

            ; save
            HUD_DESC.SetFile(this.key, this.obj)

            ; close
            this.Hide()
            this.isSaved := true
        }
    }
}

Hotkey_Edit1Focus() {
    ControlFocus, Edit1, A
    Send ^a
}

Hotkey_Edit1DeleteText() {
    ControlGetFocus, activeControl, A
    If (activeControl != "Edit1")
        return
    ControlSetText, % activeControl, , A
}

Hotkey_BrowseEnter() {
    ; set active gui as default
    _Gui := WinExist(A)
    ControlGet, _Lv, Hwnd,, SysListView321, A
    If !_Lv
        return
    Gui % _Gui ": Default"

    ; get active control
    ControlGetFocus, activeControl, A
    
    If (activeControl = "Edit1")
        ; open listview entry nr. 1
        rowNumber := 1
    else if (activeControl = "SysListView321")
        ; open selected listview entry
        rowNumber := LV_GetNext()

    LV_GetText(relativeFilePath, rowNumber, 1)
    hudFilePath := HUD_INFO.Dir "\" relativeFilePath

    If !FileExist(hudFilePath)
        return
    run, % hudFilePath
    Gui % _Gui ": Hide"
}