/*
	Purpose
		Take droplog object input as json string, calculate stats, return stats json object back to sender

*/
#SingleInstance, off
if (A_Args[1])
	Menu, Tray, NoIcon
#SingleInstance, force
#Persistent

global g_log					; log input
global g_logFile := A_Args[1]	; log file
global g_debug := 0				; debug mode
global itemIds					; item id class
global database					; database class
global dropLog					; drop log class

loadDatabases() ; possibly pass databases as script parameters

If (g_debug) {
	dropLog := new class_dropLog("d:\myLog.txt")
	dropLog._refreshAdvancedStats()
	
	exportStats(dropLog.stats)
	; msgbox % JSON.Dump(dropLog.stats,,2)
	msgbox end of debug script
	return
}

loadLog()
setStats()
exportStats(dropLog.stats)
exitapp
return

loadDatabases() {
	itemIds := new class_itemIds
	database := new class_database
	
	debugLog(A_ThisFunc "(): Loaded databases")
}

loadLog() {
	If !FileExist(g_logFile) {
		msgbox %A_Func%: Script did not receive existing input file`n`nClosing..
		exitapp
	}

	dropLog := new class_dropLog(g_logFile, "noprogress")
	FileDelete, % g_logFile ; main script will detect this deletion and wait till its written again for input
	
	debugLog(A_ThisFunc "(): Loaded log")
}

setStats() {
	dropLog._refreshAdvancedStats()
	
	debugLog(A_ThisFunc "(): Loaded stats")
}

/*
	Purpose
		Enumerate  json object for exporting and export
	
	Input
		json object
*/
exportStats(input) {
	output := []
	output.obj := []
	output.type := "stats"
	output.obj := input
	
	debugLog(A_ThisFunc "(): Created output object")
	
	; SendToAHK(convertEnumerate(output))
	FileAppend, % JSON.Dump(output,,2), % g_logFile
	
	; outputString := convertEnumerate(output)
	
	; SendToAHK(outputString)
	debugLog(A_ThisFunc "(): Exported stats to " g_logFile)
}

~^s::
	If !(g_debug) {
		exitapp
		return
	}
	reload
return

#include, %A_ScriptDir%\inc\workerThreadLib\
#include, EventHandler.ahk
#include, LSON.ahk
#include, WorkerThread.ahk
#Include, %A_ScriptDir%\inc
#Include, functions.ahk
#Include, subroutines.ahk
#Include, guiMain.ahk
#Include, guiSettings.ahk
#Include, guiLog.ahk
#Include, guiStats.ahk
#Include, guiDigitsCustom.ahk
#Include, guiDigitsVaried.ahk
#Include, guiPreset.ahk
#Include, class_dropLog.ahk
#Include, class_itemIds.ahk
#Include, class_database.ahk
#Include, class_parseWikiaHtml.ahk
#Include, class_progress.ahk
#Include, <CommandFunctions>
#Include, <JSON>
