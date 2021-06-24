Class ClassGuiToolModifyAllIntegerKeys extends gui {
    Get() {
        ; set icon
        icoPath := DIR_ICONS "\modifyIntegers.ico"
        this.SetIcon(icoPath)

        ; properties
        this.Options("-minimizebox")

        ; controls
        this._dropdownIntegerKey := this.Add("DropDownList", "w125", "visible|enabled|xpos|ypos||wide|tall")
        this._editInteger := this.Add("Edit", "w125", "")
        this.Add("UpDown", "w125 Range-1000-1000", "")
        this.Add("Button", "w125", "Copy", this.btnCopy.bind(this))
        
        ; show
        this.Show("")
    }

    btnCopy() {
        ; write clipboard to temp file
        tempFile := A_Temp "\" A_TickCount A_Now ".res"
        FileAppend, % clipboard, % tempFile

        ; receive user input
        modifyKey := this.GetText(this._dropdownIntegerKey)
        modifyAmount := this.GetText(this._editInteger)

        ; check valid input
        If modifyAmount is not Integer
        {
            Msg("Info", A_ThisFunc, "Invalid integer: " modifyAmount)
            return
        }

        ; retrieve modified file
        str := new ClassParseVdf(tempFile).ModifyIntegerKeys(modifyKey, modifyAmount)
        FileDelete, % tempFile
        If !str {
            Msg("Info", A_ThisFunc, "Clipboard does not contain valid VDF file!")
            return
        }

        ; copy output
        clipboard := str
        tooltip done!
        SetTimer, hideTooltip, -300
    }
}