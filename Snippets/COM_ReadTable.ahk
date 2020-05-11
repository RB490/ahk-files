#SingleInstance, force
#Persistent


ie := IEGet()

; msgbox % IE.Document.All.Tags("wikitable sortable dropstable").Rows
; MsgBox %  IE.Document.All.Tags("wikitable sortable dropstable").Length
; MsgBox %  IE.Document.All.Tags("table").Length

rows := IE.Document.All.Tags("table")[4].Rows ; OR: rows := ie.document.getElementsByClassName("wikitable sortable dropstable")
loop, % rows.length {
	cells := rows[A_Index-1].cells
	loop, % cells.length {
		msgbox % cells[A_Index-1].innerText
	}
}

msgbox end of script
return

IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For wb in ComObjCreate( "Shell.Application" ).Windows
		If InStr( Name , wb.LocationName  ) && InStr( wb.FullName, "iexplore.exe" )
            Return wb
} ;written by Jethrow
	
~^s::reload