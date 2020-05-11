#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetBatchLines -1
Menu, Tray, Icon, % A_ScriptDir "\res\img\launcher.ico"
#Include <JSON>
OnExit, ExitRoutine

hHook := EWinHook_SetWinEventHook("EVENT_MIN", "EVENT_SYSTEM_MOVESIZESTART", 0, "move", 0, 0, "WINEVENT_OUTOFCONTEXT")

global settings	:= []									; settings obj
global settingsFile	:= A_ScriptDir "\settings.json"		; settings file
global client := []										; rs client wrapper object
global clientWrapper := []								; rs client wrapper object
global guiInstances := []								; used by classes to detect which gui instance triggered a label
global debugMode := 1									; toggle debug options

FileRead, settingsFileContents, % settingsFile
If (settingsFileContents)
	settings := JSON.Load(settingsFileContents)
	
client := new class_client
wrapper := new class_wrapper

If !(debugMode)  {
	WinWaitClose, % client.hwnd
	exitapp
}
return

ExitRoutine:
	Gosub writeSettings
	EWinHook_UnhookWinEvent(hHook)
exitapp

writeSettings:
	getPos(client)
	settings := []
	settings["pos", "client", "x"] := client.x
	settings["pos", "client", "y"] := client.y
	settings["pos", "client", "w"] := client.w
	settings["pos", "client", "h"] := client.h
	FileDelete, % settingsFile
	FileAppend, % json.dump(settings,,2), % settingsFile
return

menuHandler:
return

move(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime) {
	_hwnd := "ahk_id " WinExist("ahk_id " hwnd) ; convert event hwnd to ahk hwnd
	
	If (WinActive(client.hwnd)) { ; moving client
		If (event = 10) {
			s := "Moving started"
			
			SetTimer, positionWrapper, 10
		}
		else if (event = 11) {
			s := "Moving stopped"
			
			SetTimer, positionWrapper, Off
		}
	}
	
	If (clientWrapper.hwnd = _hwnd) { ; moving wrapper
		If (event = 10) {
			s := "Moving started"
			
			SetTimer, positionClient, 10
		}
		else if (event = 11) {
			s := "Moving stopped"
			
			SetTimer, positionClient, Off
		}
	}
}

class class_wrapper {
	__New() {
		getPos(client)
		
		Gui, New, +Hwnd_HWND
		this.hwnd := _HWND
		guiInstances[_HWND] := this
		this.Events := []
		this.Events["Close"] := this.Close.Bind(this)
		this.Events["Size"] := this.Size.Bind(this)
		this.Events["ContextMenu"] := this.Size.Bind(this)
		
		_WIN := WinExist(client.hwnd)
		Gui % this.hwnd ":+owner" _WIN
		Gui % this.hwnd ":Show", % "x" client.x + 5 " y" client.y - 19 " w" client.w " h0", % client.title
		
		clientWrapper["hwnd"] := "ahk_id " this.hwnd
	}
	
	Close() {
		msgbox, 68, % A_ScriptName, Are you sure you want to exit the program?
		IfMsgBox, No
			return
		exitapp
	}
	
	__Delete() {
		this.Events := ""
		Gui % this.hwnd ":Destroy"
	}
	
	Size() {
		WinGet, minOrMax, MinMax, % "ahk_id " this.hwnd
		If (minOrMax = "-1")
			WinMinimize, % client.hwnd
	}
	
	GuiContextMenu() {
		msgbox % A_ThisLabel
	}
	
	Move() {
		getPos(client)
		WinMove, % clientWrapper.hwnd, , % client.x + 5, % client.y - 19, % client.w + 6
	}
}

