#Include, *i %A_ScriptDir%\fileInstallList.ahk

#SingleInstance, force
#Persistent

Coordmode, ToolTip, Screen
CoordMode, Mouse, Screen

hotkey, IfWinActive, ahk_class Notepad++
hotkey, ~^s, reloadScript
hotkey, IfWinActive

Gosub setVars
Gosub iniLoad

debugEditor = 0
If (debugEditor = 1)
{
	Gosub debugEditor
	return
}

guiMain()
return
#Include %A_ScriptDir%\inc\
#Include guiEditorMenu.ahk
#Include guiEditorMenuLabels.ahk
#Include vars.ahk

#Include %A_ScriptDir%\inc\gui\
#Include guiMain.ahk
#Include guiEditor.ahk
#Include guiSetup.ahk
#Include guiAddHud.ahk

iniSave:
	for key, value in Setting
		ini_replaceValue(ini, "Settings", key, value)
		
	ini_save(ini, iniFile)
return

iniLoad:
	ini_load(ini, iniFile)
	If (ErrorLevel = 1)
		Gosub buildIni
	
	iniWrapper_loadSection(ini, "left4dead")
	iniWrapper_loadSection(ini, "left4dead2")
	
	global Setting := {}
	loop, parse, % ini_getAllKeyNames(ini, "Settings"), `,
		Setting.Insert(A_LoopField, ini_getValue(ini, "Settings", A_LoopField))
return

buildIni:
	ini_insertSection(ini, "Settings")
	ini_insertKey(ini, "Settings", "hudReloadMode=" . "hud_reloadscheme")
	ini_insertKey(ini, "Settings", "loadMapOnStartUp=" . 0)
	ini_insertKey(ini, "Settings", "left4dead_map=" . "tutorial_standards")
	ini_insertKey(ini, "Settings", "left4dead2_map=" . "tutorial_standards")
	ini_insertKey(ini, "Settings", "gamePos=" . "Center")
	ini_insertKey(ini, "Settings", "gameMode=" . "Coop")
	ini_insertKey(ini, "Settings", "hideWorld=" . 0)
	ini_insertKey(ini, "Settings", "textEditorTransparencyValue=" . 255)
	ini_insertKey(ini, "Settings", "ReopenMenu=" . 0)
	ini_insertKey(ini, "Settings", "OpenMenuPosX=" . "")
	ini_insertKey(ini, "Settings", "OpenMenuPosY=" . "")
	ini_insertKey(ini, "Settings", "CloseMenuPosX=" . "")
	ini_insertKey(ini, "Settings", "CloseMenuPosY=" . "")
	ini_insertKey(ini, "Settings", "editorX=" . "")
	ini_insertKey(ini, "Settings", "editorY=" . "")
	
	ini_insertSection(ini, "left4dead")
	ini_insertSection(ini, "left4dead2")
	
	ini_Save(ini, iniFile)
	ini_Load(ini, iniFile)
return

debugEditor:
	hGame := "left4dead"
	hPath := "e:\OneDrive\EXEC\Github\l4d1-inkhud\source"
	hName := "source"
	
	; hotkey, IfWinActive, ahk_class Notepad++
	; hotkey, ~^s, Off
	; hotkey, IfWinActive
	
	hudReloadMode := "ui_reloadscheme"
	
	; gHwnd := WinExist("ahk_class Valve001")
	; If (gHwnd = "0x0")
	; {
		; msgbox game not running returning
		; return
	; }
	; Gosub writeGameConfig
	guiEditor()
		HotKey, F8, Menu_EditorFileBrowserToggle
		HotKey, F8, On

	; overlay(gHwnd)
	
	; HotKey, F5, activateEditorGui
	; HotKey, F5, On
	; HotKey, F6, activateGame
	; HotKey, F6, On
	
	sleep 200
	
	WinActivate ahk_class Notepad++
	return
return

menuHandler:
return

activeWindow(action) {
	static ActiveWindowHwnd, mX, mY
	
	If (action = "save")
	{
		WinGetActiveTitle, ActiveWindowTitle
		WinGet, ActiveWindowHwnd, ID, % ActiveWindowTitle
		MouseGetPos, mX, mY
	}
	
	If (action = "restore")
	{
		If (ActiveWindowTitle = "overlay.exe") and !(_guiEditor = "")
			ActiveWindowHwnd := _guiEditor
		
		WinActivate % "ahk_id " ActiveWindowHwnd
		MouseMove, % mX, % mY, 0
	}
}

getDefaultProgramInfo(fileExtension, ByRef outHwnd, ByRef outPid) {
	RegRead, defaultEditor, % "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\." fileExtension "\UserChoice", ProgId
	StringReplace, defaultEditorExe, defaultEditor, Applications\
	
	outHwnd := WinExist("ahk_exe " defaultEditorExe)
	If (outHwnd = "0x0")
		outHwnd := ""
		
	WinGet, outPid, PID, % "ahk_exe " defaultEditorExe
	return
}

runGame(appID, launchOptions="") {
	global
	
	If (steamDir = "")
		RegRead, steamDir, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam, InstallPath
	If (steamDir = "")
		RegRead, steamDir, HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam, InstallPath
	If (steamDir = "")
	{
		msgbox runGame(): Could not find steam dir in registry. Not running game
		return
	}
	
	run, % SteamDir "\steam.exe -silent -applaunch " appID " -window -noborder -novid " launchOptions ; pid does get set to game window
	
	WinWait, % "ahk_class Valve001"
	gHwnd := WinExist()
}

closeGame(winTitle, prompt="") {
	global gHwnd
	
	DetectHiddenWindows, On

	If !WinExist(winTitle)
		return
	
	If !(prompt = "")
	{
		WinGetTitle, aGame, % winTitle
		msgbox, 262212, , % "Close " aGame " and continue?"
		IfMsgBox, No
			exitapp
	}
	
	VAWrapper_mute("ahk_id " gHwnd, "")
	; sleep 500
	
	WinGet, winExe, ProcessName, % winTitle
	process, close, % winExe
	
	DetectHiddenWindows, Off
}

setGame(mode) {
	global hGame
	
	If (FileExist(%hGame%.MainDir "\*.vpk")) ; gamefolder = vanilla
	{
		If !( InStr( FileExist(%hGame%.DirDD), "D") )
			return
	
		If (mode = "dev")
		{
			; tooltip % "setGame(): mode = " mode "`n`nAttempting to move:`n`n" %hGame%.Dir "`n->`n" %hGame%.DirVD
			FileMoveDir, % %hGame%.Dir, % %hGame%.DirVD
			If (ErrorLevel = 1)
				setGame(mode)
			
			; tooltip % "setGame(): mode = " mode "`n`nAttempting to move:`n`n" %hGame%.DirDD "`n->`n" %hGame%.Dir
			FileMoveDir, % %hGame%.DirDD, % %hGame%.Dir
			If (ErrorLevel = 1)
				setGame(mode)
		}
	}
	If (!FileExist(%hGame%.MainDir "\*.vpk")) ; gamefolder = dev
	{
		If !( InStr( FileExist(%hGame%.DirVD), "D") )
			return
		
		If (mode = "vanilla")
		{
			; tooltip % "setGame(): mode = " mode "`n`nAttempting to move:`n`n" %hGame%.Dir "`n->`n" %hGame%.DirDD
			FileMoveDir, % %hGame%.Dir, % %hGame%.DirDD
			If (ErrorLevel = 1)
				setGame(mode)
			
			; tooltip % "setGame(): mode = " mode "`n`nAttempting to move:`n`n" %hGame%.DirVD "`n->`n" %hGame%.Dir
			FileMoveDir, % %hGame%.DirVD, % %hGame%.Dir
			If (ErrorLevel = 1)
				setGame(mode)
		}
	}
	
	tooltip
}

isInstalled(mode) {
	global hGame

	If (mode = "vanilla")
	{
		If( InStr( FileExist(%hGame%.Dir), "D") ) and ( InStr( FileExist(%hGame%.DirVD), "D") )
		{
			setGame("vanilla")
			return 1
		}
		
		If( InStr( FileExist(%hGame%.Dir), "D") )
			return 1
	}
	If (mode = "dev")
	{
		If( InStr( FileExist(%hGame%.DirDD), "D") )
			return 1
		else
		{
			If( InStr( FileExist(%hGame%.DirVD), "D") )
			{
				setGame("vanilla")
				return 1
			}
			else
				return 0
		}
	}
}

moveHud(action) {
	global hGame, hPath, whPath
	
	If (action = "push")
	{
		moveHud("backup")
		FileCopyDir, % hPath, % %hGame%.MainDir, 1
	}
	
	If (action = "pull")
	{
		loop files, % hPath "\*.*", R
		{
			StringReplace, gFile, A_LoopFileFullPath, % hPath, % %hGame%.MainDir, All
			FileCopy, % gFile, % A_LoopFileFullPath, 1 ; overwrite hud files with gamefiles
		}
	}
	
	If (action = "clean")
	{
		If !( InStr( FileExist(whPath), "D") )
			return

		loop files, % whPath "\*.*", R ; move backed up hud gamefiles to gamefolder
		{
			StringReplace, gFile, A_LoopFileFullPath, % whPath, % %hGame%.MainDir, All
			FileMove, % A_LoopFileFullPath, % gFile, 1
		}
		FileRemoveDir, % whPath, 1 ; delete backup hud folder
	}

	If (action = "backup")
	{
		If !( InStr( FileExist(whPath), "D") ) ; backup folder does not exist - setup backup folder
		{
			FileCopyDir, % hPath, % whPath, 1 ; copy hud folder
			
			loop files, % whPath "\*.*", R ; grab default gamefiles from gamefolder
			{
				StringReplace, gFile, A_LoopFileFullPath, % whPath, % %hGame%.MainDir, All

				If FileExist(gFile) ; if there is a gamefile version of the backupfile available
					FileCopy, % gFile, % A_LoopFileFullPath, 1 ; overwrite the backup with gamefile
			}
		}
		else ; backup folder exists - check changes in hud folder and apply to backup folder
		{
			Loop, % hPath "\*.*", 1, 1
			{
				If( InStr( FileExist(A_LoopFileFullPath), "D") )
				{
					StringReplace, nFolder, A_LoopFileFullPath, % hPath, % whPath, All
					
					If !( InStr( FileExist(nFolder), "D") ) ; if looped hud folder does not exist in backup folder
						FileCreateDir, % nFolder ; create it
				}
				else
				{
					StringReplace, backupFile, A_LoopFileFullPath, % hPath, % whPath, All
					StringReplace, gFile, A_LoopFileFullPath, % hPath, % %hGame%.MainDir, All

					; if looped hud file does not exist in backup folder and a gamefile version is available
					If !FileExist(backupFile) and FileExist(gFile)
						FileCopy, % gFile, % backupFile ; grab default gamefile from gamefolder
				}
			}
			
			Loop, % whPath "\*.*", 0, 1 ; restore files that exist in backup hud folder but do not exists in hud folder to gamefolder
			{
				StringReplace, backupFile, A_LoopFileFullPath, % whPath, % hPath, All
				StringReplace, gFile, A_LoopFileFullPath, % whPath, % %hGame%.MainDir, All

				If !FileExist(backupFile) ; if backupFile does not exist in hud folder
					FileMove, % A_LoopFileFullPath, % gFile, 1 ; move backed up file to game
			}
		}
	}
}

setup(action) {
	global
	DetectHiddenWindows, On

	msgbox, 262212, ,
	( LTrim
	Enable hud editing?
	
	This can take up to ~30 minutes
	and will use 5-20 GB of disc space
	)
	IfMsgBox, No
		return
	
	left4dead_PakDirs := ["left4dead", "left4dead_dlc3"]
	left4dead2_PakDirs := ["left4dead2", "left4dead2_dlc1", "left4dead2_dlc2", "left4dead2_dlc3", "update"]
	
	If (action = "install")
	{
		If (GetFileFolderSize(%hGame%.dir) >= GetFreeDriveSpace(%hGame%.Dir))
		{
			msgbox, Not enough drive space available
			return
		}
		
guiSetup("Gathering files")
		
		cmd_fileRemoveDir(%hGame%.DirDD)					; attempt to delete previous dev installation
		cmd_fileCopyDir(%hGame%.Dir, %hGame%.DirDD)			; copy vanilla installation
		
		setGame("dev")
		
		msgbox, 262212, ,
		( Ltrim
		'Verify integrity of game cache' of selected game through steam before continuing!
		
		This will only affect a copy of the game's installation. Your main installation is backed up and will be restored when the setup is complete or cancelled
		
		Continue when steam has completed verifying and finished downloading any broken or missing files
		
		Continue setup?
		)
		IfMsgBox No
		{
			setGame("vanilla")
			cmd_fileRemoveDir(%hGame%.DirDD)
			exitapp
		}
		
guiSetup("Extracting")
		
		loop % %hGame%_PakDirs.MaxIndex()	; extract pak01_dir.vpk's
		{
			If (hGame = "left4dead") or (hGame = "left4dead2")
				vpk_Extract(%hGame%.Dir "\" %hGame%_PakDirs[A_Index] "\pak01_dir.vpk")
		}
		
guiSetup("Cleanup")
		
		loop % %hGame%_PakDirs.MaxIndex()	; delete pak01_dir.vpk's
			Loop Files, % %hGame%.Dir "\" %hGame%_PakDirs[A_Index] "\*.vpk"
				cmd_fileDelete(A_LoopFileFullPath)
				
guiSetup("Merging")
		
		loop % %hGame%_PakDirs.MaxIndex()	; merge extracted pak01_dir.vpk's
		{
			If (hGame = "left4dead") or (hGame = "left4dead2")
				cmd_fileMoveDir(%hGame%.Dir "\" %hGame%_PakDirs[A_Index] "\pak01_dir", %hGame%.Dir "\" %hGame%_PakDirs[A_Index])
		}
		
guiSetup("More merging")
		
		loop % %hGame%_PakDirs.MaxIndex()	; merge dlc folders
			cmd_fileMoveDir(%hGame%.Dir "\" %hGame%_PakDirs[A_Index], %hGame%.Dir "\" %hGame%_PakDirs[1])
		
guiSetup("Rebuilding audio cache")
		
		If (hGame = "left4dead") or (hGame = "left4dead2")
		{
			; rebuild sound cache
			FileDelete, % %hGame%.Dir "\" %hGame%_PakDirs[1] "\cfg\valve.rc"
			FileAppend, snd_rebuildaudiocache`nexit, % %hGame%.Dir "\" %hGame%_PakDirs[1] "\cfg\valve.rc"
			runGame(%hGame%.AppId, "-w 1 -h 1")
			WinHide, % "ahk_id " gHwnd
			WinWaitClose, % "ahk_id " gHwnd
			
			Loop, % %hGame%.Dir "\" %hGame%_PakDirs[1] "\addons", 0, 0 ; delete any .ddl plugins that will cause an prompt on l4d2 startup
				FileDelete, % A_LoopFileFullPath ; while keeping addons\workshop folder intact so it they will be disabled in addonlist.txt by setcfg
			Gosub writeGameConfig
		}
		
		setGame("vanilla")
		
		gui setup: Destroy
	}

	If (action = "uninstall")
	{
		SplashTextOn, 200, 25, Disabling, Hold on..
		cmd_fileRemoveDir(%hGame%.DirDD)
		SplashTextOff
	}

	DetectHiddenWindows, Off
}

