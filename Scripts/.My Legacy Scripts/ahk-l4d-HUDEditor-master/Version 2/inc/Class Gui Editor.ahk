Class ClassGuiEditor extends gui {
    Get() {
        If this.IsCreated {
            this.Show()
            return
        }

        LoadEditorMenu()
        
        ; properties
        this.SetIcon(APP_ICON)
        this.Margin(0, -1)
        this.Options("-Border")
        If TEXT_EDITOR_INFO.hwnd
            this.Owner(TEXT_EDITOR_INFO.hwnd)
        else
            this.Options("+AlwaysOnTop")
        
        ; controls
        margin := 5
        largeBtnW := 70
        largeBtnH := 22
        smallBtnW := 20
        smallBtnH := largeBtn
        
        this.add("picture", "w" largeBtnH A_Space "h" largeBtnH A_Space "", DIR_ICONS "\paintbrush.png", this.dragGui.bind(this)) ; title pic
        ; this.add("text", "w" largeBtnW A_Space "h" largeBtnH A_Space "border -wrap 0x200 Center", APP_NAME, this.testMethod.bind(this)) ; title border

        _btnFile := this.add("button", "x+" margin A_Space "w" largeBtnW A_Space "h" largeBtnH, "File", this.btnFile.bind(this))
        GuiButtonIcon(_btnFile, DIR_ICONS "\file.png", 1, "s12 a0 l2 r0")

        _btnDebug := this.add("button", "x+" margin A_Space "w" largeBtnW A_Space "h" largeBtnH, "Debug", this.btnDebug.bind(this))
        GuiButtonIcon(_btnDebug, DIR_ICONS "\debug.png", 1, "s12 a0 l2 r0")

        _btnSettings := this.add("button", "x+" margin A_Space "w" largeBtnW A_Space "h" largeBtnH, "Settings", this.btnSettings.bind(this))
        GuiButtonIcon(_btnSettings, DIR_ICONS "\settings_cog.png", 1, "s12 a0 l2 r0")

        ; _btnMinimize := this.add("button", "x+" margin A_Space "w" smallBtnW A_Space "h" smallBtnH, "", this.btnMinimize.bind(this))
        ; GuiButtonIcon(_btnMinimize, DIR_ICONS "\minus.png", 1, "s12 a4")

        ; _btnClose := this.add("button", "x+" margin A_Space "w" smallBtnW A_Space "h" smallBtnH, "", this.Close.bind(this))
        ; GuiButtonIcon(_btnClose, DIR_ICONS "\cross.png", 1, "s12 a4")

        ; this.Menu("MyMenuBar")

        ; show
        this.Show("hide")

        If SAVED_SETTINGS.editorGuiPos {
            pos := StrSplit(SAVED_SETTINGS.editorGuiPos, ",")
            xPos := pos[1], yPos := pos[2]
        } else {
            ; top center
            WinGetPos, guiX, guiY, guiW, guiH, % this.ahkid
            xPos := (A_ScreenWidth/2)-(guiW/2), yPos := 0
        }
        this.show("x" xPos A_Space "y" yPos A_Space "NoActivate")

        If WinExist(TEXT_EDITOR_INFO.ahkid)
            this.Show() ; bring to front
    }

    dragGui() {
        PostMessage, 0xA1, 2,,, A
    }

    btnFile() {
        ShowMenuBelowButton("File")
    }

    btnDebug() {
        ShowMenuBelowButton("Debug")
    }

    btnSettings() {
        ShowMenuBelowButton("Settings")
    }

    btnMinimize() {
        WinMinimize, % this.ahkid
    }

    SavePos() {
        ; get position
        WinGetPos, guiX, guiY, guiW, guiH, % this.ahkid
        If !guiX and (guiX != 0)
            return

        ; check off-screen
        If (guiX < 0) ; offscreen-left
            guiX := 0
        If (guiY < 0) ; offscreen-top
            guiY := 0
        If (guiX + guiW > A_ScreenWidth) ; offscreen-right
            guiX := A_ScreenWidth - guiW
        If (guiY + guiH > A_ScreenHeight) ; offscreen-bottom
            guiY := A_ScreenHeight - guiH

        ; save position
        SAVED_SETTINGS.editorGuiPos := guiX "," guiY
    }

    Escape() { ; overwrite behaviour for 'gui' class

    }

    Close() {
        exitapp
    }
}

ShowMenuBelowButton(menu) {
    MouseGetPos , mouseX, mouseY, _win, _control, 2

    ControlGetPos, cX, cY, cW, cH,, ahk_id %_control%
    menuX := cX + 1
    menuY := cY + cH - 1

    Menu, % menu, Show, % menuX, % menuY
}

LoadEditorMenu() {
    #Include %A_ScriptDir%\inc\Editor Menu.ahk
}