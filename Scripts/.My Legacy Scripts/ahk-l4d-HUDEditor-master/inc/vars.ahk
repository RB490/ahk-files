setVars:
	If (A_Is64bitOS)
		SetRegView 64

	If (DirG1 = "")
		RegRead, DirG1, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 500, InstallLocation
	If (DirG1 = "")
		RegRead, DirG1, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 500, InstallLocation

	If (DirG2 = "")
		RegRead, DirG2, HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 550, InstallLocation
	If (DirG2 = "")
		RegRead, DirG2, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 550, InstallLocation
		
	global left4dead := {}
	left4dead.Dir := DirG1
	left4dead.DirDD := DirG1 " - DEV"
	left4dead.DirVD := DirG1 " - VANILLA"
	left4dead.MainDir := DirG1 "\left4dead"
	left4dead.sDir := A_MyDocuments "\editor2\left_4_dead"
	left4dead.bDir := A_MyDocuments "\editor2\left_4_dead\_backup"
	left4dead.HudTemplate := A_ScriptDir "\res\templates\new_l1"
	left4dead.AppId := 500

	global left4dead2 := {}
	left4dead2.Dir := DirG2
	left4dead2.DirDD := DirG2 " - DEV"
	left4dead2.DirVD := DirG2 " - VANILLA"
	left4dead2.MainDir := DirG2 "\left4dead2"
	left4dead2.sDir := A_MyDocuments "\editor2\left_4_dead_2"
	left4dead2.bDir := A_MyDocuments "\editor2\left_4_dead_2\_backup"
	left4dead2.HudTemplate := A_ScriptDir "\res\templates\new_l2"
	left4dead2.AppId := 550

	gClass := "ahk_class Valve001"

	ini_File := A_ScriptDir "\" A_ScriptName ".ini"

	L4D_autoexec=
	( LTrim
		clear
		echo editor_autoexec loaded

		//Alias
		alias gear "give health; give autoshotgun; give molotov; give first_aid_kit; give pain_pills; give pistol"

		//Alias-BOTS
		alias add.bots "sb_add; sb_add; sb_add"
		alias del.bots "kick Bill; kick Zoey; kick Louis; kick Francis;"
		alias rate_A1 "add.bots; alias bots.toggle rate_A2"
		alias rate_A2 "del.bots; alias bots.toggle rate_A1"
		alias bots.toggle rate_A1

		//General
		sv_cheats 1
		sv_consistency 0
		sv_pure 0
		sv_pausable 1
		con_enable 1
		closecaption 1

		director_no_death_check 1

		director_stop
		nb_blind 1
		nb_delete_all
		add.bots

		vs_max_team_switches 5000
		sb_all_bot_team 1
		sb_all_bot_game 1

		hud_zombieteam_showself 1

		//General-L2
		sv_vote_creation_timer 1
		sv_vote_failure_timer 1
		sv_vote_plr_map_limit 1

		unbindall
		//Binds-editor
		bind "F3" "hud_reloadscheme"
		bind "F4" "exec guiEditor_temp"
		bind "F7" "ui_reloadscheme"

		//Binds-defaults
		bind "ESCAPE" "cancelselect"
		bind "`" "toggleconsole"
		bind "START" "gameui_activate"

		bind "TAB" "+showscores"
		bind "SPACE" "+jump"
		bind "0" "slot10"
		bind "1" "slot1"
		bind "2" "slot2"
		bind "3" "slot3"
		bind "4" "slot4"
		bind "5" "slot5"
		bind "6" "slot6"
		bind "7" "slot7"
		bind "8" "slot8"
		bind "9" "slot9"
		bind "a" "+moveleft"
		bind "d" "+moveright"
		bind "e" "+use"
		bind "f" "impulse 100"
		bind "h" "motd"
		bind "m" "chooseteam"
		bind "c" "+voicerecord"
		bind "q" "lastinv"
		bind "r" "+reload"
		bind "s" "+back"
		bind "t" "impulse 201"
		bind "u" "messagemode2"
		bind "w" "+forward"
		bind "y" "messagemode"
		bind "z" "+mouse_menu Orders"
		bind "x" "+mouse_menu QA"
		bind "CTRL" "+duck"
		bind "SHIFT" "+speed"
		bind "F1" "Vote Yes"
		bind "F2" "Vote No"
		bind "MWHEELDOWN" "invnext"
		bind "MWHEELUP" "invprev"
		bind "MOUSE1" "+attack"
		bind "MOUSE2" "+attack2"
		bind "MOUSE3" "+zoom"
	)
return