overlay(winHwnd="") {
	If (winHwnd = "") ; close overlay
		run, % A_ScriptDir "\res\overlay.exe", , UseErrorLevel, overlayPID

	If !(winHwnd = "") ; run overlay
		run, % A_ScriptDir "\res\overlay.exe " winHwnd, , UseErrorLevel, overlayPID
}

writeGameConfig:
	; \cfg\
	FileDelete, % %hGame%.MainDir "\cfg\autoexec.cfg"
	FileAppend, exec editor\autoexec.cfg, % %hGame%.MainDir "\cfg\autoexec.cfg"
	
	FileDelete, % %hGame%.MainDir "\cfg\config.cfg"
	FileAppend, , % %hGame%.MainDir "\cfg\config.cfg"

	FileDelete, % %hGame%.MainDir "\cfg\config_default.cfg"
	FileAppend, , % %hGame%.MainDir "\cfg\config_default.cfg"

	FileDelete, % %hGame%.MainDir "\cfg\valve.rc"
	FileAppend, exec autoexec.cfg, % %hGame%.MainDir "\cfg\valve.rc"

	; \cfg\editor\
	FileRemoveDir, % %hGame%.MainDir "\cfg\editor", 1
	FileCreateDir, % %hGame%.MainDir "\cfg\editor"
	If (hGame = "left4dead") or (hGame = "left4dead2")
	{
		FileAppend, % L4D_autoexec, % %hGame%.MainDir "\cfg\editor\autoexec.cfg"
		
		If (Setting.loadMapOnStartUp = 1)
		{
			If (hGame = "left4dead")
				FileAppend, % "`nmap " . Setting.left4dead_map . " " . Setting.gameMode, % %hGame%.MainDir "\cfg\editor\autoexec.cfg"
			If (hGame = "left4dead2")
				FileAppend, % "`nmap " . Setting.left4dead2_map . " " . Setting.gameMode, % %hGame%.MainDir "\cfg\editor\autoexec.cfg"
		}

		If (Setting.hideWorld = 1)
			FileAppend, % "`nr_drawworld 0`nr_drawentities 0", % %hGame%.MainDir "\cfg\editor\autoexec.cfg"
	}

	; addonlist
	FileRead, addonlist, % %hGame%.MainDir "\addonlist.txt"
	StringReplace, addonlistD, addonlist, "1", "0", All
	FileDelete, % %hGame%.MainDir "\addonlist.txt"
	FileAppend, % addonlistD, % %hGame%.MainDir "\addonlist.txt"
	
	Loop, % %hGame%.MainDir "\addons\*.*", 0, 0
	{
		SplitPath, A_LoopFileFullPath, , , OutExtension
		
		If !(OutExtension = "vpk")
			FileDelete, % A_LoopFileFullPath
	}
