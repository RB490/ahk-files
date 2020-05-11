;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;SendMode InputThenPlay  ; Testing for new scripts.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Mod of rrhuffy http://www.autohotkey.com/community/viewtopic.php?p=539379#p539379
; by Guest (very nice guy, really)

/*
SpeedRead Instructions

To use SpeedReader paste text into the reading window. Set the number of words in a group (1, 2, or 3),
the number of words to jump and the speed in words per minute. Click Read> to start.

Use the left and right arrows to jump back or forward that number of words while running.
Hit the space bar to pause.Space bar again to resume.
Escape to stop and escape again to exit the program.

*/

#SingleInstance,Force
#Persistent
;#NoTrayIcon

SetBatchLines,-1
SetFormat,Float,0.2
gui, font, s8, arial   ; Preferred font.
SetTitleMatchMode, 2
NumberOfWords=
NumberOfDots=
NumberOfDisplayedWords=2
ReadDelay:=60000/500
DotDelay:=2*ReadDelay
ReadBreakCode := 1
ReadCount=
WantedPosition = 0
Jump=20

transform, PercentSign, chr, 37

Gui, +AlwaysOnTop ;  -caption  -ToolWindow -SysMenu
;gui, font,, Arial
;Gui, Font, s20 , courier new
;Gui, Add, Text, x15 y17 w100 h50 vWordLeft Right, left
Gui, Font, s31
Gui, Add, Text, x2 y2 w580 h56 vTextLargeDisplay Center, ***clipboard too small***
;Gui, Font, s20
;Gui, Add, Text, xp+400 y17 w100 h50 vWordRight Left, right
Gui, Font, s8
Gui, Add, Button, x2 y65 w50 h30 +0x8000 vButtonRead gButtonRead Default, &Read >
Gui, Add, GroupBox, xp+54 y57 w50 h39, Words
Gui, Add, DropDownList, x60 y70 w41 h20 R3 vDropdownNumber gDropdownNumber,1||2|3|

Gui, Add, GroupBox, xp+48 y57 w40 h39, Jump
Gui, Add, Edit, x115 y71 w30 h20 vJumpSpeed gJumpSpeed,20

Gui, Add, GroupBox, x155 y57 w520 h39, Speed (wpm)
Gui, Add, Edit, xp+4 y71 w40 h20 +center vEditSpeed gEditSpeed, 500
Gui, Add, Slider, xp+43 y71 w375 h20 vSliderSpeed gSliderSpeed Range200-1000 TickInterval50 AltSubmit, 500
Gui, Add, Progress, x0 y97 w570 h10 vProgressBar, 25
Gui, Add, Edit, xp+4 yp+14 h90 w575 vEditText, 
Gui, -Resize +e0x20000
Gui, Show, x336 y221 h227 w580 , SpeedReader ; 2 words display
Gui, Add, StatusBar,, Number of words in the clipboard: 0
SB_SetParts(260)
GuiControl,, ProgressBar,0
Return

OnClipboardChange:
;ToolTip Loading clipboard to SpeedReader
;Sleep 500
if A_EventInfo = 1
{
   GoSub, COUNT
   Gui, Font, s31
   GuiControl,,TextLargeDisplay,***clipboard too small***
   Gui, font, s8, arial   ; Preferred font.
}
if NumberOfWords > 10
{
   StringReplace, ClipboardString, clipboard, `r`n, , All
   StringReplace, ClipboardString, ClipboardString, ., .%A_Space% , All
   StringReplace, ClipboardString, ClipboardString, `,, `,%A_Space% , All
   GoSub, DisplayFullClipboard
   Gui, show ;+AlwaysOnTop ;  -caption  -ToolWindow -SysMenu
}
;ToolTip  ; Turn off the tip.
return


COUNT:
GuiControlGet, ClipboardString, , EditText
NumberOfWords=
StringReplace, ClipboardString, ClipboardString, %A_Space%, %A_Space%, UseErrorLevel
NumberOfWords=%ErrorLevel%
SB_SetText("Number of words: " NumberOfWords,1)
NumberOfDots=
StringReplace, ClipboardString, ClipboardString, ., ., UseErrorLevel
NumberOfDots=%ErrorLevel%
GoSub, EstimateReadingTime
Return

#IfWinActive SpeedReader
$WheelDown::
$Left::
ControlGetFocus, Focus, SpeedReader
If (Focus = "Edit3") and (A_ThisHotkey = "$Left")
	{  
	 Send {Left}
	 Return
	}
WantedPosition = %ReadCount%
WantedPosition -= %Jump%
if(WantedPosition < 0)
   WantedPosition = 1
return

$WheelUp::
$Right::
ControlGetFocus, Focus, SpeedReader
If (Focus = "Edit3") and (A_ThisHotkey = "$Right")
	{
	 Send {Right}
	 Return
	}
WantedPosition = %ReadCount%
WantedPosition += %Jump%
if(WantedPosition > NumberOfWords)
{
   WantedPosition = 0
}
else
return

~Shift & WheelUp::
$Up::
ControlGetFocus, Focus, SpeedReader
If (Focus = "Edit3") and (A_ThisHotkey = "$Up")
	{
	 Send {Up}
	 Return
	}
GuiControlGet,WordPerMinute,,SliderSpeed,
WordPerMinute := WordPerMinute + 50
GuiControl, , SliderSpeed, %WordPerMinute%
GoSub, SliderSpeed
return