class class_client {
	__New() {
		WinGet, PID, PID, ahk_exe jagexlauncher.exe

		If (debugMode) and !(PID)
			run, % A_ScriptDir "\res\client\bin\jagexlauncher.exe oldschool", , , PID
		
		If !(debugMode)
			run, % A_ScriptDir "\res\client\bin\jagexlauncher.exe oldschool", , , PID
		
		this.pid := PID
		
		loop, {
			WinGetClass, class, % "ahk_pid " this.pid
			sleep 250
			If (A_Index = 100) { ; 25 seconds
				msgbox %A_ThisFunc%: Client did not start correctly.`n`nClosing..
				exitapp
			}
		} until (class = "SunAwtFrame")
		
		WinGet, _CLIENT, ID, % "ahk_pid " this.pid
		this.hwnd := "ahk_id " _CLIENT
		WinGetTitle, title, % this.hwnd
		this.title := title
		
		; WinSet, Style, -0xC00000, % this.hwnd ; make window borderless
		; WinSet, Style, +0x40000, % this.hwnd ; make window unresizable
		; WinSet, Style, +0x80000, % this.hwnd ; removes title bar icon & buttons
		WinSet, Style, -0x400000, % this.hwnd 
		; WinMove, % this.hwnd, , , , 773, 533 ; unresizable
		; WinMove, % this.hwnd, , , , 783, 542 ; resizable
		
		client.x := settings["pos", "client", "x"]
		client.y := settings["pos", "client", "y"]
		client.w := settings["pos", "client", "w"]
		client.h := settings["pos", "client", "h"]
		
		If (client.x)
			WinMove, % this.hwnd, , % client.x, % client.y, % client.w, % client.h ; resizable
		else
			WinMove, % this.hwnd, , , , 782, 519 ; resizable
	}
	
	__Delete() {
		If (debugMode)
			return
		
		this.Events := ""
		process, close, % this.pid
	}
	
	Move() {
		getPos(clientWrapper)
		WinMove, % client.hwnd, , % clientWrapper.x - 5, % clientWrapper.y + 19
	}
}

GuiContextMenu:
GuiSize:
GuiClose:
	for a, b in guiInstances 
		if (a = A_Gui+0)
			b["Events"][SubStr(A_ThisLabel, 4)].Call()
return

getPos(object) {
	WinGetPos(WinExist(object.hwnd), x, y, w, h, 1)
	
	object["x"] := x
	object["y"] := y
	object["w"] := w
	object["h"] := h
}

positionClient:
	SetWinDelay -1
	client.move()
return

positionWrapper:
	SetWinDelay -1
	wrapper.move()
return

; ----------------------------------------------------------------------------------------------------------------------
; Name .........: EWinHook library
; Description ..: Implement the SetWinEventHook Win32 API
; AHK Version ..: AHK_L 1.1.13.01 x32 Unicode
; Author .......: Cyruz - http://ciroprincipe.info
; License ......: WTFPL - http://www.wtfpl.net/txt/copying/
; Changelog ....: Nov. 20, 2013 - v0.1 - First revision
; ----------------------------------------------------------------------------------------------------------------------

