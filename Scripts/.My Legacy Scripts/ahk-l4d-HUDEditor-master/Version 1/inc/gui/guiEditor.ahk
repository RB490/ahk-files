guiEditor(GosubLabel = "") {
	global

	If !WinExist("ahk_id " _guiEditor)
	{
		Gosub guiEditorMenuBuild
		
		gui editor: Default
		gui editor: margin, 0, 0
		gui editor: +AlwaysOnTop +LabelguiEditor_ +Hwnd_guiEditor +Resize
		
		gui editor: menu, editorMenu
		
		guiEditor_TvWidth := 150
		guiEditor_TvHeight := 200
		guiEditor_LvWidth := 220
		guiEditor_LvHeight := 200
		
		gui editor: add, treeview, % " w" guiEditor_TvWidth " h" guiEditor_TvHeight " AltSubmit vguiEditor_Tv gguiEditor_Tv"
		gui editor: add, listview, % "x+1 w" guiEditor_LvWidth " h" guiEditor_LvHeight " AltSubmit vguiEditor_Lv gguiEditor_Lv", File
		LV_ModifyCol(1, "AutoHDR")
		
		Gosub guiEditor_TvRefresh
		
		If (Setting.editorX = "")
			gui editor: show
		else
			gui editor: show, % " x" Setting.editorX " y" Setting.editorY
	}
	else
		If !(GosubLabel = "")
			Gosub % GosubLabel
	return
	
	guiEditor_Size:
		if A_EventInfo = 1  ; The window has been minimized.  No action needed.
			return
		; Otherwise, the window has been resized or maximized. Resize the controls to match.
		GuiControl e: Move, guiEditor_Tv, % "H" . (A_GuiHeight)  ; -30 for StatusBar and margins.
		GuiControl e: Move, guiEditor_Lv, % "H" . (A_GuiHeight) . " W" . (A_GuiWidth - guiEditor_TvWidth - 1)
	return

	guiEditor_Close:
		msgbox, 262212, , Save & Exit?
		IfMsgBox No
			return
		
		Gosub SaveGuiEditorPos
		gui editor: Destroy
		
		SetTimer, checkGameClose, Off
		
		closeGame("ahk_id " gHwnd)
		
		Gosub handleGameClose
	return

	guiEditor_Tv:
		gui editor: Default
		
		if (A_GuiEvent <> "Normal")
			return
		
		TV_GetText(guiEditor_sDir, A_EventInfo)
		ParentID := A_EventInfo
		Loop
		{
			ParentID := TV_GetParent(ParentID)
			if not ParentID
				break
			TV_GetText(ParentText, ParentID)
			guiEditor_sDir = %ParentText%\%guiEditor_sDir%
		}	
		guiEditor_sDirFull := guiEditor_sDir
		StringReplace, guiEditor_sDir, guiEditor_sDir, % ParentText "\" ; note: important to not StringReplace "all"
				
		Gosub guiEditor_LvRefresh
	return

	guiEditor_TvRefresh:
		gui editor: Default
		loadTree(hPath)
	return

	guiEditor_Lv:
		gui editor: Default
		
		If (A_GuiEvent = "Normal")
		{
			LV_GetText(guiEditor_sFile, A_EventInfo) ; get file name
			SplitPath, guiEditor_sFile, , , guiEditor_sFileExt, guiEditor_sFile ; get file extension
			
			If (guiEditor_sFile = "File")
			{
				guiEditor_sFile = ""
				guiEditor_sFileExt = ""
			}
			
			hdFile := whPath "\" guiEditor_sDir "\" guiEditor_sFile "." guiEditor_sFileExt
			hsFile := hPath "\" guiEditor_sDir "\" guiEditor_sFile "." guiEditor_sFileExt
			StringReplace, hgFile, hsFile, % hPath, % %hGame%.MainDir
			
			If (guiEditor_sFileExt = "res") or (guiEditor_sFileExt = "txt") or (guiEditor_sFileExt = "cfg")
				getDefaultProgramInfo(guiEditor_sFileExt, textEditorHwnd, textEditorPid)
		}
		
		if (A_GuiEvent = "DoubleClick")
		{
			If (guiEditor_sFile = "addoninfo") and (guiEditor_sFileExt = "txt")
			{
				hotkey, IfWinActive, % "ahk_id " textEditorHwnd
					hotkey, ~^s, off
					guiAddonInfo(hsFile)
					hotkey, ~^s, on
				hotkey, IfWinActive
			}
			else
			{
				If (textEditorHwnd = "") ; text editor is not running
				{
					Run, % hgFile, , , textEditorPID ; run text editor by opening file and get hwnd
					WinWait, % "ahk_pid " textEditorPID, , 60
					If (ErrorLevel = 1)
						msgbox Text editor with pid ( %textEditorPID% ) took longer than a minute to open file ( %hgFile% )
					else
						textEditorHwnd := WinExist("ahk_pid " textEditorPID)
				}
				else ; text editor is running
					Run, % hgFile
					
				WinWait, % "ahk_id " textEditorHwnd
				WinSet, AlwaysOnTop, On, % "ahk_id " textEditorHwnd
				WinSet, Transparent, % Setting.textEditorTransparencyValue, % "ahk_id " textEditorHwnd
				
				hotkey, IfWinActive, % "ahk_id " textEditorHwnd
					hotkey, ~^s, reloadHud
					hotkey, ~^s, On
				hotkey, IfWinActive
			}
		}
	return

	guiEditor_LvDefaultFile:
		If (hdFile = "") or !FileExist(hdFile)
			return
		run, % hdFile
	return

	guiEditor_ContextMenu:
		If (A_GuiControl = "guiEditor_Lv")
		{
			If FileExist(hdFile)
			{
				menu, guiEditor_LvContext, Add
				menu, guiEditor_LvContext, DeleteAll
				
				menu, guiEditor_LvContext, Add, Open Default, guiEditor_LvDefaultFile
				menu, guiEditor_LvContext, Show
			}
		}
	return

	guiEditor_LvRefresh:
		gui editor: Default
		
		LV_Delete()
		
		GuiControl, -Redraw, guiEditor_Lv
		Loop, % hPath "\" guiEditor_sDir "\*.*"
		{
			SplitPath, A_LoopFileName, , , guiEditor_Ext, guiEditor_Name
			LV_Add(, guiEditor_Name "." guiEditor_Ext)
		}
		LV_ModifyCol(1, "AutoHDR")
		GuiControl, +Redraw, guiEditor_Lv
	return

}