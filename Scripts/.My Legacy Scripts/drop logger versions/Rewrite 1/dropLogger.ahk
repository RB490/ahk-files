#Include, *i %A_ScriptDir%\fileInstallList.ahk
; Menu, Tray, Icon, % A_ScriptDir "\icon.ico", 1
SplitPath, A_ScriptName, , , , ScriptName
global iniSettingsFile := A_ScriptDir "\" ScriptName ".ini"			; ini settings file
global iniPresetsFile := A_ScriptDir "\" ScriptName "_presets.ini"	; ini presets file	
global iniPresets			; ini presets variable
global ini				; ini variable
global iniCheck				; ini variable to check validity of ini
global g_mob				; selected mob
global g_drops				; drop object containing drops to be logged
global itemIds				; item id class
global database				; database class
global dropLog				; drop log class
global stats				; stats object holding drop log stats
global g__btnClearDrops		; guiLog clear drops button, global so it can be enabled/disable outside of the function
global AppName := "OSRS Drop Logger" ; app name
global progress				; class instance for progress class
global g_tabs := "showTab_Mob,showTab_Drop,showTab_Amount,showTab_Value,showTab_DropRate,showTab_WikiDropRate,showTab_KillsSinceLastDrop,showTab_ShortestDryStreak,showTab_LongestDryStreak" ; used by guiSettings and guiStats
global showTab_Mob,showTab_Drop,showTab_Amount,showTab_Value,showTab_DropRate,showTab_WikiDropRate,showTab_KillsSinceLastDrop,showTab_ShortestDryStreak,showTab_LongestDryStreak ; global so contents of these variables will be accesible by subroutines such as guiSettings_save

global g_debug := 0			; debug var
OnExit("ExitFunc")
SetBatchLines, -1 ; with batchlines -1 add atleast one sleep to each loop
#SingleInstance, ignore
#Persistent
OnMessage(0x202, "WM_LBUTTONUP")
; If !(g_debug)
	OnMessage(0x200, "WM_MOUSEMOVE")

If (g_debug) {
	#SingleInstance, force
	
	global timeSpent

	If !WinExist("ahk_class dbgviewClass") {
		run, D:\Apps\DebugView\Dbgview.exe
		WinWait, % "ahk_class dbgviewClass"
	}
	
	
	; FileRemoveDir, % A_ScriptDir "\res\img\mobs", 1
	; FileCreateDir, % A_ScriptDir "\res\img\mobs"
	; FileRemoveDir, % A_ScriptDir "\res\img\items", 1
	; FileCreateDir, % A_ScriptDir "\res\img\items"
	
	; FileDelete, % A_ScriptDir "\res\json\categoryDatabase.json"
	; FileDelete, % A_ScriptDir "\res\json\database.json"
	; FileDelete, % A_ScriptDir "\res\json\itemIds.json"
	
	loadSettings()
	; msgbox end of debug
	; return
	
	; for mob in database.obj
		; mobCount++
	; msgbox % mobCount
	
	g_mob := "Zulrah"

	
	; database.getDropTable(g_mob, "overwrite")

	
	; database.getDropTable("Barrows", "overwrite")
	
	; dropLog := new class_dropLog("d:\myLog.txt")
	; dropLog := new class_dropLog("d:\jsonLog.txt")
	dropLog := new class_dropLog("d:\debugLog.txt")
	
	; guiPreset()
	; guiDigitsCustom(1, 1)
	guiLog()
	; guiStats()
	; droplog.refreshAdvancedStats()
	; guiMain()
	; guiSettings()
	
	; dropLog.refreshAdvancedstats()
	
	; msgbox % 
	; msgbox % json.dump(droplog.advancedstats.uniqueDropList,,2)
	
	; msgbox end of debug section+script
	return
}

loadSettings()

guiMain()
; msgbox end of script
return

ExitFunc(ExitReason, ExitCode)
{
	If (IsObject(droplog)) ; write droplog file
		droplog.save()
	
	If (ini) { ; if ini var is not empty, eg: when in debug mode and settings (ini) have not been loaded
		If WinExist("Drop Logger Stats")
			guiStats("savePos")  ; trigger close label to save position
		
		ini_replaceValue(ini, "General", "g_mob", g_mob)
		If (ini)
			ini_save(ini, iniSettingsFile)
		If (iniPresets)
			ini_save(iniPresets, iniPresetsFile)
	}
	
	class_getWikiDroptables.Destroy()
}

menuHandler:
return

#Include, %A_ScriptDir%\inc
#Include, functions.ahk
#Include, guiAbout.ahk
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
#Include, class_categorydatabase.ahk
#Include, class_getWikiDroptables.ahk
#Include, class_parseWikiaHtml.ahk
#Include, class_progress.ahk
#Include, <CommandFunctions>
#Include, <JSON>

#If !A_IsCompiled

~^s::
	class_getWikiDroptables.Destroy()
	reload
return

#If
