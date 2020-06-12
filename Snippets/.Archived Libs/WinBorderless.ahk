WinBorderless(hwnd) {
	GetWindowInfo(hwnd)
	
	If !IsObject(WI := GetWindowInfo(hwnd)) {
	   MsgBox, 0, WINDOWINFO, ERROR - ErrorLevel: %ErrorLevel%
	   ExitApp
	}
	
	If (WI.XBorders = 0) and (WI.YBorders = 0)
		return 1
	return
}