~Shift & WheelDown::
$Down::
ControlGetFocus, Focus, SpeedReader
If (Focus = "Edit3") and (A_ThisHotkey = "$Down")
	{
	 Send {Down}
	 Return
	}
GuiControlGet,WordPerMinute,,SliderSpeed,
WordPerMinute := WordPerMinute - 50
GuiControl, , SliderSpeed, %WordPerMinute%
GoSub, SliderSpeed
return

~MButton::
$Space::
pause
Return

Esc::
if(ReadBreakCode == 0)
{
   ReadBreakCode := 1
}
else
{
   ExitApp
}
return
#IfWinActive

ButtonRead:
Gosub, Count
ReadCount=0
ProgressTime=
ReadBreakCode=0
DisplayTextString=
GuiControlGet,NumberOfDisplayedWords,,DropdownNumber,
GuiControl,disable,DropdownNumber
; This prevents the parsing loop to skip the last/ 2 last words
GuiControl,,TextLargeDisplay,
Gui, Font, s31, arial
GuiControl, Font, TextLargeDisplay
GuiControl, +center, TextLargeDisplay
GuiControlGet, ClipboardString, , EditText

Loop,Parse,ClipboardString,%A_Space%
{
   ;~ Tooltip, %ReadCount% %WantedPosition% %ReadBreakCode%
   ReadCount+=1
   if(WantedPosition != 0 && WantedPosition < ReadCount || ReadBreakCode == 1) ; if we want to be before actual position then we have to leave loop
	  break
   else if(WantedPosition != 0 && WantedPosition > ReadCount)
   {
	  ;~ Tooltip, Continued...%ReadCount% / %WantedPosition%
	  continue
   }
   else if( WantedPosition != 0 && WantedPosition == ReadCount) ; last statement, for readability
   {
	  WantedPosition := 0 ; when equal 0, then we dont want to change position of text
   }
   ProgressValue:=100.0*ReadCount/NumberOfWords
   GuiControl,, ProgressBar,%ProgressValue%
;   Delay:=ln(StrLen(A_LoopField))*ReadDelay
;   Sleep %Delay%
   if DoubleWord < %NumberOfDisplayedWords%
   {
	  DisplayTextString=%DisplayTextString% %A_LoopField%
	  DoubleWord+=1
	  continue
   }
   else
   {
	  GuiControl,,TextLargeDisplay,%DisplayTextString%
	  StringRight, Q, DisplayTextString, 1
	  IfEqual, Q,.
	  {
		 Sleep %DotDelay%
		 ProgressTime+=DotDelay/500.0
	  }
	  Sleep %ReadDelay%
	  DisplayTextString=%A_LoopField%
	  DoubleWord=1
   }
   ProgressTime+=ReadDelay/1000.0
   String=Reading time: %ProgressTime% s
   SB_SetText(String,2)
}
if(WantedPosition != 0 && WantedPosition < ReadCount && ReadBreakCode == 0) ; loop ended but we wanted to rewind
{
   Goto, ButtonRead ; go to loop, then (in loop) rewind to wanted position
}
else
{
   ReadBreakCode = 1 ;after end of text prepare ESC button to close by setting this to 1
}
GuiControl,,TextLargeDisplay,%DisplayTextString%
Sleep %ReadDelay%
Sleep %DotDelay%
GuiControl,enable,DropdownNumber
GoSub, DisplayFullClipboard
GoSub, EstimateReadingTime
GuiControl,, ProgressBar,0
Return

JumpSpeed:
GuiControlGet,Jump,,JumpSpeed,
return

SliderSpeed:
GuiControlGet,WordPerMinute,,SliderSpeed, ; WordPerMinute in wpm
ReadDelay:=60000/WordPerMinute
GoSub, EstimateReadingTime
GuiControl,,EditSpeed,%WordPerMinute%
return


EditSpeed:
GuiControlGet,WordPerMinute,,EditSpeed, ; WordPerMinute in wpm
ReadDelay:=60000/WordPerMinute
GoSub, EstimateReadingTime
GuiControl,,SliderSpeed,%WordPerMinute%
return


DropdownNumber:
GuiControlGet,NumberOfDisplayedWords,,DropdownNumber,
GuiControlGet,WordPerMinute,,EditSpeed, ; WordPerMinute in wpm
GoSub, EstimateReadingTime
return


EstimateReadingTime:
DotDelay:=2*ReadDelay
TotalTime:=(ReadDelay*NumberOfWords/NumberOfDisplayedWords+DotDelay*NumberOfDots)/1000.0
String=Estimated reading time: %TotalTime% s
SB_SetText(String,2)
return


DisplayFullClipboard:
Gui, Font, s7 ; , small fonts ; this is all I changed 123
GuiControl, Font, TextLargeDisplay
GuiControl, +left, TextLargeDisplay
GuiControl,,TextLargeDisplay,%ClipboardString%
Gui, font, s8, arial   ; Preferred font.
return:


GuiSize:
If A_EventInfo=1
  Return
GuiControl,Move,listview, % "W" . (A_GuiWidth - 10) . " H" . (A_GuiHeight - 77)
GuiControl,Move,box3, % "x" (A_GuiWidth - 350) "W" . (A_GuiWidth - 300) . " H" . (72)
Return


GuiClose:
ExitApp