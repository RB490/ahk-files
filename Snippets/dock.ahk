IfWinNotExist, ahk_exe notepad.exe
	run, C:\Windows\notepad.exe

SetWinDelay,0
WinWaitActive,AHK_class Notepad
WinGetActiveStats,Title, Width,Height,X,Y 
Gui,+AlwaysOnTop +ToolWindow -Caption
Gui, Show,% "x" X + Width - 145 "." "y" Y + Height - 35 "." "w120 h30 NA",
SetTimer,MoveW,10
Return

MoveW:
	IfWinNotActive,AHK_class Notepad
		Gui,Hide
	Else
	{
		WinGetActiveStats,Title, Width,Height,X,Y
		Gui, Show,% "x" X + Width - 145 "." "y" Y + Height - 35 "." "w120 h30 NA",
	}
Return

GuiClose:
ExitApp