return

checkGameClose:
	DetectHiddenWindows, On
	
	If !WinExist("ahk_id " gHwnd)
	{
		SetTimer, checkGameClose, Off
		Gosub handleGameClose
	}
	
	DetectHiddenWindows, Off
return

handleGameClose:
	Gosub disableHotkeys
		
	IfWinExist, % "ahk_id " textEditorHwnd
	{
		WinWait, % "ahk_id " textEditorHwnd
		WinKill
		textEditorPID := ""
		textEditorHwnd := ""
	}
	
	gui editor: Destroy
	
	overlay()
	
	moveHud("pull")
	moveHud("clean")
	
	setGame("vanilla")
	
	Gosub iniSave
	
	guiMain()
return

reloadScript:
	If (debugEditor = 1)
	{
		Gosub SaveGuiEditorPos
		Gosub iniSave
		reload
		return
	}
	
	WinKill, % "ahk_id " WinExist("ahk_class Notepad")
	reload
return

SaveGuiEditorPos:
	WinGetPos( _guiEditor, editorX, editorY, , , 1 )
	Setting.editorX := editorX
	Setting.editorY := editorY
return

disableHotkeys:
	If !(textEditorHwnd = "")
	{
		hotkey, IfWinActive, % "ahk_id " textEditorHwnd
			hotkey, ~^s, Off
		hotkey, IfWinActive
	}
	HotKey, F5, Off
	HotKey, F6, Off
	HotKey, F8, Off
	HotKey, F9, Off
