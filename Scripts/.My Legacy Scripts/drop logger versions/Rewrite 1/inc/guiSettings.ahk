/*
	Purpose
		Adjust settings

	Returns
		true, if settings have been applied
*/
guiSettings() {
	static _btnupdateDatabase, _autoOpenStats, _guiLogTabCategories, _lastItemDatabaseUpdateDisplay, _lastDatabaseUpdateDisplay, _lastDatabaseRebuildDisplay
	
	guiLogImgSize := ini_getValue(ini, "Settings", "guiLogImgSize")
	guiLogRowLength := ini_getValue(ini, "Settings", "guiLogRowLength")
	guiLogTabCategories := ini_getValue(ini, "Settings", "guiLogTabCategories")
	autoOpenStats := ini_getValue(ini, "Settings", "autoOpenStats")
	
	loop, parse, g_tabs, `,
		%A_LoopField% := ini_getValue(ini, "Settings", A_LoopField)
	
	guiSettingsX := ini_getValue(ini, "Window Positions", "guiSettingsX")
	guiSettingsY := ini_getValue(ini, "Window Positions", "guiSettingsY")
	
	; properties
	Gui settings: New, +LastFound
	Gui settings: Margin, 5, 5
	Gui settings: +LabelguiSettings_
	
	; controls
	Gui settings: Add, Tab3, , General|Stats|Log
	Gui settings: tab, General
	
	Gui settings: Add, Button, w150 gguiSettings_updateItemDatabase section, Update item database
	If (ini_getValue(ini, "General", "lastItemDatabaseUpdate"))
		FormatTime, lastItemDatabaseUpdate_formatted, % ini_getValue(ini, "General", "lastItemDatabaseUpdate"), dd/MM/yyyy @ HH:mm:ss
	Gui settings: Add, Text, x+5 yp+5 w190 hwnd_lastItemDatabaseUpdateDisplay, % "Last updated: " lastItemDatabaseUpdate_formatted
	
	Gui settings: Add, Button, xs w150 gguiSettings_updateDatabase, Update mob database
	If (ini_getValue(ini, "General", "lastDatabaseUpdate"))
		FormatTime, lastDatabaseUpdate_formatted, % ini_getValue(ini, "General", "lastDatabaseUpdate"), dd/MM/yyyy @ HH:mm:ss
	Gui settings: Add, Text, x+5 yp+5 w190 hwnd_lastDatabaseUpdateDisplay, % "Last updated: " lastDatabaseUpdate_formatted
	
	Gui settings: Add, Button, xs w150 gguiSettings_RebuildDatabase hwnd_btnRebuildDatabase, Rebuild mob database
	If (ini_getValue(ini, "General", "lastDatabaseRebuild"))
		FormatTime, lastDatabaseRebuild_formatted, % ini_getValue(ini, "General", "lastDatabaseRebuild"), dd/MM/yyyy @ HH:mm:ss
	Gui settings: Add, Text, x+5 yp+5 w190 hwnd_lastDatabaseRebuildDisplay, % "Last rebuild: " lastDatabaseRebuild_formatted
	
	Gui settings: tab, Stats
	Gui settings: Add, Checkbox, checked%autoOpenStats% hwnd_autoOpenStats, Automatically open stats
	
	Gui settings: Add, GroupBox, r10 w150, Tabs
	
	loop, parse, g_tabs, `,
	{
		If (A_Index = 1)
			Gui settings: Add, Checkbox, % "hwnd" A_LoopField " xp+10 yp+20 checked" %A_LoopField%, % StrReplace(A_LoopField, "showTab_")
		else
			Gui settings: Add, Checkbox, % "hwnd" A_LoopField " checked" %A_LoopField%, % StrReplace(A_LoopField, "showTab_")
	}

	Gui settings: tab, Log
	Gui settings: Add, Text, , Row Length
	Gui settings: Add, Edit
	Gui settings: Add, UpDown, Range1-999, % guiLogRowLength
	
	Gui settings: Add, Text, , Button Size
	Gui settings: Add, Edit
	Gui settings: Add, UpDown, Range1-999, % guiLogImgSize
	
	Gui settings: Add, Checkbox, checked%guiLogTabCategories% hwnd_guiLogTabCategories, Tab categories
	
	Gui settings: tab
	Gui settings: Add, Button, w360 gguiSettings_save, Save
	
	; show
	If !(guiSettingsX = "") and !(guiSettingsY = "")
		Gui settings: show, % "x" guiSettingsX " y" guiSettingsY " AutoSize", % AppName " Settings"
	else
		Gui settings: show, AutoSize, % AppName " Settings"
	
	Gosub guiSettings_offScreenCheck
	
	; close
	WinWaitClose, % AppName " Settings"
	return output
	
	guiSettings_offScreenCheck:
		gui settings: +LastFound
		WinGet, guiSettingsHwnd, ID
		guiOffScreenCheck(guiSettingsHwnd)
	return
	
	guiSettings_updateItemDatabase:
		Gui settings: +Disabled
		itemIds.rebuild()
		Gui settings: -Disabled
		
		FormatTime, lastItemDatabaseUpdate_formatted, % ini_getValue(ini, "General", "lastItemDatabaseUpdate"), dd/MM/yyyy @ HH:mm:ss
		GuiControl settings: , % _lastItemDatabaseUpdateDisplay, % "Last updated: " lastItemDatabaseUpdate_formatted
	return
	
	guiSettings_UpdateDatabase:
		Gui settings: +Disabled
		database.Update()
		Gui settings: -Disabled
		
		FormatTime, lastDatabaseUpdate_formatted, % ini_getValue(ini, "General", "lastDatabaseUpdate"), dd/MM/yyyy @ HH:mm:ss
		GuiControl settings: , % _lastDatabaseUpdateDisplay, % "Last updated: " lastDatabaseUpdate_formatted
	return
	
	guiSettings_rebuildDatabase:
		Gui settings: +Disabled
		database.rebuild()
		database.getDropTable(g_mob) ; fetch drop table for currently logged mob
		Gui settings: -Disabled
		
		FormatTime, lastDatabaseRebuild_formatted, % ini_getValue(ini, "General", "lastDatabaseRebuild"), dd/MM/yyyy @ HH:mm:ss
		GuiControl settings: , % _lastDatabaseRebuildDisplay, % "Last rebuild: " lastDatabaseRebuild_formatted
		
		FormatTime, lastDatabaseUpdate_formatted, % ini_getValue(ini, "General", "lastDatabaseUpdate"), dd/MM/yyyy @ HH:mm:ss
		GuiControl settings: , % _lastDatabaseUpdateDisplay, % "Last updated: " lastDatabaseUpdate_formatted
	return
	
	guiSettings_save:
		output := true
		
		Gui settings: submit
		
		ControlGet, autoOpenStats, Checked, , , % "ahk_id " _autoOpenStats
		ControlGet, guiLogTabCategories, Checked, , , % "ahk_id " _guiLogTabCategories
		ControlGetText, guiLogRowLength, Edit1
		ControlGetText, guiLogImgSize, Edit2
		
		ini_replaceValue(ini, "Settings", "guiLogImgSize", guiLogImgSize)
		ini_replaceValue(ini, "Settings", "guiLogRowLength", guiLogRowLength)
		ini_replaceValue(ini, "Settings", "guiLogTabCategories", guiLogTabCategories)
		ini_replaceValue(ini, "Settings", "autoOpenStats", autoOpenStats)
		
		loop, parse, g_tabs, `,
		{
			ControlGet, %A_LoopField%, Checked, , , % "ahk_id " %A_LoopField%
			ini_replaceValue(ini, "Settings", A_LoopField, %A_LoopField%)
		}
		
		Gosub guiSettings_close
	return
	
	guiSettings_close:
		WinGetPos(WinExist(AppName " Settings"), guiSettingsX, guiSettingsY, guiSettingsW, guiSettingsH, 1)
		ini_replaceValue(ini, "Window Positions", "guiSettingsX", guiSettingsX)
		ini_replaceValue(ini, "Window Positions", "guiSettingsY", guiSettingsY)
		Gui settings: Destroy
	return
}