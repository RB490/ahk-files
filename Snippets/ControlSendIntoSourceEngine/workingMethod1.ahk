#SingleInstance, force

; https://www.autohotkey.com/boards/viewtopic.php?f=5&t=26615
f1:: ;send ctrl+shift+left without using Send/SendInput/ControlSend
    ;e.g. tested on Notepad (Windows 7)
    WinGet, hWnd, ID, ahk_class Valve001
ControlGetFocus, vCtlClassNN, % "ahk_id " hWnd
if !(vCtlClassNN = "")
	ControlGet, hWnd, Hwnd,, % vCtlClassNN, % "ahk_id " hWnd

SendMessage, 0x100, 0x11, 0x001D0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
SendMessage, 0x100, 0x10, 0x002A0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
SendMessage, 0x100, 0x25, 0x014B0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
Sleep, 200
SendMessage, 0x101, 0x25, 0xC14B0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101
SendMessage, 0x101, 0x11, 0xC01D0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101
SendMessage, 0x101, 0x10, 0xC02A0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101
return

~^s::reload