return

enableHotkeys:
	If !(textEditorHwnd = "")
	{
		hotkey, IfWinActive, % "ahk_id " textEditorHwnd
			hotkey, ~^s, On
		hotkey, IfWinActive
	}
	HotKey, F5, On
	HotKey, F6, On
	HotKey, F8, On
	HotKey, F9, On
return

reloadHud:
	DetectHiddenWindows, On
	
	activeWindow("save")
	
	Send {Control Down}s{Control Up}	; send control s to text editor
	
	If (Setting.hudReloadMode = "ui_reloadscheme") and (Setting.ReopenMenu = 1) and !(Setting.CloseMenuPosX = "") and !(Setting.CloseMenuPosY = "")
	{
		IfWinExist, % "ahk_id " textEditorHwnd
			WinHide, % "ahk_id " textEditorHwnd
		
		overlay()
		
		WinActivate, % "ahk_id " gHwnd
		
		MouseMove, % Setting.CloseMenuPosX, % Setting.CloseMenuPosY, 0
		sleep 100
		click
	}
	
	If (Setting.hudReloadMode = "ui_reloadscheme")
	{
		execKey("{f7}", "dontSavePos")	; ui_reloadscheme needs to be bound to this key
	}
	If (Setting.hudReloadMode = "hud_reloadscheme")
	{
		If (PanelCvar = "team") or (PanelCvar = "info")	; hide debugPanel by sending alt f4
			execKey("!{F4}")
		
		execKey("{f3}", "dontSavePos")	; hud_reloadscheme needs to be bound to this key
		
		If !(PanelCvar = "")
			execCvar("showpanel " PanelCvar, "dontSavePos")
	}
	
	If (Setting.ReopenMenu = 1) and !(Setting.OpenMenuPosX = "") and !(Setting.OpenMenuPosY = "")
	{
		MouseMove, % Setting.OpenMenuPosX, % Setting.OpenMenuPosY, 0
		sleep 100
		click
		
		IfWinExist, % "ahk_id " textEditorHwnd
			WinShow, % "ahk_id " textEditorHwnd
			
		overlay(gHwnd)
	}
	
	If (Setting.hudReloadMode = "hud_reloadscheme")
		sleep 150 ; wait till hud_reloadscheme is complete to prevent the game moving cursor after restoring cusor pos

	activeWindow("restore")
