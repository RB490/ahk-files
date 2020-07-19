guiSetup(action) {
	global hGame
	static _guiSetup, setupAction

	If !WinExist("ahk_id " _guiSetup)
	{
		gui setup: new
		gui setup: default
		gui setup: +LabelguiSetup_ +Hwnd_guiSetup
		gui setup: margin, 5, 5
		
		gui setup: add, text, y+5 w200, Setup
		gui setup: font, s12, verdana
		gui setup: add, text, w200 vsetupAction, % action
		
		gui setup: show, AutoSize
	}
	else
		GuiControl setup:, setupAction, % action
	return
	
	guiSetup_Close:
		If !( InStr( FileExist(%hGame%.DirDD), "D") )
		{
			msgbox, 68, , Cancelling during this stage of the setup`nWILL BREAK YOUR GAME INSTALLATION `n`nCancel setup?
			IfMsgBox, No
				return
			reload
			return
		}
		
		msgbox, 68, , Cancel setup?
		IfMsgbox, No
			return

		setup("Cancelling")
		
		Loop {
		process, close, robocopy.exe
		process, close, vpk.exe
		cmd_fileRemoveDir(%hGame%.DirDD)
		} Until !( InStr( FileExist(%hGame%.DirDD), "D") )
			
		reload
	return
}
