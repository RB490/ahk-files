; ------------ SETTINGS FOR BELOW SCRIPT --------------
#SingleInstance force
#Persistent
#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%

; complete path to the storage file
inifile = %A_ScriptDir%\AHKcommands.ini

; program name
progname = QuickLaunchy

; author
author = Gaurav Sharma

; commands file
commandsfile = %A_ScriptDir%\AHKcommands.txt

;------------ SETTINGS ENDS -------------------------;


;------------------------ Main Window ------------------------;
Gui, Default
Gui, Font, S10 CDefault, Verdana
Gui, Add, Button, vhelpbutton x360 y5 w15 h20 , '?'
Gui, Add, Button, vrunbutton x266 y45 w35 h25 Default , &Run
Gui, Add, Button, vcancelbutton x306 y45 w55 h25 , &Cancel
Gui, Add, Button, gSettingsButton x16 y80 w80 h25 , &Settings
Gui, Add, Edit, vkeyword x16 y45 w230 h25
Gui, Font, S14 CDefault Bold, Verdana
Gui, Font, S12 CDefault Bold, Verdana
Gui, Add, Text, x16 y15 w300 h20 , Enter Program Keyword
Gui, Show, h120 w379, %progname% By %author%

; focus on the vkeyword edit textfield
ControlFocus, Edit1 ,%progname%
if ErrorLevel
	MsgBox,,%progname%, could not focus on keyword textfield
WinSet, AlwaysOnTop, on, %progname%
WinGetActiveTitle, ATitle
IfInString, ATitle, %progname%
{
	ControlFocus, Edit1, %progname%
	if ErrorLevel
	{
		MsgBox,64,%progname%, could not focus on keyword textfield
	}
	else
	{
		showToolTip()
	}
}
return

;;;;;;;;;;;;;;;;;; Question mark button clicked ;;;;;;;;;;;;;;;;;;;;;;;;
Button'?':
Gui, +OwnDialogs
MsgBox, 64, About - %progname%, %progname% - Created By - %author%`n`nFeature Suggestions, Bugs, Feedback`nvashishtgauravsharma@gmail.com`n`nCredits: `nWithout these libraries this small utility wouldn't have been completed`nIntellisense -  http://www.autohotkey.com/forum/viewtopic.php?t=557`nIni Lib - http://www.autohotkey.com/forum/viewtopic.php?t=46226`n`nMany thanks to the author of above libraries.
return

;;;;;;;;;;;;;;;;;; Run button clicked ;;;;;;;;;;;;;;;;;;;;;;;;
ButtonRun:
Gui, Submit
IniRead, OutputVar, %inifile%, %keyword%, Path
Run %OutputVar%, ,UseErrorLevel
if ErrorLevel = ERROR
	MsgBox, 64, Error - %progname%, File located at "%OutputVar%" could not be found.
Gui, Destroy
ExitApp
return

; code that will execute when the user clicks "cancel" or "close" button or presses escape button
GuiClose:
GuiEscape:
ButtonCancel:
Gui, Destroy
ExitApp
return

;----------------- Setting button clicked ------------------------;
SettingsButton:
Gui, 2:Destroy
Gui, 2:Default ;this makes sure that listview control is populated with all values properly
Gui, 2:Font, S10 CDefault, Verdana
;IniSettingsEditor(progname, inifile, 0, 0)
Gui, 2:Add, ListView, ginientries vinientries -LV0x10 AltSubmit x16 y15 w440 h140 -Multi, ProgKeyword|Path
Gui, 2:Add, Button, vaddbutton x16 y175 w60 h25 , &Add
Gui, 2:Add, Button, x136 y175 w100 h25 , &Cancel
Gui, 2:Add, Button, x256 y175 w100 h25 , &Edit
Gui, 2:Add, Button, x366 y175 w90 h25 , &Delete
Gui, 2:Show, x131 y91 h223 w477, Settings - %progname%

