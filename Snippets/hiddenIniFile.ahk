; source: https://autohotkey.com/board/topic/65007-trickhide-ini-file-as-part-of-the-script-file/

#SingleInstance, force

IniRead, OutputVar, %A_ScriptFullPath%:Stream:$DATA, Settings, Pass,error 
If (OutputVar="error")
 { 
 InputBox, OutputVar , New, Please select a password, HIDE 
 IniWrite, %OutputVar%, %A_ScriptFullPath%:Stream:$DATA, Settings, Pass 
 } 
Else 
 { 
 InputBox, Output , Returning, Please enter your password, HIDE 
 If (OutputVar<>Output) 
  ExitApp 
 } 
MsgBox Your Script Started

~^s::reload