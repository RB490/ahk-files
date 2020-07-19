/*
	Parameters
		tab =			tab to create & add to
		mob =			mob to link onto added drops
		dropTable 	=	object with item drops
		reset (opt) =	call this before loading a new drop log
		
	Purpose
		load Drop Table into tab
		
	Notes
		This file needs to be encoded as UTF-8-BOM for ⏰ charcter (clock) to show in autohotkey
*/
guiLog_loadDropTable(tab := "", mob := "", dropTable := "", reset := "") {
	static ; entire function is static to dynamically add variables to the picture controls
	
	If (reset) or !IsObject(allTabs) {
		allTabs := []
		dropAdded := ""
		count2 := ""
		rows2 := ""
		allRows := ""
		return
	}
	
	dropList := dropTable
	tabCategories := ini_getValue(ini, "Settings", "guiLogTabCategories")
	
	margin := 0
	btnSize := ini_getValue(ini, "Settings", "guiLogImgSize")
	rowLength := ini_getValue(ini, "Settings", "guiLogRowLength")
	
	Gui log: Margin, % margin, % margin
	
	If !HasVal(allTabs, tab) {
		GuiControl log: , SysTabControl321, % tab "|" ; add tab
		allTabs.push(tab)
	}
	
	Gui log: tab, % tab ; select tab for adding controls
	
	; converted back in getMouseObj()
	cMob := convertChars("from", mob)

	If (tab = "rare")
		cDropTable := "rare drop table"
	else
		cDropTable := "normal drop table"
	cDropTable := convertChars("from", cDropTable)
	
	; controls
	count := ""
	rows := ""
	If (tabCategories) or (mob = "Rare Drop Table") {
		loop, % dropList.length() ; adding 'border' style makes picture 1 pixel wider and taller
		{
			path := A_ScriptDir "\res\img\items\" dropList[A_Index] ".png"
			Random, rng, 1
			rng := cMob "#" cDropTable "#" A_Index "#" rng 
			
			If (A_Index = 1) { ; first row first entry
				gui log: add, picture, % "section w" btnSize " h" btnSize " border v" rng, % path
				count++
				rows++ ; avoid triggering "first entry of new row"

				; msgbox first row first entry
			}
			else If (count = 1) { ; first entry of new row
				gui log: add, picture, % "section w" btnSize " h" btnSize " xs ys+" btnSize + margin + 1 " border v" rng, % path
				rows++
				; msgbox first entry of new row
			}
			else If (count = rowLength) { ; last entry of row
				count := 0
				gui log: add, picture, % " w" btnSize " h" btnSize " x+" margin - 1  " border v" rng, % path
				; msgbox last entry of row
			}
			else
				gui log: add, picture, % " w" btnSize " h" btnSize " x+" margin - 1  " border v" rng, % path
			
			count++
		}
	}
	else {
		gui log: show, hide ; todo: without this line, after the first drop the drops are misaligned
		loop, % dropList.length() ; adding 'border' style makes picture 1 pixel wider and taller
		{
			path := A_ScriptDir "\res\img\items\" dropList[A_Index] ".png"
			Random, rng, 1
			rng := cMob "#" cDropTable "#" A_Index "#" rng 
			
			StringReplace, path, path, /, @, All ; DownloadDropImage converts @'s to slashes because a filename cant contain slashes

			If !(dropAdded) { ; first row first entry
				gui log: add, picture, % "section w" btnSize " h" btnSize " border v" rng, % path
				count2++
				rows2++ ; avoid triggering "first entry of new row"
				dropAdded := 1

				; msgbox first row first entry
			}
			else If (count2 = 1) { ; first entry of new row
				gui log: add, picture, % "section w" btnSize " h" btnSize " xs ys+" btnSize + margin + 1 " border v" rng, % path
				rows2++
				; msgbox first entry of new row
			}
			else If (count2 = rowLength) { ; last entry of row
				count2 := 0
				gui log: add, picture, % " w" btnSize " h" btnSize " x+" margin - 1  " border v" rng, % path
				; msgbox last entry of row
			}
			else {
				gui log: add, picture, % " w" btnSize " h" btnSize " x+" margin - 1  " border v" rng, % path
				; msgbox normal drop
			}
			
			count2++
		}
	}

	Gui log: Tab
	Gui log: Margin, 5, 5
	
	allRows .= rows "`n"
	allRows .= rows2 "`n"
	Sort, allRows, NR
	loop, parse, allRows, `n
	{
		maxRowHeight := A_LoopField
		break
	}
	
	tabHeight := ""
	tabHeight := maxRowHeight * (btnSize + 1)
	return tabHeight
}

guiLog(action = "") {
	static _guiLog, _btnUndo, _btnRedo, _btnTrip, _btnNewTrip, _btnLogKill, _btnLogDeath, _logDisplay, _dropsDisplay, tripTimerRunning, now_formatted
	
	DetectHiddenWindows, On
	
	If WinExist(AppName) and (action = "refresh")	{
		Gosub guiLog_refresh
		return
	}
	
	If WinExist(AppName) and (action = "logKill")	{
		Gosub guiLog_kill
		return
	}
	
	If WinExist(AppName) and (action = "savePos")	{
		Gosub guiLog_savePos
		return
	}
	
	database.getDropTable(g_mob)
	
	autoOpenStats := ini_getValue(ini, "Settings", "autoOpenStats")
	guiLogX := ini_getValue(ini, "Window Positions", "guiLogX")
	guiLogY := ini_getValue(ini, "Window Positions", "guiLogY")
	
	; also defined in guiLog_loadDropTable()
	margin := 5
	deathBtnWidth := 100
	btnSize := ini_getValue(ini, "Settings", "guiLogImgSize")

	; properties
	Gui log: New, +LabelguiLog_ +Hwnd_guiLog +LastFound -Resize
	Gui log: Margin, 5, 5
	
	; controls
	Gui log: Add, StatusBar
	
	Gosub guiLog_setMenu

	Gui log: Add, Button, r2 hwnd_btnLogKill gguiLog_kill section, + Kill (enter)
	Gui log: Add, Button, x+5 ys w%deathBtnWidth% r2 hwnd_btnLogDeath gguiLog_death, Start Death
	Gui log: add, button, x+5 w150 r2 hwnd_btnTrip gguiLog_trip
	Gui log: add, button, x+5 w150 r2 hwnd_btnNewTrip gguiLog_newTrip, New trip
	
	Gui log: Add, Tab3, xs ys+40 section Buttons -Theme ; -Wrap 
	
	; add Drop Tables
	guiLog_loadDropTable(,,,"reset")
	
	tabCategories := ini_getValue(ini, "Settings", "guiLogTabCategories")
	If (tabCategories) {
		
		cbase := new class_categoryDatabase
		dropListCategories := cbase.getDroplistCategories(database.getDropList(g_mob, "Normal Drop Table"))
		
		for category in dropListCategories
		{
			heightValues .= guiLog_loadDropTable(category, g_mob, dropListCategories[category]) "`n"
			
			; If (A_Index = 3)
				; break
		}
	}
	else
		heightValues .= guiLog_loadDropTable("Drops", g_mob, database.getDropList(g_mob, "Normal Drop Table")) "`n"
	If (database.obj[g_mob]["Rare Drop Table"])
		heightValues .= guiLog_loadDropTable("Rare", "Rare Drop Table", database.getDropList(g_mob, "Rare Drop Table")) "`n"
	
	Sort, heightValues, NR
	loop, parse, heightValues, `n
	{
		tabHeight := A_LoopField
		break
	}
	
	tabWidth := ini_getValue(ini, "Settings", "guiLogRowLength") * (btnSize + 1) + margin
	
	ControlMove, SysTabControl321, , , % tabWidth, , % "ahk_id " _guiLog
	
	SendMessage, 0x132C, 0, 0, SysTabControl321 ; get amount of tab rows
	tabRows := ErrorLevel ; save tabrows from sendmessage
	distanceBetweenButtonRows := tabRows - 1
	distanceBetweenButtonRows *= 3
	
	tabHeight += (tabRows * 20) + (margin * 2) + distanceBetweenButtonRows + (tabRows * 11)
	ControlMove, SysTabControl321, , , , % tabHeight, % "ahk_id " _guiLog
	
	ControlGetPos, tabX, tabY, tabW, tabH, SysTabControl321
	tabX -= 3 ; adjust for titlebar
	tabY -= 26 ; adjust for titlebar
	
	If (tabRows = 1) and !(tabCategories)
		tabY -= 24
	else
		tabY -= (tabRows * 11)
	
	Gui log: add, edit, % "x" tabX + tabW + margin - 3 " y" tabY + margin " w300 h" tabH - margin " ReadOnly hwnd_logDisplay"
	
	Gui log: Add, Edit, % "y" tabY + tabH + margin " x" tabX - 0 " w" tabW - 60 " r1 ReadOnly hwnd_dropsDisplay"
	Gui log: Add, Button, x+5 yp-1 w50 gguiLog_clearDrops hwndg__btnClearDrops, Clear
	
	Gui log: add, button, x+5 w150 r1 hwnd_btnUndo gguiLog_undo, Undo
	Gui log: add, button, x+5 w150 r1 gguiLog_redo hwnd_btnRedo Disabled, Redo
	
	; position buttons around log display
	ControlMove, Button1, , , tabW - deathBtnWidth - 3
	ControlGetPos, Button1X, Button1H, Button1W, Button1H, Button1
	ControlMove, Button2, % Button1X + Button1W + margin - 3
	ControlMove, Button3, % Button1X + Button1W + margin - 1 + deathBtnWidth
	ControlMove, Button6, % Button1X + Button1W + margin - 1 + deathBtnWidth
	ControlGetPos, Button3X, Button3H, Button3W, Button3H, Button3
	ControlMove, Button4, % Button3X + Button3W + margin - 3
	ControlMove, Button7, % Button3X + Button3W + margin - 3
	
	; show
	Gosub guiLog_offScreenCheck
	Gosub guiLog_refresh
	
	If !(guiLogX = "") and !(guiLogY = "")
		Gui log: show, % "x" guiLogX " y" guiLogY " AutoSize", % AppName
	else
		Gui log: show, AutoSize, % AppName
	
	WinGetPos, guiLogX, guiLogY, guiLogW, guiLogH, % AppName
	SB_SetParts(guiLogW / 2)
	SB_SetText(g_mob, 1)
	SB_SetText(A_Tab A_Tab dropLog.file, 2)
	
	ControlSend, , ^{end}, % "ahk_id " _logDisplay
	
	If (autoOpenStats)
		Gosub guiLog_stats
	return
	
	guiLog_setMenu:
		Gui log: Menu
		
		; clear menu before settings it up again
		menu, MenuPresets, add
		menu, MenuPresets, DeleteAll
		
		; Update submenu
		menu, MenuUpdate, add, Program, guiLog_updateProgram
		menu, MenuUpdate, add, Item database, guiLog_updateItemDatabase
		menu, MenuUpdate, add, Mob database, guiLog_updateMobDatabase
		
		; presets submenu
		menu, MenuPresets, add, New, guiLog_newPreset
		menu, MenuPresets, add
		loop, parse, % ini_getAllSectionNames(iniPresets), `,
		{
			menu, MenuPresets, add, % A_LoopField, guiLog_btnPresetHandler
			
			mob := ini_getValue(iniPresets, A_LoopField, "mob")

			If !FileExist(A_ScriptDir "\res\img\mobs icons\" mob ".png")
				DownloadMobIcon(mob, database.obj[mob].img)
			
			menu, MenuPresets, icon, % A_LoopField, % A_ScriptDir "\res\img\mobs icons\" ini_getValue(iniPresets, A_LoopField, "mob") ".png", , 0
		}
		
		; menu
		Menu, MyMenuBar, Add, Reset, guiLog_Reset
		Menu, MyMenuBar, Add, Presets, :MenuPresets
		Menu, MyMenuBar, Add, Stats, guiLog_stats
		Menu, MyMenuBar, Add, Settings, guiLog_settings
		Menu, MyMenuBar, Add, Update, :MenuUpdate
		Menu, MyMenuBar, Add, Export, guiLog_export
		Menu, MyMenuBar, Add, About, guiLog_about
		
		Gui log: Menu, MyMenuBar
	return
	
	guiLog_export:
		msgbox % A_ThisLabel
	return
	
	guiLog_about:
		guiAbout()
	return
	
	guiLog_updateProgram:
		; Each commit (update) of the GitHub (or any git) repository has its
		; own sha key, we can use this to check if there are any updates
		RegExMatch(DownloadToString("https://api.github.com/repos/0125/ahk-rs-dropLogger/git/refs/heads/master"),"U)\x22sha\x22\x3A\x22\K\w{6}",GHsha)
		
		if (GHsha = "") or (GHsha = ini_getValue(ini, "General", "lastProgramUpdateSha")) {
			MsgBox, 64, No update available, %AppName% seems to be up-to-date.
			Return
		}
		
		MsgBox, 36, Update?, Do you wish to download updates for %AppName%?
		IfMsgBox, No
			Return
		
		; download script files & overwrite old
		Loop, Files, % A_ScriptDir "\*.ahk", RF
		{
			LoopField := StrReplace(A_LoopFileFullPath, A_ScriptDir "\")
			LoopField := StrReplace(LoopField, "\", "/")
			
			; msgbox https://raw.githubusercontent.com/0125/ahk-rs-droplogger/master/%LoopField%
			URLDownloadToFile, https://raw.githubusercontent.com/0125/ahk-rs-droplogger/master/%LoopField%, % A_LoopFileFullPath
		}
		
		ini_replaceValue(ini, "General", "lastProgramUpdate", A_Now)
		ini_replaceValue(ini, "General", "lastProgramUpdateSha", GHsha)
		
		MsgBox, 64, Restart, The updates have been downloaded.`nRestart to load changes.
	return
	
	guiLog_updateItemDatabase:
		itemIds.rebuild()
	return
	
	guiLog_updateMobDatabase:
		database.Update()
	return
	
	guiLog_settings:
		Gui log: +Disabled
		settingsSaved := guiSettings()
		If !(settingsSaved) {
			Gui log: -Disabled
			return
		}
		
		guiLog("savePos")
		IfWinExist, % AppName " Stats"
			guiStats("savePos")
			
		guiLog()
	return
	
	guiLog_newPreset:
		Gui log: +Disabled
		
		newPreset := guiPreset()
		If !(newPreset) {
			Gui log: -Disabled
			return
		}
		
		Gosub guiLog_setMenu
		
		Gui log: -Disabled
	return
	
	guiLog_btnPresetHandler:
		droplog.save()
		
		guiStats("clear")
		
		g_mob := ini_getValue(iniPresets, A_ThisMenuItem, "mob")
		dropLog := new class_dropLog(ini_getValue(iniPresets, A_ThisMenuItem, "file"))
		
		guiLog("savePos")
		guiLog()
		droplog.refreshAdvancedStats()
	return
	
	guiLog_offScreenCheck:
		gui log: +LastFound
		WinGet, guiLogHwnd, ID
		guiOffScreenCheck(guiLogHwnd)
	return
	
	guiLog_trip:
		GuiControl log: -Default, % A_GuiControl ; un-blue button
		
		If (dropLog.stats.isDeathOnGoing)
			dropLog.add({"Stop death": A_Now})
		
		If (dropLog.stats.isTripOnGoing = 0)
			dropLog.add({"Start trip": A_Now})
		else
			dropLog.add({"Stop trip": A_Now})
			
		guiLog("refresh")
	return
	
	guiLog_newTrip:
		FormatTime, now_formatted, % A_Now, dd/MM/yyyy @ HH:mm:ss
		
		If (dropLog.stats.isDeathOnGoing)
			dropLog.add({"Stop death": A_Now})
		
		dropLog.add({"Stop trip": A_Now})
		dropLog.add({"Start trip": A_Now})
		
		guiLog("refresh")
	return
	
	guiLog_undo:
		dropLog.undo()
		Gosub guiLog_clearDrops
		
		guiLog("refresh")
	return
	
	guiLog_redo:
		dropLog.redo()
		Gosub guiLog_clearDrops
		
		guiLog("refresh")
	return
	
	guiLog_clearDrops:
		GuiControl log: , % _dropsDisplay
		g_drops := ""
		guiLog("refresh")
	return
	
	guiLog_kill:
		ControlGetText, selectedDrops, , % "ahk_id " _dropsDisplay
		If !(selectedDrops)
			return
		
		If (dropLog.stats.isDeathOnGoing)
			dropLog.add({"Stop death": A_Now})
		
		dropLog.add(g_drops)
		
		Gosub guiLog_clearDrops
		
		guiLog("refresh")
	return
	
	guiLog_death:
		GuiControl log: -Default, % A_GuiControl ; un-blue button
		
		If (dropLog.stats.isDeathOnGoing = 0)
			dropLog.add({"Start death": A_Now})
		else
			dropLog.add({"Stop death": A_Now})
		
		guiLog("refresh")
	return
	
	guiLog_stats:
		guiStats()
		droplog.refreshAdvancedStats()
	return
	
	guiLog_Reset:
		Gui log: +Disabled
		
		If !(dropLog.delete()) {
			Gui log: -Disabled
			return
		}
		
		guiLog("refresh")
		Gui log: -Disabled
		droplog.refreshAdvancedStats()
	return
	
	guiLog_refresh:
		If (dropLog.stats.isTripOnGoing = 1)
			tripLog := dropLog.stats.tripLog

		GuiControl log: , % _logDisplay, % tripLog
		ControlSend, , ^{end}, % "ahk_id " _logDisplay
		
		If (dropLog.stats.isTripOnGoing) {
			GuiControl log: , % _btnTrip, End Trip
			GuiControl log: Enable, % _btnNewTrip
			GuiControl log: Enable, % _btnLogKill
			GuiControl log: Enable, % _btnLogDeath
			
			If !(tripTimerRunning)
			{
				SetTimer, guiLog_tripTimer, 1000
				tripTimerRunning := 1
			}
			Gosub guiLog_tripTimer
			GuiControl log: Focus, % _btnLogKill
		}
		else {
			GuiControl log: , % _btnTrip, Start Trip
			GuiControl log: Disable, % _btnNewTrip
			GuiControl log: Disable, % _btnLogKill
			GuiControl log: Disable, % _btnLogDeath
			
			SetTimer, guiLog_tripTimer, Off
			tripTimerRunning := 0
			gui log: +LastFound
			WinSetTitle, % AppName
		}
		
		If (dropLog.log.length()) {
			GuiControl log: Enable, % _btnUndo
			Menu, MyMenuBar, Enable, Reset
		}
		else {
			GuiControl log: Disable, % _btnUndo
			Menu, MyMenuBar, Disable, Reset
		}
		
		If (dropLog.undone.length())
			GuiControl log: Enable, % _btnRedo
		else
			GuiControl log: Disable, % _btnRedo
		
		If IsObject(g_drops)
			GuiControl log: Enable, % g__btnClearDrops
		else
			GuiControl log: Disable, % g__btnClearDrops
			
		If (dropLog.stats.isDeathOnGoing) {
			GuiControl log: , % _btnLogDeath, End Death
		}
		else {
			GuiControl log: , % _btnLogDeath, Start Death
		}
	return
	
	guiLog_tripTimer:
		tSinceLastStatsUpdate++
		If (tSinceLastStatsUpdate = 60) {
			droplog.refreshAdvancedStats()
			tSinceLastStatsUpdate := 0
		}
		
		getPassedTime(dropLog.stats.tripStart, A_Now, , TripTimeInSecondsFormatted)
		getPassedTime(dropLog.stats.deathStart, A_Now, , deathTimeInSecondsFormatted)
		
		gui log: +LastFound
		If (dropLog.stats.tripKills)
			dKills := A_Space "Kill #" dropLog.stats.tripKills
		If (dropLog.stats.totalTrips) {
			dTrips := A_Space "Trip #" dropLog.stats.totalTrips
			dTripDuration := A_Space TripTimeInSecondsFormatted
		}
		If (dropLog.stats.isDeathOnGoing)
			dDeathDuration := A_Space " Last death: " DeathTimeInSecondsFormatted
		
		WinSetTitle, % AppName dTrips dKills dTripDuration dDeathDuration
	return
	
	guiLog_savePos:
		WinGetPos(WinExist(AppName), guiLogX, guiLogY, guiLogW, guiLogH, 1)
		ini_replaceValue(ini, "Window Positions", "guiLogX", guiLogX)
		ini_replaceValue(ini, "Window Positions", "guiLogY", guiLogY)
	return
	
	guiLog_close:
		SetTimer, guiLog_tripTimer, Off
		tripTimerRunning := 0
		
		Gosub guiLog_savePos
		
		If WinExist(AppName " Stats")
			guiStats("savePos")  ; trigger close label to save position
		Gui log: Destroy
		
		droplog.save()
		dropLog := ""
		
		guiMain()
	return
}