; Read the entire inifile in a variable named "ini"
FileRead, ini, %inifile%

; Get all the sections of the inifile in sections variable
sections := ini_getAllSectionNames(ini)

; loop through the sections and add one by one to the listview control
Loop, Parse, sections, `,
{
    LV_Add("", A_LoopField, ini_getValue(ini, A_LoopField, "Path"))
}
;LV_Modify(1, "Select")

;sort the listview control based on the keyword (alphabetical, ASC)
LV_ModifyCol(1, "Sort")

LV_ModifyCol()  ; Auto-size each column to fit its contents.
return

;------------------------ Executed when the listview control's any row is double clicked -----------------------;
inientries:
Gui, 3:Destroy ; this line makes sure that the variables assigned are all cleared up properly in order to show the gui again.
if A_GuiEvent = DoubleClick
{
    ; get the value of current row's first column
    LV_GetText(columnonetext, A_EventInfo, 1)
    
    ;get the value of current row's second column
    LV_GetText(columntwotext, A_EventInfo, 2)

    Gosub, EditDialog
}
return

EditDialog:
;MsgBox,,,%columnonetext% - %columntwotext%
IfInString, columnonetext, ProgKeyword
{
    MsgBox,64, Select keyword ! - %progname%, Please select a row first
}
else
{
    Gui, 3:Destroy
    Gui, 3:Default ;this makes sure that listview control is populated with all values properly
    Gui, 3:Font, S10 CDefault, Verdana
    Gui, 3:Add, Text, x16 y10 w300 h25, Program Keyword
    Gui, 3:Add, Edit, x16 y30 w230 h25 vnewprogkeyword, %columnonetext%
    Gui, 3:Add, Text, x16 y70 w40 h25, Path
    Gui, 3:Add, Edit, x16 y90 w400 h25 vnewpath, %columntwotext%
    Gui, 3:Add, Button, x426 y90 w60 h25, &Browse
    Gui, 3:Add, Button, x16 y130 w70 h25, &Update
    Gui, 3:Add, Button, x96 y130 w70 h25, &Cancel
    if %A_EventInfo%
    {
        row := A_EventInfo
    }
    else
    {
        row := focusedrownumber
    }
    ;get the value of old keyword
    LV_GetText(oldprogkeyword, row)
    Gui, 3:Add, Edit, hidden vcurrrownumber, %row%
    Gui, 3:Show, x293 y106 h170 w500, Edit Keyword/Path - %progname%
}
return

3ButtonBrowse:
Gui, 3:+OwnDialogs
FileSelectFile, SelectedFileNewPath, 3, , Select the file - %progname%
;MsgBox,,,%SelectedFileNewPath%
;if user selects a file then update the variables
if %SelectedFileNewPath%
{
    columntwotext := SelectedFileNewPath
    Gosub, EditDialog
}
return

3ButtonUpdate:
Gui, 3:Submit
;MsgBox,,,new keyword - %newprogkeyword% and new path - %newpath%
;MsgBox,,,Row Number is - %currrownumber%
;MsgBox,,,Old Prog Keyword is - %columnonetext%
if (newprogkeyword <> "" AND newpath <> "" AND currrownumber <> "")
{
    LV_Delete(currrownumber) ;delete the current row
    
    ;immediately create a new row with the updated values provided by user in the above inputbox
    LV_Add("", newprogkeyword, newpath)

    ; delete the section present in the inifile
    IniDelete, %inifile%, %columnonetext%

    ;section was not deleted
    if ErrorLevel
    {
        MsgBox,64,Error - %progname%, Error Deleting ini section
    }
    else
    {
        ; write the updated values to inifile
        IniWrite, %newpath%, %inifile%, %newprogkeyword%, Path
        if ErrorLevel
            MsgBox, 16, Error - %progname%, Failed to edit the INI file - %inifile%
    }
    
    ; empty the contents of commands file and rewrite the section names in them
    FileDelete, %commandsfile%
    if ErrorLevel
        MsgBox, 16, Error - %progname%, Error recreating the commands file at - %commandsfile%
    
    ;fetch all the sections of inifile and write them again to commandsfile
    FileRead, inisections, %inifile%
    allsections := ini_getAllSectionNames(inisections)
    Loop, Parse, allsections, `,
    {
        FileAppend, %A_LoopField%`n, %commandsfile%
    }
    Gosub, SettingsButton
}
return


2GuiClose:
2GuiEscape:
2ButtonCancel:
Gui, 2:Destroy
;reloads the script so as to catch up all the latest entries from inifile and commandsfile
Reload
return

2ButtonAdd:
    Gui, 2:+OwnDialogs
    FileSelectFile, SelectedFile, 3, , Select the file for adding it to %progname%
    if ErrorLevel = 0
    {
        ; below line will create 4 variables (name, dir, ext, name_n_ext, drive) use any of them for the loop
        SplitPath, SelectedFile, name, dir, ext, name_no_ext, drive
		
		InputBox , cmd , %progname% - keyword, Enter the keyword for this program,,300,130
		if ErrorLevel <>
		{
			;write the cmd variable to ini file, if the file is not present it will be created
			IniWrite, %SelectedFile%, %iniFile%, %cmd%, Path
			if ErrorLevel
			{
				MsgBox, 16, %progname%, Error adding the `n%SelectedFile%.
			}
			else
			{
				MsgBox, 64, %progname%, Program keyword : '%cmd%' successfully added for file : `n%SelectedFile%
				; now write the user entered "keyword" in your commands file
				; it will be created if not found
				FileAppend, %cmd%`n, %commandsfile%
				if ErrorLevel
				{
					MsgBox, 16, Error - %progname%, Error adding the %cmd% to commands file.
				}
				
				;go to inientries sub
				Gosub, SettingsButton
			}
		}
    }
