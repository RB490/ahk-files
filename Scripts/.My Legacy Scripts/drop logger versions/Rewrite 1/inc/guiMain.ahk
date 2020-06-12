guiMain() {
	static guiMain_mobSearchString, guiMain_presetSearchString, s_preset, loaded
	
	loaded := 0
	
	If (ini_getValue(ini, "general", "s_preset")) {
		s_preset := ini_getValue(ini, "general", "s_preset")
		g_mob := ini_getValue(iniPresets, s_preset, "mob")
	}
	else If !(g_mob)
		g_mob := ini_getValue(ini, "General", "g_mob")
	guiMainX := ini_getValue(ini, "Window Positions", "guiMainX")
	guiMainY := ini_getValue(ini, "Window Positions", "guiMainY")
	
	; properties
	m := 5
	
	gui main: new
	gui main: margin, % m, % m
	gui main: +LabelguiMain_ +LastFound
	
	; controls
	gui main: font, s12
	gui main: add, edit, w240 gguiMain_mobLb_Search vguiMain_mobSearchString, % guiMain_mobSearchString
	gui main: add, ListBox, xs w240 r10 gguiMain_mobLb vg_mob
	gui main: font
	
	gui main: add, button, w240 gguiMain_settings, Settings
	gui main: add, button, x+5 w240 gguiMain_Log, Log
	
	gui main: Add, Picture, xp+1 y5 h237 w237 +border +transparent section
	gui main: Add, Picture, xs+10 ys+10 h215 w215
	If FileExist(A_ScriptDir "\res\img\mobs\" g_mob ".png")
		GuiControl main: , Static2, % A_ScriptDir "\res\img\mobs\" g_mob ".png"
	
	gui main: font, s12
	gui main: add, edit, % " w" 240 " xp" - 10 + 237 + m " yp" - 10 " gguiMain_presetLb_Search vguiMain_presetSearchString", % guiMain_presetSearchString
	gui main: add, ListBox, w240 r10 gguiMain_presetLb vs_preset
	gui main: font
	
	gui main: add, button, w80 gguiMain_presetLb_newPreset, New
	gui main: add, button, % " x+" 1 " w80 gguiMain_presetLb_ModifyPreset", Modify
	gui main: add, button, % " x+" 1 " w80 gguiMain_presetLb_deletePreset", Delete
	
	gui main: add, statusbar
	
	; show
	If !(guiMainX = "") and !(guiMainY = "")
		Gui main: show, % "x" guiMainX " y" guiMainY " AutoSize NoActivate", % AppName " Mob Select"
	else
		Gui main: show, AutoSize NoActivate, % AppName " Mob Select"
	
	WinGetPos, guiMainX, guiMainY, guiMainW, guiMainH, % AppName " Mob Select"
	SB_SetParts(guiMainW / 2)
	SB_SetText(g_mob, 1)
	SB_SetText(A_Tab A_Tab ini_getValue(iniPresets, s_preset, "file"), 2)
	
	SB_SetIcon("D:\Downloads\myicon.ico")
	
	Gosub guiMain_mobLb_Reload
	Gosub guiMain_mobLb_Search
	Gosub guiMain_presetLb_reload
	Gosub guiMain_presetLb_Search
	Gosub guiMain_offScreenCheck
	
	loaded := 1
	Gosub guiMain_updateImage ; download mob image for current (default) selected mob
	return
	
	guiMain_offScreenCheck:
		gui main: +LastFound
		WinGet, guiMainHwnd, ID
		guiOffScreenCheck(guiMainHwnd)
	return
	
	guiMain_presetLb:
		If (A_GuiEvent = "DoubleClick") or (A_GuiEvent = "Normal") {
			Gosub guiMain_submitNoHide
			If !(s_preset)
				return

			Gosub guiMain_presetLb_refresh
			Gosub guiMain_updateImage
			GuiControl main: Choose, ListBox1, 0 ; deselect
		}
		If (A_GuiEvent = "DoubleClick")
			Gosub guiMain_Submit
	return
	
	guiMain_presetLb_Search:
		Gosub guiMain_submitNoHide
		
		If !(guiMain_PresetSearchString) {
			Gosub guiMain_presetLb_reload
			return
		}
		
		GuiControl main: -Redraw, ListBox2
		GuiControl main: , ListBox2, |
		
		loop, parse, % ini_getAllSectionNames(iniPresets), `,
			If InStr(A_LoopField, guiMain_presetSearchString)
				GuiControl main: , ListBox2, %  A_LoopField "|"
		
		GuiControl main: +Redraw, ListBox2
		GuiControl main:  ChooseString, ListBox2, % s_preset
	return
	
	guiMain_presetLb_reload:
		; listbox
		GuiControl main: -Redraw, ListBox2
		GuiControl main: , ListBox2, |
		
		loop, parse, % ini_getAllSectionNames(iniPresets), `,
			GuiControl main: , ListBox2, %  A_LoopField "|"
		
		GuiControl main: +Redraw, ListBox2
		GuiControl main:  ChooseString, ListBox2, % s_preset
		
		Gosub guiMain_presetLb_refresh
	return
	
	guiMain_presetLb_refresh:
		gui main: default
		
		If (s_preset) {
			g_mob := ini_getValue(iniPresets, s_preset, "mob")
			SB_SetText(g_mob, 1)
			SB_SetText(A_Tab A_Tab ini_getValue(iniPresets, s_preset, "file"), 2)
			
			; toggle buttons
			GuiControl main: Enable, Button4 ; modify btn
			GuiControl main: Enable, Button5 ; delete btn
		}
		else {
			GuiControl main: Disabled, Button4 ; modify btn
			GuiControl main: Disabled, Button5 ; delete btn
		}
		
		If (g_mob) or (s_preset) ; log button
			GuiControl main: Enable, Button2
		else
			GuiControl main: Disabled, Button2
	return
	
	guiMain_presetLb_newPreset:
		If !(guiPreset())
			return
		Gosub guiMain_presetLb_reload
	return
	
	guiMain_presetLb_deletePreset:
		If !(s_preset)
			return
		ini_replaceSection(iniPresets, s_preset)
		s_preset := ""
		Gosub guiMain_presetLb_reload
	return
	
	guiMain_presetLb_modifyPreset:
		Gui main: +Disabled
		If !(s_preset) {
			Gui main: -Disabled
			return
		}
		guiPreset(s_preset)
		Gosub guiMain_presetLb_reload
		Gui main: -Disabled
	return
	
	guiMain_mobLb:
		If (A_GuiEvent = "Normal") {
			Gosub guiMain_submitNoHide
			
			Gosub guiMain_updateImage

			Gosub guiMain_mobLb_Refresh
			
		}
		If (A_GuiEvent = "DoubleClick")
			Gosub guiMain_Submit
	return
	
	guiMain_mobLb_Search:
		Gosub guiMain_submitNoHide
		
		If !(guiMain_mobSearchString) {
			Gosub guiMain_mobLb_Reload
			return
		}
		
		GuiControl main: -Redraw, ListBox1
		GuiControl main: , ListBox1, |
		
		loop, % database.mobList.length()
			If InStr(database.mobList[A_Index], guiMain_mobSearchString)
				GuiControl main: , ListBox1, %  database.mobList[A_Index] "|"
		
		GuiControl main: +Redraw, ListBox1
		GuiControl main:  ChooseString, ListBox1, % g_mob
	return
	
	guiMain_mobLb_Reload:
		; listbox
		GuiControl main: -Redraw, ListBox1
		GuiControl main: , ListBox1, |
		
		loop, % database.mobList.length()
			GuiControl main: , ListBox1, %  database.mobList[A_Index] "|"
			
		GuiControl main: +Redraw, ListBox1
		GuiControl main:  ChooseString, ListBox1, % g_mob
		
		Gosub guiMain_mobLb_Refresh
	return
	
	guiMain_mobLb_Refresh:
		; etc
		SB_SetText(g_mob, 1)
		SB_SetText("", 2)
		
		GuiControl main: Choose, ListBox2, 0 ; deselect
		s_preset := "" ; deselect
		
		
		Gosub guiMain_presetLb_refresh
	return
	
	guiMain_contextMenu:
		If !(g_mob)
			return
		
		MouseGetPos, , , , control
		
		If (control = "ListBox1") or (control = "Static1") or (control = "Static2") {
			menu, m, add
			menu, m, DeleteAll
			
			menu, m, add, % g_mob, menuHandler
			menu, m, disable, % g_mob
			menu, m, add
			menu, m, add, Update image, guiMain_updateImage
			menu, m, add, Update Drop Table, guiMain_updateDropTable
			menu, m, show
		}
	return
	
	guiMain_submitNoHide:
		If (loaded)
			gui main: submit, nohide
	return

	guiMain_updateImage:
		If !(g_mob)
			return
		DownloadMobImage(g_mob, database.obj[g_mob].img, "overwrite")
		GuiControl main: , Static2, % A_ScriptDir "\res\img\mobs\" g_mob ".png"
	return
	
	guiMain_updateDropTable:
		database.getDropTable(g_mob, "overwrite")
	return
	
	guiMain_settings:
		gui main: +Disabled
		guiSettings()
		Gosub guiMain_mobLb_Reload
		gui main: -Disabled
	return
	
	guiMain_log:
		Gosub guiMain_Submit
	return
	
	guiMain_Submit:
		Gosub guiMain_submitNoHide

		database.getDropTable(g_mob)
		
		If (s_preset) { ; preset was selected
			g_mob := ini_getValue(iniPresets, s_preset, "mob")
			dropLog := new class_dropLog(ini_getValue(iniPresets, s_preset, "file"))
		}
		else { ; mob was selected
			dropLog := new class_dropLog
			If !(dropLog.file) ; don't continue if a file was not selected
				return
		}
		
		Gosub guiMain_savePos
		gui main: destroy
		
		ini_replaceValue(ini, "General", "s_preset", s_preset)
		
		guiLog()
	return
	
	guiMain_savePos:
		WinGetPos(WinExist(AppName " Mob Select"), guiMainX, guiMainY, guiMainW, guiMainH, 1)
		ini_replaceValue(ini, "Window Positions", "guiMainX", guiMainX)
		ini_replaceValue(ini, "Window Positions", "guiMainY", guiMainY)
	return
	
	guiMain_escape:
	guiMain_close:
		Gosub guiMain_savePos
	exitapp
}