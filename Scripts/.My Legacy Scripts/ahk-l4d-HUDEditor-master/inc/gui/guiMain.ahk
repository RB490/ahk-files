guiMain() {
	global

	gui main: Destroy
	gui main: Default
	gui main: +LabelguiMain_ +Hwnd_guiMain
	gui main: margin, 5, 5
	
	; controls
	gui main: add, listview, w525 h200 AltSubmit vguiMain_Lv gguiMain_Lv, Name|Game|Path
	LV_ModifyCol(1, 70)
	LV_ModifyCol(2, 70)
	LV_ModifyCol(3, 380)
	
	gui main: Add, StatusBar
	SB_SetParts(80, 80)
	
	Gosub guiMain_LvRefresh
	
	gui main: show, , Main
	
	WinWaitClose % "ahk_id " _guiMain
	gui main: Destroy
	return
	
	guiMain_Close:
	Gosub iniSave
	exitapp
	return

	guiMain_ContextMenu:
		If (A_GuiControl = "guiMain_Lv")
		{
			Menu, guiMain_LvContext, Add
			Menu, guiMain_LvContext, DeleteAll
			
			If !(hName = "")
			{
				Menu, guiMain_LvContext, Add, Edit, guiMain_LvEdit
				Menu, guiMain_LvContext, Add, Explore, guiMain_LvExplore
				Menu, guiMain_LvContext, Add, Remove, guiMain_LvRemove
				Menu, guiMain_LvContext, Add
			}
			Menu, guiMain_LvContext, Add, Add, guiMain_btnAddHud
			menu, guiMain_LvContext, Show
		}
	return

	guiMain_btnAddHud:
		guiAddHud()
		Gosub guiMain_LvRefresh
	return
	
	guiMain_LvExplore:
		guiExplorer(hPath)
	return

	guiMain_LvRefresh:
		gui main: Default
		
		LV_Delete()
		
		loop, parse, % "left4dead,left4dead2", `,
		{
			cSection := A_LoopField
			cSectionKeys := ini_getAllKeyNames(ini, cSection)
			If InStr(cSectionKeys, ",")
			{
				loop, parse, cSectionKeys, `,
					LV_Add( , A_LoopField, cSection, ini_getValue(ini, cSection, A_LoopField))
			}
			else If !(cSectionKeys = "")
				LV_Add( , cSectionKeys, cSection, ini_getValue(ini, cSection, cSectionKeys))
		}
	return

	guiMain_Lv:
		gui main: Default
		
		if (A_GuiEvent = "Normal") or (A_GuiEvent = "RightClick") or (A_GuiEvent = "DoubleClick")
		{
			LV_GetText(hName, A_EventInfo, 1)
			If (hName = "Name")
				hName := ""
				
			LV_GetText(hGame, A_EventInfo, 2)
			If (hGame = "Game")
				hGame := ""
			
			LV_GetText(hPath, A_EventInfo, 3)
			If (hPath = "Path")
			{
				hPath := ""
				whPath := ""
			}
			else
				whPath := hPath ".default"

			SB_SetText(hName, 1)
			SB_SetText(hGame, 2)
			SB_SetText(hPath, 3)
			; tooltip % hName " " hGame " " hPath " " whPath
		}
		if (A_GuiEvent = "DoubleClick")
		{
			If !(hName = "")
				Gosub guiMain_LvEdit
		}
	return

	guiMain_LvRemove:
		ini_replaceKey(ini, hGame, hName)
		
		Gosub guiMain_LvRefresh
	return

	guiMain_LvAdd:
		gui add: margin, 5, 5
		gui add: +HwndaddGuiHwnd
		
		gui add: add, radio, vnewHud gguiMain_LvAddToggleControls, New
		gui add: add, radio, x+5 vaddHud gguiMain_LvAddToggleControls, Add
		
		gui add: add, text, x5, Name
		gui add: add, edit, vhName gguiMain_LvAddToggleControls
		
		gui add: add, text, , Path
		gui add: add, edit, vhPath gguiMain_LvAddToggleControls
		
		gui add: add, radio, vg_left4dead gguiMain_LvAddToggleControls, Left 4 dead
		gui add: add, radio, vg_left4dead2 gguiMain_LvAddToggleControls, Left 4 dead 2
		
		gui add: add, button, w120 Disabled vguiMain_LvAddSave gguiMain_LvAddSave, Add
		
		MouseGetPos, mX, mY
		
		gui add: show, % " x" mX " y" mY
		
		WinWaitClose, % "ahk_id " addGuiHwnd
		gui add: Destroy
	return

	guiMain_LvAddToggleControls:
		gui add: Submit, NoHide
		
		GuiControl add: Enable, guiMain_LvAddSave
		GuiControl add: Enable, hPath
		
		; save btn
		If (hName = "")
			GuiControl add: Disable, guiMain_LvAddSave
		
		If (newHud = 0) and (addHud = 0)
			GuiControl add: Disable, guiMain_LvAddSave
		
		If (g_left4dead = 0) and (g_left4dead2 = 0)
			GuiControl add: Disable, guiMain_LvAddSave
	return

	guiMain_LvAddSave:
		gui add: Submit, NoHide
		
		If InStr(hName, A_Space) ; check if hName has spaces in it
		{
			msgbox Hud name must not contain spaces
			return
		}
		
		loop, parse, % ini_getAllKeyNames(ini, hName), `, ; check if a .ini entry with specified hName already exists
			If InStr(A_LoopField, hName)
			{
				msgbox A hud with name "%hName%" is already added to script
				return
			}
		
		; set game var
		If (g_left4dead = 1)
			hGame := "left4dead"
		If (g_left4dead2 = 1)
			hGame := "left4dead2"
		
		hPath := RTrim(hPath , "\")
		SplitPath, hPath, hPathNameFull, hPathDir, hPathExt, hPathName
		
		If (addHud = 1)
		{
			If !FileExist(hPath) ; check if path exists
			{
				msgbox Invalid path
				return
			}
			
			If !( InStr( FileExist(hPath), "D") ) and !(hPathExt = "vpk") ; if hPath is a file other than a .vpk file
			{
				msgbox Specified file is not a .vpk file
				return
			}
			
			if !( InStr( FileExist(hPath), "D") ) and (hPathExt = "vpk") ; if hPath is a .vpk file
			{
				vpk_Extract(hPath) ; extract it and
				hPath := hPathDir ; set path to extracted .vpk
			}
		}
		
		If (newHud = 1)
		{
			If( InStr( FileExist(hPath "\" hName), "D") )
			{
				msgbox, 64, , Folder "%hName%" already exists at "%hPath%" `n`nChoose a different path or name
				return
			}
			
			hPath := hPath "\" hName
			FileCopyDir, % %hGame%.HudTemplate, % hPath, 1
		}

		ini_insertKey(ini, hGame, hName "=" . hPath)
		
		Gosub guiMain_LvRefresh
		
		gui add: Destroy
	return

	guiMain_LvEdit:
		gui main: Destroy
		
		If !( InStr( FileExist(hPath), "D") )
		{
			msgbox, Hud path does not exist!`n`n%hPath% "`n`nClosing"
			exitapp
		}
		
		closeGame("ahk_id " gHwnd, "prompt")
		
		If !isInstalled("vanilla")
		{
			msgbox % "Could not find game folder at " %hGame%.Dir "`n`nClosing"
			exitapp
		}
			
		If !isInstalled("dev")
		{
			setup("install")
			Gosub iniSave
			reload
			return
		}
		
		setGame("dev")
		
		moveHud("clean")
		moveHud("push")
		
		runGame(%hGame%.AppId)
	
		Gosub writeGameConfig
		WinMovePos(gHwnd, Setting.GamePos)
		overlay(gHwnd)
		
		guiEditor()
		
		WinWait, % "ahk_id " _guiEditor
		WinActivate, % "ahk_id " _guiEditor
		
		HotKey, F5, activateEditorGui
		HotKey, F5, On
		HotKey, F6, activateGame
		HotKey, F6, On
		HotKey, F8, Menu_EditorFileBrowserToggle
		HotKey, F8, On
		HotKey, F9, Menu_Console
		HotKey, F9, On
		
		hotkey, IfWinActive, ahk_class Notepad++
		HotKey, ~^s, Off
		hotkey, IfWinActive
		
		sleep 1000
		VAWrapper_mute("ahk_id " gHwnd, "mute")
		
		SetTimer, checkGameClose, On
	return
}

