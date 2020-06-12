/*
	Returns contents from all drop tables on a wiki page in an object with this layout
	{
      "Drop Rate": "Always",
      "Img": "https://vignette.wikia.nocookie.net/2007scape/images/f/f9/Ashes.png",
      "Noted": 0,
      "Quantity": "1",
      "Title": "Ashes"
    },
	If a wiki page did not have any drop tables false is returned
*/
class class_getWikiDroptables {
	__New() {
		this.ie := ComObjCreate("InternetExplorer.Application") ;create a IE instance
		this.ie.Visible := False
	}
	
	_Navigate(input) {
		this.ie.Navigate("http://oldschoolrunescape.wikia.com/wiki/" input)
		IEWait(this.ie)
	}
	
	Destroy() {
		If ComObjType(this.ie,"IID") ; browser already closed if this is not available
			this.ie.Quit
		this.ie := ""
	}
	
	getDropTable(input) {
		If !IsObject(this.ie)
			this.__New()
		this._Navigate(input)
		
		tables := this.ie.document.getElementsByClassName("wikitable sortable dropstable")
		
		If !(tables.length) {
			msgbox class_getWikiDroptables.getDropTable input did not contain normal wiki sortable droptables: %input%`n`nClosing..
			exitapp
			return false
		}
		return this._getSortableDroptables()
	}
	
	_getSortableDroptables() {
		output := []
		
		tables := this.ie.document.getElementsByClassName("wikitable sortable dropstable")

		loop, % tables.length {
			rows := tables[A_Index-1].rows
			
			tableIndex := A_Index-1
			
			loop, % rows.length {
				cells := rows[A_Index-1].cells
				
				rowIndex := A_Index-1
				
				newItemIsDuplicate := false
				If (newItem.title) { ; add item to output, if an item is available
					
					loop, % output.length() { ; check if this item has already been added to output
						If (output[A_Index].title = newItem.title) and (output[A_Index].quantity = newItem.quantity)
							newItemIsDuplicate := true
					}
					If !(newItemIsDuplicate) ; if this item has not been added to the droptable yet
						output.push(newItem) ; add it
				}
				newItem := []
				
				loop, % cells.length {
					cellText := cells[A_Index-1].innerText
					cellText := Trim(cellText)
					
					cellIndex := A_Index-1
					
					If (cellText = "")
						break ; this row contains blank|item|quantity|rarity|geprice
					If (cellIndex = 4)
						break ; dont get ge price
					If (cellIndex = 0) and (rowIndex = 0) and (InStr(tables[tableIndex].rows[rowIndex].cells[cellIndex].innerText, "Show/hide rare drop table"))
						break, 3 ; rare drop table is the last table, close all loops
					
					If (cellIndex = 0) {
						; retrieve link to image from html
						cellText := SubStr(cellText, InStr(cellText, "https"))
						cellText := SubStr(cellText, 1, InStr(cellText, "/revision") - 1)
						newItem["img"] := cellText
					}
					If (cellIndex = 1)
						newItem["title"] := cellText
					If (cellIndex = 2) {
						noted := 0
						If InStr(cellText, "(noted)") {
							StringReplace, cellText, cellText, % A_Space "(noted)", , All
							noted := 1
						}
						newItem["quantity"] := cellText
						newItem["noted"] := noted
					}
					If (cellIndex = 3) {
						If InStr(cellText, "[") ; remove wiki "[X]" references where x is a digit
							cellText := Trim(SubStr(cellText, 1, InStr(cellText, "[") - 1))
						
						newItem["drop rate"] := cellText
					}
				}
			}
		}
		return output
	}
}

IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For wb in ComObjCreate( "Shell.Application" ).Windows
		If InStr( Name , wb.LocationName  ) && InStr( wb.FullName, "iexplore.exe" )
            Return wb
} ;written by Jethrow

IEWait(ie){
   while ie.busy || (ie.document && ie.document.readyState != "complete") || ie.readyState!=4
   Sleep 100
}