return

2ButtonEdit:
Gui, 2:+OwnDialogs
Gui, 3:Destroy ; free up variables used earlier by gui 3
if A_GuiEvent = Normal
{
    ; get the value of current row's first column
    LV_GetText(columnonetext, LV_GetNext(0, "Focused"), 1)
    
    ;get the value of current row's second column
    LV_GetText(columntwotext, LV_GetNext(0, "Focused"), 2)
}
focusedrownumber := LV_GetNext(0, "Focused")
Gosub, EditDialog
return

2ButtonDelete:
Gui 2:+OwnDialogs


if A_GuiEvent = Normal
{
    ; get the value of current row's first column
    LV_GetText(columnonetext, LV_GetNext(0, "Focused"), 1)
    
    ;get the value of current row's second column
    LV_GetText(columntwotext, LV_GetNext(0, "Focused"), 2)
}

; check if atleast one row is selected for deletion
rownumber := LV_GetNext(0, "Focused")
if(%rownumber% <> 0)
{
    MsgBox, 36, Confirm Keyword Delete - %progname%, % "Are you sure you want to delete: " columnonetext "?"
    IfMsgBox Yes
    {
        ;fetch the details of the row number selected above
        LV_GetText(sectionname, rownumber, 1)

        ;store the status of delete in a variable
        deletesuccess := LV_Delete(rownumber)
        if %deletesuccess%
        {
            IniDelete, %inifile%, %sectionname%
            MsgBox, 64, Deleted - %progname%, Keyword has been deleted successfully.
        }

        ; empty the contents of commands file and rewrite the section names in them
        FileDelete, %commandsfile%
        if ErrorLevel
            MsgBox, 16, Error - %progname%, Error recreating the commands file at - %commandsfile%
        
        ;fetch all the sections of inifile and write them again to commandsfile
        inisections := ""
        FileRead, inisections, %inifile%
        allsections := ""
        allsections := ini_getAllSectionNames(inisections)
        Loop, Parse, allsections, `,
        {
            FileAppend, %A_LoopField%`n, %commandsfile%
        }
    }
}
else
{
    MsgBox,64, Select keyword ! - %progname%, Please select a row first
}
return