return

activateEditorGui:
	DetectHiddenWindows, On
	
	overlay(gHwnd)
	
	IfWinExist, % "ahk_id " textEditorHwnd
	{
		WinShow, % "ahk_id " textEditorHwnd
		; WinRestore, % "ahk_id " textEditorHwnd
	}
	gui editor: Show
	
	activeWindow("restore")
	activateGameActiveWindowSaved := 0
return

activateGame:
	DetectHiddenWindows, On

	If !(activateGameActiveWindowSaved = 1)
		activeWindow("save")
	activateGameActiveWindowSaved := 1
	
	IfWinExist, % "ahk_id " textEditorHwnd
	{
		WinHide, % "ahk_id " textEditorHwnd
		; WinMinimize, % "ahk_id " textEditorHwnd
	}
	gui editor: Hide
	
	overlay()
	
	WinActivate, % "ahk_id " gHwnd
return

execCvar(cvar, dontSavePos = "") {
	global hGame, gHwnd
		
	If (dontSavePos = "")
		activeWindow("save")
	
	FileDelete, % %hGame%.MainDir "\cfg\guiEditor_temp.cfg"
	FileAppend, % cvar, % %hGame%.MainDir "\cfg\guiEditor_temp.cfg"
	
	WinActivate, % "ahk_id " gHwnd
	Send {F4}
	
	If (dontSavePos = "")
		activeWindow("restore")
}

execKey(key, dontSavePos = "") {
	global hGame, gHwnd
	
	If (dontSavePos = "")
		activeWindow("save")
	
	WinActivate, % "ahk_id " gHwnd
	Send % key
	
	If (dontSavePos = "")
		activeWindow("restore")
}