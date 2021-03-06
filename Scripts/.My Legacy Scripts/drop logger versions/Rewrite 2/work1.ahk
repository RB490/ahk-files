; https://oldschool.runescape.wiki/api.php

#SingleInstance, force
OnMessage(0x200, "WM_MOUSEMOVE") ; WM_MOUSEMOVE
OnMessage(0x201, "WM_LBUTTONDOWN") ; WM_LBUTTONDOWN

global g_mob							; logging this mob
global db_Mob := new class_db_Mob		; mob database
global dropLog := new class_dropLog		; droplog class
global dropLog2 := new class_dropLog2	; droplog class

g_mob := "Zulrah"

;~ thisObj200 := {}
;~ backupObj200 := {}
;~ backupObj200.push(thisObj200.clone())
;~ thisObj200.push("yeah")
;~ backupObj200.push(thisObj200.clone())
;~ thisObj200.push("yeah")
;~ backupObj200.push(thisObj200.clone())
;~ thisObj200.push("yeah")
;~ backupObj200.push(thisObj200.clone())
;~ msgbox % json.dump(backupObj200,,2)


guiDropLog("Vorkath")

/*
dropLog.StartTrip()
dropLog.AddDrop("abyssal whip", 1)
dropLog.AddDrop("abyssal whip", 1)
dropLog.AddKill()
dropLog.EndTrip()

dropLog.StartTrip()
dropLog.AddDrop("abyssal whip", 1)
dropLog.AddDrop("abyssal whip", 1)
dropLog.AddKill()
dropLog.AddDrop("abyssal whip", 1)
dropLog.AddDrop("abyssal whip", 1)
dropLog.AddKill()
dropLog.EndTrip()

msgbox % dropLog.isTripStarted()
*/

;~ msgbox end of script
return

WM_MOUSEMOVE() {
	getGuiDropLogImgInfo(item, quantity)
	If !(item) or !(quantity) {
		tooltip
		return
	}
	
	;~ tooltip % item " : " quantity
	sleep 15 ; avoids tooltip flickering effect
}

WM_LBUTTONDOWN() {
	getGuiDropLogImgInfo(item, quantity)
	If !(item) or !(quantity) {
		tooltip
		return
	}
	
	If !(dropLog2.isTripStarted()) {
		tooltip No trip started!
		return
	}
	
	;~ tooltip % item " : " quantity
	
	dropLog2.addSelectedDrop(item, quantity)
	guiDropLog("update") ; add selected drop to gui
}

getGuiDropLogImgInfo(ByRef item, ByRef quantity) {
	MouseGetPos, OutputVarX, OutputVarY, _OutputVarWin, OutputVarControl
	If !InStr(OutputVarControl, "Static") ; ignore everything that is not a drop image control
		return
	GuiControlGet OutputVarV, guiDropLog:Name, %OutputVarControl%
	OutputVarV := convertChars("decrypt", OutputVarV)
	item := SubStr(OutputVarV, 1, InStr(OutputVarV, "#") - 1)
	quantity := SubStr(OutputVarV, InStr(OutputVarV, "#") + 1)
	return
}

~^s::reload

#Include <JSON>
#Include %A_ScriptDir%\inc
#Include functions.ahk
#Include class_db_mob.ahk
#Include class_dropLog.ahk
#Include class_dropLog2.ahk
#Include guiDropLog.ahk