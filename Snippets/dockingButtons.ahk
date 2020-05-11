; https://autohotkey.com/board/topic/17877-titlebutton-031/
; https://autohotkey.com/board/topic/17850-module-dock-10-%C2%A0%C2%A0%C2%A0%C2%A0%C2%A0%C2%A0-testing-20-b3/://autohotkey.com/board/topic/17850-module-dock-10-%C2%A0%C2%A0%C2%A0%C2%A0%C2%A0%C2%A0-testing-20-b3/page-6?&#entry150058
SetBatchLines, -1
#SingleInstance, force
#NoEnv
Dock_include=IEFrame,MozillaUIWindowClass,MozillaUIWindowClass1,AIM_CSignOnWnd,SunAwtFrame	    ;this defines the ahk_class's that the gui will dock to unless excluded by title below.
Dock_Exclude_Title=Replace,Options,Downloads,Run,Confirm,Do you want Firefox to remember this password?,Windows Task Manager      ;use this to define window titles that you don't want to have the icon displayed.
32770_Include=Authentication Required     ;this is for Mozilla popup logins

Button:
	Gui +LastFound -Caption +ToolWindow ;+Border
	gui 1: Add, Picture, Icon1 w32 h32 x0 y0 +0x8000 gOnClick, %A_ScriptDir%\%MyTitle%.exe 

	gui 1: Color, 0xFF
	WinSet, TransColor, 0xFF
	gui 1: show, NoActivate, KeyGui

	Dock_c1 := WinExist()
	Dock_OnHostDeath := "OnHostDeath"
	Dock(Dock_c1)
return

OnClick:
	MsgBox, Put Code here to run on left click.
return


GuiContextMenu:
      Msgbox, put code here to run when on right click.
return



Dock(pClientID) {
	static init=0, idDel
	hw_ahk := WinExist("ahk_pid " DllCall("GetCurrentProcessId"))
	DllCall( "Wtsapi32.dll\WTSRegisterSessionNotification", "uint", hw_ahk, "uint", NOTIFY_FOR_ALL_SESSIONS )
	If !(init++) {
		SetWinDelay, -1																;this is must currently
		Dock_HostDied := Dock_aClient[0] := 0

		Dock_hookProcAdr := RegisterCallback("Dock_HookProc", "F" )
		Dock_hHook1 := API_SetWinEventHook(3,3,0,Dock_hookProcAdr,0,0,0)			; EVENT_SYSTEM_FOREGROUND
		Dock_hHook2 := API_SetWinEventHook(0x800B,0x800B,0,Dock_hookProcAdr,0,0,0)		; EVENT_OBJECT_LOCATIONCHANGE

		if !(Dock_hHook1 && Dock_hHook2) {
			API_UnhookWinEvent(Dock_hHook1), API_UnhookWinEvent(Dock_hHook2)
			return "Hook failed"
		}
	}	
	GoSub, ClassCheck
	return "OK"	
}



Dock_HookProc(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime ) {
	GoSub, ClassCheck
}


Dock_ShutDown() {
	global
	API_UnhookWinEvent(Dock_hHook1), API_UnhookWinEvent(Dock_hHook2)
	DllCall("GlobalFree", "UInt", Dock_hookProcAdr)
}


API_SetWinEventHook(eventMin, eventMax, hmodWinEventProc, lpfnWinEventProc, idProcess, idThread, dwFlags) {
	DllCall("CoInitialize", "uint", 0)
	return DllCall("SetWinEventHook", "uint", eventMin, "uint", eventMax, "uint", hmodWinEventProc, "uint", lpfnWinEventProc, "uint", idProcess, "uint", idThread, "uint", dwFlags)
}

API_UnhookWinEvent( hWinEventHook ) {
	return DllCall("UnhookWinEvent", "uint", hWinEventHook) 
}



ClassCheck:
Class_HostID := WinExist("A")
WinGetClass, Dock_cls, ahk_id %Class_HostID%
WinGetPos hX, hY, hW, hH, ahk_id %Class_HostID%
WinGetTitle, Dock_Title,  ahk_id %Class_HostID%
If Dock_cls = #32770
{
	If Dock_Title in %32770_Include%
	{
	gui 1: show, noactivate, KeyGui
	GoSub, MoveGui
	return
	}
	Else
	{
	gui 1: hide
	}
return
}

If Dock_cls in %Dock_include% 
	{
	If Dock_Title in %Dock_Exclude_Title% 
		{
		gui 1: Hide
		return
		}
	GoSub, MoveGui
	}
Else
	gui 1: hide
return




MoveGui:
	IfWinNotExist, KeyGui
		gui 1: show, noactivate, KeyGui

	cId := WinExist("KeyGui")
	WinSet AlwaysOnTop, On,  ahk_id %cId%

	Dock_HostID := WinExist("A")
	WinGetPos hX, hY, hW, hH, ahk_id %Dock_HostID%

	W := 32,  H := 20
	X := hX + hW - 110
	Y := hY + 3

	if cId != %Dock_HostID%
		WinMove ahk_id %cId%,,X,Y,W,H

	WinSet AlwaysOnTop, On,  ahk_id %cId%
return