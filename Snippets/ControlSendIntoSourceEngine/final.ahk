#SingleInstance, force

; https://www.autohotkey.com/boards/viewtopic.php?f=5&t=26615

WinGet, hWnd, ID, ahk_class Valve001
ControlGetFocus, vCtlClassNN, % "ahk_id " hWnd
if !(vCtlClassNN = "")
	ControlGet, hWnd, Hwnd,, % vCtlClassNN, % "ahk_id " hWnd

; SendMessage, 0x100, 0x11, 0x001D0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
; SendMessage, 0x100, 0x10, 0x002A0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
; SendMessage, 0x100, 0x25, 0x014B0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
; Sleep, 200
; SendMessage, 0x101, 0x25, 0xC14B0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101
; SendMessage, 0x101, 0x11, 0xC01D0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101
; SendMessage, 0x101, 0x10, 0xC02A0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101

KEY_SCANCODE := "44"
WM_KEYDOWN_MSG := "0x00" KEY_SCANCODE "0001"	; eg: 0x001e0001
WM_KEYUP_MSG := "0x20" KEY_SCANCODE "0001"		; eg; 0x201e0001

SendMessage, 0x100, , WM_KEYDOWN_MSG,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
Sleep, 200
SendMessage, 0x101, , WM_KEYUP_MSG,, % "ahk_id " hWnd ;WM_KEYUP := 0x101

tooltip sent
sleep 250
tooltip
return


/*
	Sources
		AHK OnMessage
			https://www.autohotkey.com/docs/commands/PostMessage.htm

		Windows Scan Codes
			https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html

		Microsoft WM_KEYDOWN message
			https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-keydown

		Microsoft Virtual-key codes
			https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes

*/

~^s::reload