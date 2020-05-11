/*
Func: windowClassActive
    Checks if a window is active or under mouse

Parameters:
	input		-	Target window ahk_class value found by WindowSpy
*/
WinClassActive(input) {
	CoordMode, Mouse, Screen ; Coordinates are relative to the desktop (entire screen) 
    
	input := LTrim(input, "ahk_class ") ; cleanup input

    WinGetClass, activeWinClass, A
	MouseGetPos, , , _OutputVarMouseWin
	WinGetClass, underMouseClass, % "ahk_id " _OutputVarMouseWin ; get window under mouse class

	If (activeWinClass = input) or (underMouseClass = input)
		return true ; active window is osrs
		
	return false ; both checks failed
}