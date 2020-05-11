/*
 *		Millisecond Timer
 */
 
 AdjTime = 0
 
;Timer GUI
	Gui , Timer:Margin, 5, 5
	Gui , Timer:Font , s18 , Courier Bold
	Gui , Timer:Add , Text , Center, 00:00:00:000
	Gui , Timer:Font , s10 , Verdana
	Gui , Timer:Add , Button , w80 gStop Section , Stop
	Gui , Timer:Add , Button , xs ys w80 gStart, Start
	Gui , Timer:Add , Button , x+5 w20 gReset , Reset
	Gui , Timer:+AlwaysOnTop
	Gui , Timer:Show , , Timer
	Control , Hide , , Button1 , Timer
	Exit
 
Start:
	Control , Hide , , Button2 , Timer
	Control , Show , , Button1 , Timer
	GuiControl , Focus , Button1
	StopClock = 0	
	ControlGetText , DisplayTime , Static1
	ST := A_TickCount ; Start Time
	While StopClock = 0
		ControlSetText 	, Static1 , % FormatCT((A_TickCount - ST) + AdjTime)
	StopClock = 0
	Exit
 
Stop:
Reset:
	Control , Show , , Button2 , Timer
	Control , Hide , , Button1 , Timer
	GuiControl , Focus , Button2
	StopClock = 1
	IF (A_ThisLabel = "Reset")
	{
		AdjTime = 0
		ControlSetText , Button2 , Start
		ControlSetText 	, Static1 , 00:00:00:000
	}else{
		AdjTime := ((A_TickCount - ST) + AdjTime)
		ControlSetText , Button2 , Continue
	}
	Exit
	
TimerGuiClose:
	ExitApp
 
FormatCT(ms)  ;  Formats milliseconds into 00:00:00:000 (last three digits are milliseconds)
{
	StringRight , mil , ms , 3
	StringTrimRight , sec , ms , 3
	min := Floor(sec/60)
	sec := sec-(min*60)
	hrs := Floor(min/60)
	min := min-(hrs*60)
	While StrLen(sec) <> 2
		sec := "0" . sec
	While StrLen(mil) <> 3
		mil := "0" . mil
	While StrLen(min) <> 2
		min := "0" . min
	While StrLen(hrs) <> 2
		hrs := "0" . hrs 
	return , hrs . ":" . min . ":" . sec . ":" . mil
}

~^s::reload