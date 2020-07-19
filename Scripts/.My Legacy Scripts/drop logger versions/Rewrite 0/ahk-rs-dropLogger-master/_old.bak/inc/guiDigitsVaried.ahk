/*
	Parameters
		input =		simple array with strings to be read into buttons
		x =			coordinate for showing gui
		y =			coordinate for showing gui
	
	Returns
		selected button string
*/
guiDigitsVaried(input, x, y) {
	DetectHiddenWindows, On 
	
	margin := 0
	btnW := 50
	btnH := 50
	rowLength := 4
	
	; properties
	Gui digitsVaried: New
	Gui digitsVaried: +LastFound
	gui digitsVaried: +LabelguiDigits_ +Hwnd_guiDigits +AlwaysOnTop
	gui digitsVaried: -border
	gui digitsVaried: margin, % margin, % margin
	
	; controls
	count := ""
	loop, % input.length()
	{
		If (A_Index = 1) { ; first row first entry
			gui digitsVaried: add, button, % "section w" btnW " h" btnH " gguiDigits_buttonHandler", % input[A_Index]
			count++ ; avoid triggering "first entry of new row"
			; msgbox first row first entry
		}
		else If (count = 1) { ; first entry of new row
			gui digitsVaried: add, button, % "section w" btnW " h" btnH " xs ys+" btnH + margin - 1 " gguiDigits_buttonHandler", % input[A_Index]
			; msgbox first entry of new row
		}
		else If (count = rowLength) { ; last entry of row
			count := 0
			gui digitsVaried: add, button, % " w" btnW " h" btnH " x+" margin - 1 " gguiDigits_buttonHandler", % input[A_Index]
			; msgbox last entry of row
		}
		else
			gui digitsVaried: add, button, % " w" btnW " h" btnH " x+" margin - 1 " gguiDigits_buttonHandler", % input[A_Index]
		
		count++
	}
		
	; show
	gui digitsVaried: show, hide, % AppName " Digits Varied Inputbox" ; create gui hidden to read info
	WinWait, % AppName " Digits Varied Inputbox" ; wait till gui is fully created
	WinGetPos, , , w, h, % AppName " Digits Varied Inputbox" ; read data for calculating gui position
	gui digitsVaried: show, % " x" x - (w/2) " y" y - (h/2), % AppName " Digits Varied Inputbox" ; show & move gui into pos
	
	SetTimer, guiDigits_hasFocusTimer, 10
	
	; close
	WinWaitClose, % AppName " Digits Varied Inputbox"
	return output

	guiDigits_buttonHandler:
		output := A_GuiControl
		Gosub guiDigits_close
	return
	
	guiDigits_hasFocusTimer:
		WinGetActiveTitle, activeWindow
		If !(activeWindow = AppName " Digits Varied Inputbox")
			Gosub guiDigits_close
	return
	
	guiDigits_close:
		SetTimer, guiDigits_hasFocusTimer, off
		gui digitsVaried: destroy
	return
}