3GuiClose:
3GuiEscape:
3ButtonCancel:
Gui, 3:Destroy
return
;;;;;;;;;;;;;;;;;; Setttings Dialog Section ;;;;;;;;;;;;;;;;;;;;;;;;

showToolTip()
{
	SetKeyDelay, 0
	SetBatchLines, 5ms
	CoordMode, ToolTip, Relative
	AutoTrim, Off

    global progname
    global author
    global commandsfile

	;_______________________________________

	;    CONFIGURATIONS


 
	; Editor Window Recognition
	; (make it blank to make the script seek all windows)

	ETitle = %progname% By %author%


	;Minimum word length to make a guess

	WLen = 1


	; Press F4 to complete command
	; Escape & Enter clear command


	;_______________________________________

	;Gets path to AutoHotkey
	RegRead, AHKPATH, HKEY_CLASSES_ROOT, AutoHotkeyScript\Shell\Run\Command,
	StringGetPos, POS, AHKPATH, \AutoHotkey.exe
	StringLeft, AHKPATH, AHKPATH, %POS%
	StringReplace, AHKPATH, AHKPATH, "",, A

	;reads command syntaxes
	Loop, Read, %commandsfile%
	{
	   tosend = %a_loopreadline%

	   StringReplace, tosend, tosend, }, +], a
	   StringReplace, tosend, tosend, {, +[, a
	   StringReplace, tosend, tosend, #, {#}, a
	   StringReplace, tosend, tosend, ``n, {enter}, a
	   StringReplace, tosend, tosend, ``t, {tab}, a
	   StringReplace, tosend, tosend, ``b, {bs}, a

	   cmd%a_index% = %toSend%
	}

	Loop
	{
	   ;Editor window check
	   WinGetActiveTitle, ATitle
	   IfNotInString, ATitle, %ETitle%
	   {
		  ToolTip
		  Setenv, Word,
		  sleep, 500
		  Continue
	   }
	   
	   ;Get one key at a time
	   Input, chr, L1 V, {enter}{F4}{bs}{esc}
	   EndKey = %errorlevel%
	   
	   ;Blanks word reserve
	   ifequal, EndKey, Endkey:Enter, Setenv, Word,
	   ifequal, EndKey, Endkey:Escape, Setenv, Word,
	   
	   ;Backspace clears last letter
	   ifequal, EndKey, Endkey:BackSpace, StringTrimRight, Word, Word, 1
	   ifnotequal, EndKey, Endkey:BackSpace, Setenv, Word, %word%%chr%
	   
	   ;Wait till minimum letters
	   StringLen, len, Word
	   IfLess, len, %wlen%
	   {
		  ToolTip
		  Continue
	   }
	   
	   ;Match part-word with command
	   Num =
	   Match =
	   Loop
	   {
		  IfEqual, cmd%a_index%,, Break
		  StringLen, len, word
		  StringLeft, check, cmd%a_index%, %len%
		  IfEqual, word, %check%
		  {
			 num = %a_index%
			 break
		  }
	   }
	   
	   ;If no match then clear Tip
	   IfEqual, Num,
	   {
		  ToolTip
		  Continue
	   }
	   
	   ;Show matched command
	   StringTrimLeft, match, cmd%num%, 0
	   display_y = %A_CaretY%
	   display_y -= 20 ; Move tooltip up a little so as not to hide the caret.
	   IfNotEqual, Word,,ToolTip, %match%, %A_CaretX%, %display_y%
	   
	   ;Complete command
	   IfNotEqual, Word,, IfEqual, EndKey, Endkey:F4
	   {
		  StringLen, len, Word
		  Send, {BS %len%}%match%
		  Word =
		  ToolTip
	   }
	}
	return
}

;;;; include (paste) the inilibrary code (mentioned in this thread) below here,.

#Include, %A_ScriptDir%\ini.ahk