Class ClassGuiProgress extends gui {
    Get(title := "", bar1Text := "", bar1 := "", bar2Text := "", bar2 := "") {
        width := 350
        SplitPath, A_ScriptName, , , , scriptNameNoExt
        this.__New(scriptNameNoExt ":" A_Space title)
        this.margin(5, 5)
        this.Options("-MinimizeBox")

        If (bar1Text) {
            this.Font("s15")
            this._bar1Text := this.add("text", "w" width " center", bar1Text)
        }

        If (bar1)
            this._bar1 := this.add("progress", "w" width " h20 Range0-" bar1 " BackgroundWhite")

        If (bar2Text) {
            this.Font("s12")
            this._bar2Text := this.add("text", "w" width " center", bar2Text)
        }

        If (bar2)
            this._bar2 := this.add("progress", "w" width " h20 Range0-" bar2 " BackgroundWhite")

        this.Show()
    }

    B1T(bar1Text = "") {
        this.Control(, this._bar1Text, bar1Text)
        this.B1()
    }

    B1(input := "") {
        If input is Integer
        {
            this.Control(, this._bar1, "0")
            this.Control("+Range0-" input, this._bar1)
            return
        }

        this.Control(, this._bar1, "+1")
    }

    B2T(bar2Text = "") {
        this.Control(, this._bar2Text, bar2Text)
        this.B2()
    }

    B2(input := "") {
        If input is Integer
        {
            this.Control(, this._bar2, "0")
            this.Control("+Range0-" input, this._bar2)
            this.B2T()
            return
        }

        this.Control(, this._bar2, "+1")
    }

    Close() {
        Msg("InfoYesNo", A_ThisFunc, "Are you sure you want to quit?")
        IfMsgBox, No
            return true ; https://www.autohotkey.com/docs/commands/Gui.htm#GuiClose
        exitapp
    }
}