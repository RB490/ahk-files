; example dock with Relative position
#NoEnv
#SingleInstance, force
SetTitleMatchMode, 2

FormatTime, TimeString, , HH:mm:ss
; WinGet, _notepad, ID, ahk_exe notepad.exe
WinGet, _notepad, ID, ahk_exe code.exe
; Run, notepad.exe
; sleep 100
; WinGet, HostHwnd, ID, ahk_exe notepad.exe

; clock gui
Gui, +hwndClienthwnd ;  +ToolWindow +AlwaysOnTop -SysMenu +E0x08000000
Gui, +AlwaysOnTop ; use this to remove the tooltip top!
Gui, -Caption ; use this to remove the tooltip top!
; Gui, Color, CCCCCC
Gui, Add, Picture, x3 y0 icon44 w16, shell32.dll
; Gui, Font, cFFFFFF s6 wbold, terminal
Gui, Add, Text, vTxtCurrentTime  xp+20 y2, %TimeString% 
Gui, Add, Button, x+5 , Yeah boi
Gui, Add, Button, x+5 , Yeah boi
Gui, Add, Button, x+5 , Yeah boi

; Instance := new Dock(Host hwnd, Client hwnd, [Callback], [CloseCallback])
Instance := new Dock(_notepad, Clienthwnd)
Instance.CloseCallback := Func("CloseCallback")

Gui, Show, AutoSize NoActivate h30 w240
WinSet, TransColor, CCCCCC 255, ahk_class AutoHotkeyGUI
Instance.Position("Relative 0 -30")
; Instance.Position("Top -25")
SetTimer, AdjustTime, 500
Return

CloseCallback(self)
{
	WinKill, % "ahk_id " self.hwnd.Client
	ExitApp
}


Esc::
GuiClose:
Gui, Destroy
ExitApp

AdjustTime:
FormatTime, TimeString, , HH:mm:ss
GuiControl, , TxtCurrentTime, %TimeString%
return

~^s::reload

f1::
	WinActivate, % "ahk_id " _notepad
	; WinActivate, % "ahk_id " Clienthwnd
return

#include Dock.ahk