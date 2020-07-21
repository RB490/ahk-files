#NoEnv                          ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn                         ; Enable warnings to assist with detecting common errors.
SendMode Input                  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%     ; Ensures a consistent starting directory.

#SingleInstance Force

WinSet, Transparent , 125, ahk_exe notepad.exe
msgbox

Enabled := ComObjError(false)



GuiArray := Object()
Colors := ["0xD95319", "0xEDB120", "0x7E2F8E", "0x77AC30"]

return
#include %A_ScriptDir%\Dock.ahk
~^s::reload


; Ctrl+Shift+W
; Change background color of current window
^+w::
WinGet, id, ID, A
SetBackgroudColor(id)
return


SetBackgroudColor(CurrHwnd)
{
	global Colors, GuiArray

	WinGetTitle, CurrTitle, ahk_id %CurrHwnd%
	GuiName := "GUI" CurrHwnd+0

	if (GuiArray.HasKey(GuiName))
	{
		GuiArray[GuiName] := ""
		GuiArray.Delete(GuiName)
		Gui, %GuiName%:Destroy
		Return
	}

	Gui, %GuiName%:New, +hwndGuihwnd	
	Gui, %GuiName%:+ToolWindow
	Gui, %GuiName%:Color, % Colors[1]
	Colors.Push(Colors[1])
	Colors.RemoveAt(1)

	WinSet, Transparent, 0, % "ahk_id " Guihwnd
	Gui, %GuiName%:Show, xCenter yCenter, %CurrTitle%, class DockGui
	WinSet, Style, -0xC00000, % "ahk_id " Guihwnd

	exDock := new Dock(CurrHwnd,Guihwnd)
	exDock.Position("Title")
	exDock.CloseCallback := Func("CloseCallback").Bind(GuiName)
	GuiArray[GuiName] := exDock
	
	WinActivate, % "ahk_id " . CurrHwnd
	WinSet, Transparent, 255, % "ahk_id " . Guihwnd
	
	Return
}

CloseCallback(GuiName)
{
	Gui, %GuiName%:Destroy
}
