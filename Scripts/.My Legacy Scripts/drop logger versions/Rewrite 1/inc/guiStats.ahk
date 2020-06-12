guiStats(action = "", input = "") {
	static guiStats_lv, guiStats_miscLv, guiStats_miscLvSelectedRow, guiStats_lvWidth
	
	If (action) and !WinExist(AppName " Stats") {
		return
	}
	
	If (action = "rename") {
		debugLog(A_ThisFunc "(): action = rename")
		Gui stats: show, NoActivate, % AppName " Stats - " input
		return
	}
	
	If (action = "savePos") {
		debugLog(A_ThisFunc "(): action = savePos")
		Gosub guiStats_close
		return
	}
	
	If (action = "refresh")
	{
		debugLog(A_ThisFunc "(): action = refresh")
		Gosub guiStats_refresh
		return
	}
	
	If (action = "clear")
	{
		debugLog(A_ThisFunc "(): action = clear")
		Gosub guiStats_clear
		return
	}

	If WinExist(AppName " Stats") {
		
		debugLog(A_ThisFunc "(): WinExist Stats")
		WinActivate, % AppName " Stats"
		return
	}
		
	debugLog(A_ThisFunc "(): After checks")
		
	guiStatsX := ini_getValue(ini, "Window Positions", "guiStatsX")
	guiStatsY := ini_getValue(ini, "Window Positions", "guiStatsY")
	guiStatsW := ini_getValue(ini, "Window Positions", "guiStatsW")
	guiStatsH := ini_getValue(ini, "Window Positions", "guiStatsH")
	
	guiStats_lvWidth := 160
	
	; properties
	Gui stats: default
	Gui stats: New, +LabelguiStats_ +Resize
	Gui stats: Margin, 5, 5

	; controls
	Gui stats: Add, ListView, w%guiStats_lvWidth% r12 NoSortHdr -LV0x10 -Multi vguiStats_lv, Description|Value
	Gui stats: Add, ListView, x+5 w100 r12 -LV0x10 -Multi vguiStats_miscLv gguiStats_miscLv AltSubmit hwndHLV, Mob|Drop Table|Items|Amount|Value|Drop rate|Wiki drop rate|Kills since last drop|Shortest dry streak|Longest dry streak
	
	LVHeader := DllCall("SendMessage", "Ptr", HLV, "UInt", 0x101F, "Ptr", 0, "Ptr", 0, "UPtr")
	HeaderRBtnClk := Func("HeaderRBtnClk").Bind(LVHeader)
	OnMessage(0x0204, HeaderRBtnClk)
	
	Gosub guiStats_refresh
	Gosub guiStats_offScreenCheck
	
	; show
	If !(guiStatsX = "") and !(guiStatsY = "")
		Gui stats: show, % "x" guiStatsX " y" guiStatsY " w" guiStatsW " h" guiStatsH " NoActivate", % AppName " Stats"
	else
		Gui stats: show, NoActivate, % AppName " Stats"
	return
	
	guiStats_clear:
		Gui stats: show, NoActivate, % AppName " Stats - Updating.."
		
		Gui stats: default
		
		Gui stats: Listview, guiStats_lv
		LV_Delete()
		
		Gui stats: Listview, guiStats_miscLv
		LV_Delete()
	return
	
	guiStats_offScreenCheck:
		Gui stats: +LastFound
		WinGet, guiStatsHwnd, ID
		guiOffScreenCheck(guiStatsHwnd)
	return
	
	guiStats_size:
		; tooltip % A_GuiWidth "-" A_GuiHeight
		Gui stats: +Lastfound
		ControlMove, SysListView322, , , % A_GuiWidth - guiStats_lvWidth - 15, % A_GuiHeight - 10, % AppName " Stats"
		ControlMove, SysListView321, , , , % A_GuiHeight - 10, % AppName " Stats"
	return
	
	guiStats_miscLv:
		If (A_GuiEvent = "Normal") or (A_GuiEvent = "DoubleClick")
			guiStats_miscLvSelectedRow := A_EventInfo
	return
	
	guiStats_refresh:
		Gosub guiStats_refreshLv
		Gosub guiStats_refreshMiscLv
		
		FormatTime, now_formatted, % A_Now, dd/MM/yyyy @ HH:mm:ss
		guiStats("rename", "Last update: " now_formatted)
	return
	
	guiStats_refreshLv:
		Gui stats: default
		Gui stats: Listview, guiStats_lv
		GuiControl stats: -Redraw, guiStats_lv
		LV_Delete()
		
		LV_Add(, "-- Total --")
		LV_Add(, "Kills", dropLog.advancedStats.totalKills)
		LV_Add(, "Trips", dropLog.advancedStats.totalTrips)
		LV_Add(, "Time", dropLog.advancedStats.totaltimeFormatted)
		LV_Add(, "Trip Time", dropLog.advancedStats.totalTripTimeFormatted)
		LV_Add(, "Death Time", dropLog.advancedStats.totalDeathTimeFormatted)
		LV_Add(, "Drop value", ThousandsSep(dropLog.advancedStats.totalDropValue))
		LV_Add(, "-- Average --")
		LV_Add(, "Kills per trip", dropLog.advancedStats.averageKillsPerTrip)
		LV_Add(, "Time per trip", dropLog.advancedStats.averageTimePerTripFormatted)
		LV_Add(, "Time per kill", dropLog.advancedStats.averageTimePerKillFormatted)
		LV_Add(, "Drop value", ThousandsSep(dropLog.advancedStats.averageDropValue))
		LV_Add(, "Kills/hour", dropLog.advancedStats.averageKillsPerHour)
		LV_Add(, "Trips/hour", dropLog.advancedStats.averageTripsPerHour)
		LV_Add(, "Income/hour", ThousandsSep(dropLog.advancedStats.averageIncomePerHour))
		
		GuiControl stats: +Redraw, guiStats_lv
	return
	
	guiStats_refreshMiscLv:
		Gui stats: Listview, guiStats_miscLv
		GuiControl stats: -Redraw, guiStats_miscLv
		LV_Delete()
		
		loop, % dropLog.advancedStats.uniqueDropsInfoArray.length()
		{
			mob := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].mob
			dropTable := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].dropTable
			drop := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].drop
			totalAmount := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].totalAmount
			totalValue := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].totalValue
			dropRate := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].dropRate
			wikiDropRate := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].wikiDropRate
			killsSinceLastDrop := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].killsSinceLastDrop
			shortestDryStreak := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].shortestDryStreak
			longestDryStreak := dropLog.advancedStats.uniqueDropsInfoArray[A_Index].longestDryStreak
			
			; add row to listview
			LV_Add(, mob, dropTable, drop, totalAmount, totalValue, dropRate, wikiDropRate, killsSinceLastDrop, shortestDryStreak, longestDryStreak)
		}
		
		loop, parse, g_tabs, `,
		{
			If (ini_getValue(ini, "Settings", A_LoopField) = 1)
				LV_ModifyCol(A_Index, "AutoHDR")
			else
				LV_ModifyCol(A_Index, 0)
		}
		
		LV_ModifyCol(1, "Text")
		LV_ModifyCol(2, "Text")
		LV_ModifyCol(3, "SortDesc")
		LV_ModifyCol(4, "Integer")
		LV_ModifyCol(5, "Integer")
		LV_ModifyCol(6, "Integer")
		LV_ModifyCol(7, "Text")
		LV_ModifyCol(8, "Integer")
		LV_ModifyCol(9, "Integer")
		LV_ModifyCol(10, "Integer")
		
		LV_Modify(guiStats_miscLvSelectedRow, "Vis")
		
		GuiControl stats: +Redraw, guiStats_miscLv
	return
	
	guiStats_close:
		WinGetPos(WinExist(AppName " Stats"), guiStatsX, guiStatsY, guiStatsW, guiStatsH, 1)
		ini_replaceValue(ini, "Window Positions", "guiStatsX", guiStatsX)
		ini_replaceValue(ini, "Window Positions", "guiStatsY", guiStatsY)
		ini_replaceValue(ini, "Window Positions", "guiStatsW", guiStatsW)
		ini_replaceValue(ini, "Window Positions", "guiStatsH", guiStatsH)
		
		Gui stats: Destroy
	return
}

HeaderRBtnClk(HHD, wParam, lParam, Msg, Hwnd) {
   ; msdn.microsoft.com/en-us/library/bb775349(v=vs.85).aspx
   If (Hwnd = HHD) {
		menu, myTestMenu, add
		menu, myTestMenu, DeleteAll
		
		loop, parse, g_tabs, `,
			%A_LoopField% := ini_getValue(ini, "Settings", A_LoopField)
		
		loop, parse, g_tabs, `,
		{
			LoopField := StrReplace(A_LoopField, "showTab_")
			menu, myTestMenu, add, % LoopField, myTestMenuHandler
			
			If (%A_LoopField%)
				menu, myTestMenu, Check, % LoopField
		}
		
		menu, myTestMenu, show
   }
}

myTestMenuHandler:
	tabValue := ini_getValue(ini, "Settings", "showTab_" A_ThisMenuItem)
	tabValue := !tabValue

	ini_replaceValue(ini, "Settings", "showTab_" A_ThisMenuItem, tabValue)
	
	guiStats("refresh")
return