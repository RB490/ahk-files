/*
	Parameters
		msgbox = 	if msgbox should be displayed when returning value
	
	Returns
		converted time between calls in 24hours:mins:secs:milisecs
*/
timerFunc(msgbox = "") {
	static mode, startTime, stopTime, startTicks, stopTicks
	
	mode :=! mode
	If (mode) { ; record start time
		startTicks := A_TickCount
	}
	else {
		stopTicks := A_TickCount - startTicks
		stopTicksFormatted := FormatTickCount(stopTicks)
		
		If (msgbox)
			MsgBox, 64, timerFunc(), Time taken:`t%stopTicksFormatted%
		return stopTicks
	}
}