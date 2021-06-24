; action can be add or new
guiAddHud() {
	global ini
	global guiAddHud_btnSave
	static game, path, name, newhud, addHud
	
	gui addHud: default
	gui addHud: margin, 5, 5
	gui addHud: +Hwnd_guiAddHud +LabelguiAddHud_
	
	gui addHud: add, dropdownlist, x5 w200 vgame gguiAddHud_checkFields, Left 4 Dead|Left 4 Dead 2

	gui addHud: add, radio, x5 vaddHud, Add existing
	gui addHud: add, radio, x+5 vnewHud, Create new
	
	gui addHud: add, text, x5, Name
	gui addHud: add, edit, w200 vname gguiAddHud_checkFields
	
	gui addHud: add, text, , Path
	gui addHud: add, edit, w175 vpath gguiAddHud_checkFields
	gui addHud: add, button, x+5 yp-1 w20 gguiAddHud_btnPath
	
	gui addHud: add, button, x5 w200 Disabled vguiAddHud_btnSave gguiAddHud_btnSave, Add
	
	gui addHud: show, ; x0 y0
	
	OnMessage(0x102, "WM_CHAR")
	
	WinWaitClose, % "ahk_id " _guiAddHud
	gui addHud: Destroy
	return
	
	guiAddHud_btnPath:
		gui addHud: Default
		gui addHud: +OwnDialogs
		
		FileSelectFolder, path
		If (path = "")
			return
			
		GuiControl addHud:, path, % path
	return
	
	guiAddHud_checkFields:
		gui addHud: Submit, NoHide
		
		GuiControl addHud: Enable, guiAddHud_btnSave
		
		If (game = "") or (name = "")
			GuiControl addHud: Disable, guiAddHud_btnSave
		
		If (newHud = 0) and (addHud = 0)
			GuiControl addHud: Disable, guiAddHud_btnSave
			
		If !FileExist(path)
			GuiControl addHud: Disable, guiAddHud_btnSave
	return

	guiAddHud_btnSave:
		gui addHud: Submit, NoHide
		StringReplace, game, game, %A_Space%, , All ; remove spaces from game var
		
		If InStr(name, A_Space) ; check if name has spaces in it
		{
			msgbox Hud name must not contain spaces
			return
		}
		
		loop, parse, % ini_getAllKeyNames(ini, name), `, ; check if a .ini entry with specified name already exists
			If InStr(A_LoopField, name)
			{
				msgbox A hud with name "%name%" is already added to script
				return
			}
		
		path := RTrim(path , "\")
		SplitPath, path, patnameFull, pathDir, pathExt, patname
		
		If (addHud = 1)
		{
			If !( InStr( FileExist(path), "D") ) and !(pathExt = "vpk") ; if path is a file other than a .vpk file
			{
				msgbox Specified file is not a .vpk file
				return
			}
			
			if !( InStr( FileExist(path), "D") ) and (pathExt = "vpk") ; if path is a .vpk file
			{
				vpk_Extract(path) ; extract it and
				path := pathDir ; set path to extracted .vpk
			}
		}
		
		If (newHud = 1)
		{
			If( InStr( FileExist(path "\" name), "D") )
			{
				msgbox, 64, , Folder "%name%" already exists at "%path%" `n`nChoose a different path or name
				return
			}
			
			path := path "\" name
			FileCopyDir, % %game%.HudTemplate, % path, 1
		}

		ini_insertKey(ini, game, name "=" . path)
		
		gui addHud: Destroy
	return
}

WM_CHAR(wParam, lParam){

	If(A_GuiControl = "name" and !RegExMatch(Chr(wParam), "i)^[a-z1-9\x08]$"))
	
		Return false

}