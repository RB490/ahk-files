; have internet explorer tab with osrs wiki drop table open eg: http://oldschoolrunescape.wikia.com/wiki/Zulrah

#SingleInstance, force
#Persistent


ie := IEGet()
ie.Refresh
IELoad(ie)

tables := ie.document.getElementsByClassName("wikitable sortable dropstable")

loop, % tables.length {
	rows := tables[A_Index-1].rows
	
	tableIndex := A_Index-1
	
	loop, % rows.length {
		cells := rows[A_Index-1].cells
		
		rowIndex := A_Index-1
		
		loop, % cells.length {
			cellText := cells[A_Index-1].innerText
			
			cellIndex := A_Index-1
			
			If InStr(cellText, "Always") {
				loop, 20
					largeNumber .= A_now

				tables[tableIndex].rows[rowIndex].cells[cellIndex].innerText := largeNumber
			}
		}
	}
}

msgbox end of script
exitapp

IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For wb in ComObjCreate( "Shell.Application" ).Windows
		If InStr( Name , wb.LocationName  ) && InStr( wb.FullName, "iexplore.exe" )
            Return wb
} ;written by Jethrow
	
IELoad(wb)    ;You need to send the IE handle to the function unless you define it as global.
{
    If !wb    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,100
    Until (wb.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,100
    Until (!wb.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,100
    Until (wb.Document.Readystate = "Complete")
Return True
}
	
~^s::reload

#Include, <JSON>