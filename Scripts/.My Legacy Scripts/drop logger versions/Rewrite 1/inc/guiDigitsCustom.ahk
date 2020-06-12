guiDigitsCustom(x, y, size) {
	DetectHiddenWindows, On
	
	size -= 4
	
	If !WinExist("Digit Inputbox")
	{
		; properties
		gui digitsCustom: margin, 1, 1
		gui digitsCustom: color, White
		gui digitsCustom: +LabelguiInputbox_ -caption +AlwaysOnTop
		
		; controls
		gui digitsCustom: font, s15 verdana
		
		gui digitsCustom: add, edit, % "y9 " " w" size " h" size " -VScroll -E0x200 0x200 Center Number"

		gui digitsCustom: font
	}
	ControlSetText, Edit1, , Digits Custom Inputbox
	
	DetectHiddenWindows, Off
	
	; show
	gui digitsCustom: show, % " x" x " y" y " w" size " h" size, Digits Custom Inputbox
	
	SetTimer, guiInputbox_hasFocusTimer, 10
	
	; hotkeys
	hotkey, IfWinActive, Digits Custom Inputbox
	hotkey, enter, guiInputbox_save
	hotkey, IfWinActive
	
	; close
	WinWaitClose, Digits Custom Inputbox
	return output
	
	guiInputbox_save:
		SetTimer, guiInputbox_hasFocusTimer, Off
		ControlGetText, output, Edit1, Digits Custom Inputbox
		gui digitsCustom: hide
	return
	
	guiInputbox_hasFocusTimer:
		WinGetActiveTitle, activeWindow
		If !(activeWindow = "Digits Custom Inputbox")
			Gosub guiInputbox_close
	return
	
	guiInputbox_escape:
	guiInputbox_close:
		SetTimer, guiInputbox_hasFocusTimer, Off
		output := ""
		gui digitsCustom: hide
	return
}