; ----------------------------------------------------------------------------------------------------------------------
; Function .....: EWinHook_SetWinEventHook
; Description ..: Sets an event hook function for a range of events.
; Parameters ...: eventMin         - Lowest event constant to handle. Pass the name as a string (eg: "EVENT_MIN").
; ..............: eventMax         - Highest event constant to handle. Pass the name as a string (eg: "EVENT_MAX").
; ..............: hmodWinEventProc - Handle to the DLL containing the hook function at lpfnWinEventProc or NULL.
; ..............: lpfnWinEventProc - Name or pointer to the hook function. Must be a WinEventProc callback function.
; ..............: idProcess        - PID from which the hook will receive events or 0 for all desktop process.
; ..............: idThread         - Thread ID from which the hook will receive events or 0 for all desktop threads.
; ..............: dwflags          - Flag values specifying hook location and events to skip. Specify the value or
; ..............:                    the combination of values as a string. The accepted values are:
; ..............:                    "WINEVENT_INCONTEXT"
; ..............:                    "WINEVENT_INCONTEXT | WINEVENT_SKIPOWNPROCESS"
; ..............:                    "WINEVENT_INCONTEXT | WINEVENT_SKIPOWNTHREAD"
; ..............:                    "WINEVENT_OUTOFCONTEXT"
; ..............:                    "WINEVENT_OUTOFCONTEXT | WINEVENT_SKIPOWNPROCESS"
; ..............:                    "WINEVENT_OUTOFCONTEXT | WINEVENT_SKIPOWNTHREAD"
; Return .......: -1               - CoInitialize error. Check A_LastError error code:
; ..............:                    E_INVALIDARG  = 0x80070057
; ..............:                    E_OUTOFMEMORY = 0x8007000E
; ..............:                    E_UNEXPECTED  = 0x8000FFFF
; ..............: 0                - Parameters or SetWinEventHook error.
; ..............: HWINEVENTHOOK    - Value identifying the event hook instance.
; Remarks ......: Remember to create a WinEventProc callback function to take care of all the messages.
; ..............: A_LastError is set also in case of success of CoInitialize.
; ..............: The possible success values are: S_OK               = 0x00000000
; ..............:                                  S_FALSE            = 0x00000001
; ..............:                                  RPC_E_CHANGED_MODE = 0x80010106
; Info .........: CoInitialize     - http://goo.gl/UhCKNo
; ..............: SetWinEventHook  - http://goo.gl/DosZa9
; ..............: WinEventProc     - http://goo.gl/wUZU08
; ----------------------------------------------------------------------------------------------------------------------
EWinHook_SetWinEventHook(eventMin, eventMax, hmodWinEventProc, lpfnWinEventProc, idProcess, idThread, dwflags) {
    Static S_OK                              := 0x00000000, S_FALSE                           := 0x00000001
         , RPC_E_CHANGED_MODE                := 0x80010106, E_INVALIDARG                      := 0x80070057
         , E_OUTOFMEMORY                     := 0x8007000E, E_UNEXPECTED                      := 0x8000FFFF
         , EVENT_MIN                         := 0x00000001, EVENT_MAX                         := 0x7FFFFFFF
         , EVENT_SYSTEM_SOUND                := 0x0001,     EVENT_SYSTEM_ALERT                := 0x0002
         , EVENT_SYSTEM_FOREGROUND           := 0x0003,     EVENT_SYSTEM_MENUSTART            := 0x0004
         , EVENT_SYSTEM_MENUEND              := 0x0005,     EVENT_SYSTEM_MENUPOPUPSTART       := 0x0006
         , EVENT_SYSTEM_MENUPOPUPEND         := 0x0007,     EVENT_SYSTEM_CAPTURESTART         := 0x0008
         , EVENT_SYSTEM_CAPTUREEND           := 0x0009,     EVENT_SYSTEM_MOVESIZESTART        := 0x000A
         , EVENT_SYSTEM_MOVESIZEEND          := 0x000B,     EVENT_SYSTEM_CONTEXTHELPSTART     := 0x000C
         , EVENT_SYSTEM_CONTEXTHELPEND       := 0x000D,     EVENT_SYSTEM_DRAGDROPSTART        := 0x000E
         , EVENT_SYSTEM_DRAGDROPEND          := 0x000F,     EVENT_SYSTEM_DIALOGSTART          := 0x0010
         , EVENT_SYSTEM_DIALOGEND            := 0x0011,     EVENT_SYSTEM_SCROLLINGSTART       := 0x0012
         , EVENT_SYSTEM_SCROLLINGEND         := 0x0013,     EVENT_SYSTEM_SWITCHSTART          := 0x0014
         , EVENT_SYSTEM_SWITCHEND            := 0x0015,     EVENT_SYSTEM_MINIMIZESTART        := 0x0016
         , EVENT_SYSTEM_MINIMIZEEND          := 0x0017,     EVENT_SYSTEM_DESKTOPSWITCH        := 0x0020
         , EVENT_SYSTEM_END                  := 0x00FF,     EVENT_OEM_DEFINED_START           := 0x0101
         , EVENT_OEM_DEFINED_END             := 0x01FF,     EVENT_UIA_EVENTID_START           := 0x4E00
         , EVENT_UIA_EVENTID_END             := 0x4EFF,     EVENT_UIA_PROPID_START            := 0x7500
         , EVENT_UIA_PROPID_END              := 0x75FF,     EVENT_CONSOLE_CARET               := 0x4001
         , EVENT_CONSOLE_UPDATE_REGION       := 0x4002,     EVENT_CONSOLE_UPDATE_SIMPLE       := 0x4003
         , EVENT_CONSOLE_UPDATE_SCROLL       := 0x4004,     EVENT_CONSOLE_LAYOUT              := 0x4005
         , EVENT_CONSOLE_START_APPLICATION   := 0x4006,     EVENT_CONSOLE_END_APPLICATION     := 0x4007
         , EVENT_CONSOLE_END                 := 0x40FF,     EVENT_OBJECT_CREATE               := 0x8000
         , EVENT_OBJECT_DESTROY              := 0x8001,     EVENT_OBJECT_SHOW                 := 0x8002
         , EVENT_OBJECT_HIDE                 := 0x8003,     EVENT_OBJECT_REORDER              := 0x8004
         , EVENT_OBJECT_FOCUS                := 0x8005,     EVENT_OBJECT_SELECTION            := 0x8006
         , EVENT_OBJECT_SELECTIONADD         := 0x8007,     EVENT_OBJECT_SELECTIONREMOVE      := 0x8008
         , EVENT_OBJECT_SELECTIONWITHIN      := 0x8009,     EVENT_OBJECT_STATECHANGE          := 0x800A
         , EVENT_OBJECT_LOCATIONCHANGE       := 0x800B,     EVENT_OBJECT_NAMECHANGE           := 0x800C
         , EVENT_OBJECT_DESCRIPTIONCHANGE    := 0x800D,     EVENT_OBJECT_VALUECHANGE          := 0x800E
         , EVENT_OBJECT_PARENTCHANGE         := 0x800F,     EVENT_OBJECT_HELPCHANGE           := 0x8010
         , EVENT_OBJECT_DEFACTIONCHANGE      := 0x8011,     EVENT_OBJECT_ACCELERATORCHANGE    := 0x8012
         , EVENT_OBJECT_INVOKED              := 0x8013,     EVENT_OBJECT_TEXTSELECTIONCHANGED := 0x8014
         , EVENT_OBJECT_CONTENTSCROLLED      := 0x8015,     EVENT_SYSTEM_ARRANGMENTPREVIEW    := 0x8016
         , EVENT_OBJECT_END                  := 0x80FF,     EVENT_AIA_START                   := 0xA000
         , EVENT_AIA_END                     := 0xAFFF,     WINEVENT_OUTOFCONTEXT             := 0x0000
         , WINEVENT_SKIPOWNTHREAD            := 0x0001,     WINEVENT_SKIPOWNPROCESS           := 0x0002
         , WINEVENT_INCONTEXT                := 0x0004 

    ; eventMin/eventMax check
    If ( !%eventMin% || !%eventMax% )
        Return 0

    ; dwflags check
    If ( !RegExMatch( dwflags
                    , "S)^\s*(WINEVENT_(?:INCONTEXT|OUTOFCONTEXT))\s*\|\s*(WINEVENT_SKIPOWN(?:PROCESS|"
                    . "THREAD))[^\S\n\r]*$|^\s*(WINEVENT_(?:INCONTEXT|OUTOFCONTEXT))[^\S\n\r]*$"
                    , dwfArray ) )
        Return 0
    dwflags := (dwfArray1 && dwfArray2) ? %dwfArray1% | %dwfArray2% : %dwfArray3%
        
    nCheck := DllCall( "CoInitialize", Ptr,0       )
              DllCall( "SetLastError", UInt,nCheck ) ; SetLastError in case of success/error
              
    If ( nCheck == E_INVALIDARG || nCheck == E_OUTOFMEMORY ||  nCheck == E_UNEXPECTED )
        Return -1
    
    If ( isFunc(lpfnWinEventProc) )
        lpfnWinEventProc := RegisterCallback(lpfnWinEventProc)
        
    hWinEventHook := DllCall( "SetWinEventHook", UInt,%eventMin%, UInt,%eventMax%, Ptr,hmodWinEventProc
                                               , Ptr,lpfnWinEventProc, UInt,idProcess, UInt,idThread, UInt,dwflags )
    Return (hWinEventHook) ? hWinEventHook : 0
}

; ----------------------------------------------------------------------------------------------------------------------
; Function .....: EWinHook_UnhookWinEvent
; Description ..: Remove a previously istantiated hook.
; Parameters ...: hWinEventHook  - Handle to the event hook returned in the previous call to SetWinEventHook.
; Return .......: 1              - Success
; ..............: 0              - Error
; Info .........: UnhookWinEvent - http://goo.gl/9dDjE3
; ..............: CoUninitialize - http://goo.gl/bWYQ2a
; ----------------------------------------------------------------------------------------------------------------------
EWinHook_UnhookWinEvent(hWinEventHook) {
    nCheck := DllCall( "UnhookWinEvent", Ptr,hWinEventHook )
    DllCall( "CoUninitialize" )
    Return nCheck
}

~^s::reload