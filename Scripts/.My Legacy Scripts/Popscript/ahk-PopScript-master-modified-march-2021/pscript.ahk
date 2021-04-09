; populous rebinds, use in combination with populous key mapper alpha 0.2

#Persistent
#SingleInstance, force

; gExe := "ahk_exe popTB.exe"
; IfWinExist, ahk_exe D3DPopTB.exe
	; gClass := "ahk_class DDS_Class"
; else
	gClass := "ahk_class _Bullfrog4194304"

; gClass := "ahk_class DDS_Class"
	
#Include %A_ScriptDir%\lib
#Include <_Struct>
#Include <sizeof>

hotkey, IfWinActive, % gClass
hotkey, *q, worldMap
hotkey, *f, cameraShaman
hotkey, *v, cameraSpawn
hotkey, *r, menuFollowers
hotkey, *e, menuBuildings

hotkey, ~*tab, menuScores
; hotkey, *t, toggleChat

gosub InitStruct

return ; ----------------end-autoexec
#Include %A_ScriptDir%\inc
#Include res.ahk

#IfWinActive ahk_class _Bullfrog4194304
w::Up
a::Left
s::Down
d::Right

Up::w
Left::a
Down::s
Right::d

backspace::space

LWin::return
RWin::return
#IfWinActive

#IfWinNotActive ahk_class _Bullfrog4194304
~^s::reload
#IfWinNotActive

f9::ChangeDisplaySettings( (ClrDep:=32) , (Wid:=1920) , (Hei:=1080) , (Hz:=120) )
f10::ChangeDisplaySettings( (ClrDep:=32) , (Wid:=1024) , (Hei:=768) , (Hz:=120) )

; break::
; 	if Suspend, on
; 	{
; 		SoundBeep, 1000, 150
; 		Return
; 	}
; 	else
; 	{
; 		SoundBeep, 250, 150
; 		Suspend, on
; 		Keywait, break, D
; 		Keywait, break
; 		Suspend, off
; 		SoundBeep, 750, 150
; 	}
; return

; ----------------labels

menuScores:
	; Send {f2}
	Send s
return

cameraSpawn:
	Send h
return

cameraShaman:
	Send .
return

menuFollowers:
	; SoundBeep, 1500, 150
	Send {pgup}
return

menuBuildings:
	; SoundBeep, 1000, 150
	Send {insert}
return

menuSpells:
	Send {home}
return

worldMap:
	send {RShift Down}{Enter}{RShift Up}
return

toggleChat:
	Send {t}
	if Suspend, on
		Return
	else
	{
		Suspend, on
		Keywait, Enter, D
		Keywait, Enter
		Suspend, off
	}
return

