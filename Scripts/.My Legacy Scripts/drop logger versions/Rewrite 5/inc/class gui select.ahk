; TODO: add context menu to delete entries

class class_gui_select extends gui {
    Setup() {
        ; events
        this.Events["_BtnLog"] := this.LogMob.Bind(this)
        this.Events["_BtnAdd"] := this.AddMob.Bind(this)
        this.Events["_BtnRefresh"] := this.Refresh.Bind(this)
        this.Events["_BtnRemove"] := this.RemoveMob.Bind(this)
        this.Events["_BtnClose"] := this.Close.Bind(this)
        this.Events["_ListBox"] := this.ListBox.Bind(this)

        ; properties
        this.Options("+LabelselectGui_")

        ; controls
        this.Add("text", "w250 r1", "Search")
        this.Add("edit", "w250 r1 gselectGui_EditHandler", "")
        this.Add("text", "w250 r1", "Select")
        this.Add("ListBox", "w250 r10 gselectGui_ListBoxHandler", settings.mobs)
        this.Add("Button", "w165 section r1 gselectGui_BtnHandler", "Add")
        this.Add("Button", "x+5 w80 r1 gselectGui_BtnHandler", "Remove")
        this.Add("Button", "xs w250 r2 gselectGui_BtnHandler", "Log")
        
        ; hotkeys
        ; hotkey, IfWinActive, % this.ahkid
        ; hotkey, enter, selectGui_HotkeyEnter
        ; hotkey, IfWinActive

        ; show
        this.Refresh()
        this.Show()
        DetectHiddenWindows, Off
        WinWaitClose, % this.ahkid
    }

    LogMob() {
        dropTable.Download(wiki.Get(StrReplace(settings.selectedMob, A_Space, "_")))
        this.Hide()
    }

    AddMob() {
        ; convert user input to wiki formatting. lower case except first letter
        InputBox, input, Add mob, , , 250, 110, X, Y
        StringLower, input, input
        firstLetter := SubStr(input, 1, 1)
        StringUpper, firstLetter, firstLetter
        input := firstLetter SubStr(input, 2)

        wikiInput := StrReplace(input, A_Space, "_") ; wiki urls use underscores for spaces

        ; check if input has a wiki page with drop tables
        If !(dropTable.Download(wikiInput)) {
            msgbox, 4160, , % A_ThisFunc ": Could not find drop tables on 'https://oldschool.runescape.wiki/w/" wikiInput "'!"
            return
        }
        
        ; store sucessfully added mob
        If !(IsObject(settings.mobs))
            settings.mobs := {}
        For k, v in settings.mobs
            If (v = input)
                alreadyAdded := true
        If !(alreadyAdded)
            settings.mobs.push(input)
        settings.selectedMob := input

        this.Refresh()
    }

    ListBox() {
        this.SetDefault() ; set gui as default for GuiControlGet
        GuiControlGet, OutputVar,, ListBox1
        settings.selectedMob := OutputVar

        If (A_GuiEvent = "DoubleClick")
            this.LogMob()
    }

    RemoveMob() {
        For k, v in settings.mobs {
            If (v = settings.selectedMob) {
                settings.mobs.RemoveAt(k)
                break
            }
        }
        settings.selectedMob := ""
        this.Refresh()
    }

    Refresh() {
        this.SetDefault() ; set gui as default for GuiControl
        
        searchString := this.GetText() ; get user input

        ; populate listbox
        loop % settings.mobs.length() {
            If (searchString) and !(InStr(settings.mobs[A_Index], searchString)) {
                GuiControl,, ListBox1, | ; clear list box
                continue
            }
            output .= "|" settings.mobs[A_Index]
        }
        GuiControl,, ListBox1, % output

        ; target selected mob
        If (settings.selectedMob)
            GuiControl, ChooseString, ListBox1, % settings.selectedMob
    }

    Close() {
        exitapp
    }
}

selectGui_Close:
    ; call the class's method
    for a, b in class_gui_select.Instances 
		if (a = A_Gui+0)
			b["Events"]["_BtnClose"].Call()
return

selectGui_HotkeyEnter:
    ControlGetFocus, OutputVar, % selectGui.ahkid
    If !(OutputVar = "Edit1")
        return
    
    ; call the class's method
    for a, b in class_gui_select.Instances 
		if (a = WinExist("A")+0) ; if instance gui hwnd is identical to currently active window hwnd
			b["Events"]["_BtnLog"].Call()
return

selectGui_EditHandler:
    ; call the class's method
    for a, b in class_gui_select.Instances 
		if (a = A_Gui+0)
			b["Events"]["_BtnRefresh"].Call()
return

selectGui_ListBoxHandler:
    ; call the class's method
    for a, b in class_gui_select.Instances 
		if (a = A_Gui+0)
			b["Events"]["_ListBox"].Call()
return

selectGui_BtnHandler:
    ; get active button text without spaces
    ControlGetFocus, OutputControl, A
    ControlGetText, OutputControlText, % OutputControl, A
    OutputControlText := StrReplace(OutputControlText, A_Space)

    ; call the class's method
    for a, b in class_gui_select.Instances 
		if (a = A_Gui+0)
			b["Events"]["_Btn" OutputControlText].Call()
return