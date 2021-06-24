Menu_EditorFileBrowserToggle:
	toggleEditorFileBrowser()
return

toggleEditorFileBrowser() {
	global
	
	If !WinExist("ahk_id " _guiEditor) ; if editor is hidden, dont toggle
		return
	
	FileViewHidden:=!FileViewHidden
	
	If (FileViewHidden = 0)
	{
		GuiControl editor: Move, guiEditor_Tv, % "H" . guiEditor_Tv_H
		GuiControl editor: Move, guiEditor_Lv, % "H" . guiEditor_Lv_H
	}
	else
	{
		ControlGetPos, , , , guiEditor_Tv_H, SysTreeView321, % "ahk_id " _guiEditor
		ControlGetPos, , , , guiEditor_Lv_H, SysListView321, % "ahk_id " _guiEditor
		
		GuiControl editor: Move, guiEditor_Tv, % "H" . 0
		GuiControl editor: Move, guiEditor_Lv, % "H" . 0

	}
	
	gui editor: show, AutoSize
}

Menu_HudExplorer:
	gui editor: +Disabled
	
	Gosub disableHotkeys
	
	moveHud("pull")
	guiExplorer(hPath)
	moveHud("push")
	
	gui editor: Default
	LV_Delete()
	guiEditor("guiEditor_TvRefresh")
	
	Gosub enableHotkeys
	
	gui editor: -Disabled
return

Menu_LoadMap:
	If (hGame = "left4dead")
	{
		Setting.left4dead_map := A_ThisMenuItem
		execCvar("map " Setting.left4dead_map " " Setting.GameMode)
	}
	If (hGame = "left4dead2")
	{
		Setting.left4dead2_map := A_ThisMenuItem
		execCvar("map " Setting.left4dead2_map " " Setting.GameMode)
	}

	Gosub writeGameConfig
return

Menu_loadMapOnStartUp:
	Setting.loadMapOnStartUp :=! Setting.loadMapOnStartUp
	
	Menu, Settings, ToggleCheck, Load map on game start
	
	Gosub writeGameConfig
return

Menu_hudReloadMode:
	If !(Setting.hudReloadMode = "")
		Menu, Settings, UnCheck, % Setting.hudReloadMode
	Setting.hudReloadMode := A_ThisMenuItem
	
	Menu, Settings, Check, % A_ThisMenuItem
return

Menu_GameMode:
	Menu, GameMode, UnCheck, % Setting.GameMode
	Setting.GameMode := A_ThisMenuItem
	Menu, GameMode, Check, % Setting.GameMode
	
	execCvar("mp_gamemode " Setting.GameMode)
		
	Gosub writeGameConfig
return

Menu_Res:
	StringReplace, GameRes, A_ThisMenuItem, x, % A_Space, All
	
	execCvar("mat_setvideomode " GameRes " 1; mat_savechanges")
	WinMovePos(gHwnd, Setting.GamePos)
	overlay(gHwnd)
return

Menu_GamePos:
	Menu, GamePos, UnCheck, % Setting.GamePos
	Setting.GamePos := A_ThisMenuItem
	Menu, GamePos, Check, % Setting.GamePos
	
	WinMovePos(gHwnd, Setting.GamePos)
	overlay(gHwnd)
return

Menu_Team:
	If InStr(A_ThisMenuItem, "spectate")
	{
		if (hGame = "left4dead")
			execCvar("spectate")
		if (hGame = "left4dead2")
			execCvar("jointeam 1")
	}
	else If InStr(A_ThisMenuItem, "infected")
		execCvar("jointeam 3")
	else
		execCvar("sb_takecontrol " A_ThisMenuItem)
return

Menu_Console:
	activeWindow("save")

	inputbox, cmd
	If (cmd = "")
		return
	
	execCvar(cmd)
	
	activeWindow("restore")
return

Menu_toggleHideWorld:
	Setting.hideWorld :=! Setting.hideWorld
	Gosub Menu_HideWorld
	Gosub writeGameConfig
return

Menu_HideWorld:
	If (Setting.hideWorld = 1) 
		execCvar("r_drawworld 0; r_drawentities 0")
	else
		execCvar("r_drawworld 1; r_drawentities 1")
return

Menu_Items:
	If (hGame = "left4dead")
	{
		If (A_ThisMenuItem = "Weapons")
			execCvar("give autoshotgun; give hunting_rifle; give rifle; give pumpshotgun; give smg")

		If (A_ThisMenuItem = "Items")
			execCvar("give pain_pills; give first_aid_kit; give molotov; give pipguiEditor_bomb")
	}
	
	If (hGame = "left4dead2")
	{
		If (A_ThisMenuItem = "pistols")
			execCvar("give pistol; give magnum; give ")

		If (A_ThisMenuItem = "melee")
			execCvar("give baseball_bat; give chainsaw; give crowbar; give fireaxe; give frying_pan; give machete; give shotgun_chrome; give grenadguiEditor_launcher")

		If (A_ThisMenuItem = "weapons")
			execCvar("give pumpshotgun; give smg; give autoshotgun; give hunting_rifle; give smg_mp5; give smg_silenced; give rifle; give riflguiEditor_ak47; give riflguiEditor_desert; give riflguiEditor_m60; riflguiEditor_sg552; give sniper_scout; give sniper_awp; give sniper_military; give smg_silenced; give shotgun_spas")

		If (A_ThisMenuItem = "items")
			execCvar("give pain_pills; give first_aid_kit; give molotov; give pipguiEditor_bomb; give vomitjar; give upgradepack_explosive; give upgradepack_incendiary; give adrenaline; give defibrillator")
	}
