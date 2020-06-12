/*
	Purpose
		Create and modify existing presets
			Name
			Mob
			File

	Returns
		new presets name, blank if not set
*/
guiPreset(modifyPreset = "") {
	If (modifyPreset) {
		If !InStr(ini_getAllSectionNames(iniPresets), modifyPreset) {
			msgbox guiPreset(): Preset selected for modifying does not exist in preset file
			return
		}
		name := ini_getValue(iniPresets, modifyPreset, "name")
		mob := ini_getValue(iniPresets, modifyPreset, "mob")
		file := ini_getValue(iniPresets, modifyPreset, "file")
	}
	
	; properties
	w := 250
	m := 5
	
	gui preset: +LabelguiPreset_ +hwnd_guiPreset
	gui preset: margin, % m, % m

	; controls
	gui preset: add, text, % " w" w " section", Name
	gui preset: add, edit, % " w" w, % name

	gui preset: add, text, % " w" w , Mob
	; gui preset: add, edit, % " w" w, % mob
	gui preset: add, combobox, % " w" w " Simple r6", % mob

	gui preset: add, text, % " w" w , File
	gui preset: add, edit, % " w" w - m - 20, % file

	gui preset: add, button, % " x+" m " yp-1 w20 gguiPreset_selectFile", ..

	gui preset: add, button, % "xs w" w " gguiPreset_save", Save

	Gosub guiPreset_mobCb_reload
	
	; show
	gui preset: show, , % AppName " Presets"

	; close
	WinWaitClose, % "ahk_id " _guiPreset
	return output

	guiPreset_mobCb_reload:
		; listbox
		GuiControl preset: -Redraw, ComboBox1
		GuiControl preset: , ComboBox1, |
		
		loop, % database.mobList.length()
			GuiControl preset: , ComboBox1, %  database.mobList[A_Index] "|"
			
		GuiControl preset: +Redraw, ComboBox1
		GuiControl preset:  ChooseString, ComboBox1, % g_mob
	return
	
	guiPreset_close:
		gui preset: destroy
	return

	guiPreset_selectFile:
		FileSelectFile, sFile, 11, , Select Log File, (*.txt)
		If (sFile = "")
			return
		SplitPath, sFile, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		file := OutDir "\" OutNameNoExt ".txt"
		
		If !FileExist(file)
			FileAppend, , % file

		ControlSetText, Edit3, % file
	return

	guiPreset_save:
		ControlGetText, name, Edit1
		ControlGetText, mob, ComboBox1
		ControlGetText, file, Edit3
		
		If !(name) or !(mob) or !(file) {
			msgbox Fill out all fields before saving
			return
		}

		If IfIsNot(StrReplace(name, A_Space), "alnum") {
			msgbox name contains strange characters
			return
		}

		loop, parse, % ini_getAllSectionNames(iniPresets), `, ; check if selected preset already exists
		{
			If (A_LoopField = name) and !(A_LoopField = modifyPreset) {
				msgbox, 68, , Preset with selected name already exists.`n`nOverwrite?
				IfMsgBox, No
					return
			}
		}

		If !HasVal(database.mobList, mob) {
			msgbox Specified mob not found in database
			return
		}

		SplitPath, file, , dir
		If !FileExist(dir) {
			msgbox, 68, , Specified folder does not exist. `n`nCreate it?
			IfMsgBox No
				return
			FileCreateDir, % dir
		}
		
		If !FileExist(file) {
			msgbox, 68, , Specified file does not exist. `n`nCreate it?
			IfMsgBox No
				return
			FileAppend, , % file
		}

		loop, parse, % ini_getAllSectionNames(iniPresets), `, ; check if selected file is used by another preset
		{
			If (file = ini_getValue(iniPresets, A_LoopField, "file")) and !(name = ini_getValue(iniPresets, A_LoopField, "name")) {
				msgbox, 68, , Selected file is used by at least one other preset: "%A_LoopField%".`n`nContinue?
				IfMsgBox, No
					return
				break
			}
		}

		gui preset: hide
		
		ini_replaceSection(iniPresets, name)
		
		iniPresets := string_cleanUp(iniPresets)

		ini_insertSection(iniPresets, name)
			ini_insertKey(iniPresets, name, "name=" name)
			ini_insertKey(iniPresets, name, "mob=" mob)
			ini_insertKey(iniPresets, name, "file=" file)
		
		ini_save(iniPresets, iniPresetsFile)
		
		DownloadMobIcon(mob, database.obj[mob].img)
		
		output := name
		Gosub guiPreset_close
	return
}