return

Menu_HudZombiePanels:
	If !(oldThisZombieMenuItem = "")
		menu, HudPanels, UnCheck, % oldThisZombieMenuItem
	oldThisZombieMenuItem := A_ThisMenuItem
	
	menu, HudPanels, Check, % A_ThisMenuItem ; check selected menuitem
	
	execCvar(A_ThisMenuItem)
return

Menu_HudPanels:
	; hide panel
	If !(PanelCvar = "") ; if PanelCvar has been set
	{
		If (PanelCvar = "team") or (PanelCvar = "info") ; hide Panel by sending alt f4
			execKey("!{F4}")
		else
			execCvar("hidepanel " PanelCvar) ; hide Panel by sending hidepanel command
	}
	
	; set panel
	If !(oldThisMenuItem = "") ; if a previous menuitem has been selected since script start
		menu, HudPanels, UnCheck, % oldThisMenuItem ; uncheck it
	oldThisMenuItem := A_ThisMenuItem ; save selected menuitem as previous menuitem for next cycle
	
	PanelCvar := SubStr(A_ThisMenuItem, 1, InStr(A_ThisMenuItem , "`t")) ; get panel cvar from A_ThisMenuItem
	PanelCvar := Trim(PanelCvar) ; trim spaces&tabs from the beginning and end of the string
	
	menu, HudPanels, Check, % A_ThisMenuItem ; check selected menuitem
	
	If (PanelCvar = oldPanelCvar) ; if selected menuitem is identical to the one previously selected
	{
		menu, HudPanels, UnCheck, % A_ThisMenuItem ; uncheck it
		PanelCvar := "" ; reset PanelCvar so the menu item can be selected again
	}

	; show panel
	If !(PanelCvar = oldPanelCvar) and !(PanelCvar = "") ; if it is not identical to the one last selected, and is set
		execCvar("showpanel " PanelCvar)
	
	oldPanelCvar := PanelCvar ; set oldPanelCvar for next cycle
return

Menu_InspectHud:
	InspectHud :=! InspectHud
	
	DetectHiddenWindows, On
	
	If (InspectHud = 1)
	{
		Menu, Toggle, ToggleCheck, Inspect HUD
		
		execCvar("vgui_drawtree 1")
		overlay()
		
		IfWinExist, % "ahk_id " textEditorHwnd
		{
			WinHide, % "ahk_id " textEditorHwnd
			; WinMinimize, % "ahk_id " textEditorHwnd
		}

		WinActivate, % "ahk_id " gHwnd
	}
	else
	{
		Menu, Toggle, ToggleCheck, Inspect HUD
		
		execKey("!{F4}")
		Gosub activateEditorGui
	}

return

Menu_RestartGame:
	DetectHiddenWindows, On
	
	SetTimer, checkGameClose, Off
	
	WinHide, % "ahk_id " _guiEditor
	
	Gosub disableHotkeys
	
	activeWindow("save")
	
	closeGame("ahk_id " gHwnd)
	
	runGame(%hGame%.AppId)
	
	WinMovePos(gHwnd, Setting.GamePos)
	overlay(gHwnd)
	
	activeWindow("restore")
	
	Gosub enableHotkeys

	WinShow, % "ahk_id " _guiEditor
	
	SetTimer, checkGameClose, On
return

Menu_textEditorTransparency:
	inputbox, textEditorTransparencyValue, , Choose transparency value for text editor between 10-255
	If Setting.textEditorTransparencyValue is not integer
	{
		msgbox Must be a value between 10 and 255
		return
	}
	
	If (Setting.textEditorTransparencyValue < 10)
	{
		msgbox Must be a value between 10 and 255
		return
	}
	
	If (Setting.textEditorTransparencyValue > 255)
	{
		msgbox Must be a value between 10 and 255
		return
	}
	
	If WinExist("ahk_id " textEditorHwnd)
		WinSet, Transparent, % Setting.textEditorTransparencyValue, % "ahk_id " textEditorHwnd
return

Menu_ReopenMenu:
	Setting.ReopenMenu :=! Setting.ReopenMenu
	
	Menu, Settings, ToggleCheck, Reopen menu on reload
return

Menu_CloseMenuPos:
	KeyWait, LButton, D
	KeyWait, LButton
	
	MouseGetPos, CloseMenuPosX, CloseMenuPosY
	Setting.CloseMenuPosX := CloseMenuPosX
	Setting.CloseMenuPosY := CloseMenuPosY
	
	tooltip CloseMenuPos set!
	sleep 250
	tooltip
return

Menu_OpenMenuPos:
	KeyWait, LButton, D
	KeyWait, LButton

	MouseGetPos, OpenMenuPosX, OpenMenuPosY
	Setting.OpenMenuPosX := OpenMenuPosX
	Setting.OpenMenuPosY := OpenMenuPosY
	
	tooltip OpenMenuPos set!
	sleep 250
	tooltip
return