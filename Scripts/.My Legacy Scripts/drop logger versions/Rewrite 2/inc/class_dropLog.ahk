/*
trips
	tripStart
	tripEnd
	kills
		drops
			item
			quantity
*/

class class_dropLog {

	__New() {
		;~ FileSelectFile, OutputFile, 29, , Select drop log file, Documents (*.txt) ; 29 = File Must Exist; Path Must Exist; Prompt to Create New File; Prompt to Overwrite File
		;~ OutputFile := RTrim(OutputFile, "`n") ; remove trailing enter that is there for some reason
		;~ If !(OutputFile)
			;~ return
		;~ FileRead, Output, % OutputFile
		;~ this.obj := json.load(Output)
		
		
		;~ OutputFile := "E:\Downloads\_ahk_droplogger_rewrite\test123.txt"
		this.obj := {}
		this.obj["trips"] := {}

	}
	
	AddDrop(item, quantity) {
		this.dropsObj.push({item: item, quantity: quantity})
		
		; update guilog selected drops view control
		loop, % this.dropsObj.length() {
			If (this.dropsObj.length() = 1)
				Output .= this.dropsObj[A_Index].quantity " x " this.dropsObj[A_Index].item ; one item is selected
			else
				Output .= this.dropsObj[A_Index].quantity " x " this.dropsObj[A_Index].item ", " ; multiple items are selected
		}
		Output := RTrim(Output, ", ") ; remove trailing comma
		GuiControl guiDropLog: Text, Edit1, % Output
		ControlSend, Edit1, {end} ; scroll to the end of edit control
	}
	
	ClearDrops() {
		this.dropsObj := {}
		
		GuiControl guiDropLog: Text, Edit1 ; update guilog
	}
	
	AddKill() {
		this.tripObj["kills"].push({drops: this.dropsObj})
		this.ClearDrops()
		
		;~ msgbox % json.dump(this.tripObj,,2)
	}
	
	StartTrip() {
		this.tripObj := {}
		this.tripObj["tripStart"] := A_Now
		this.tripObj["kills"] := {}
		
		this.ClearDrops()
		
		;~ msgbox % json.dump(this.tripObj,,2)
	}
	
	EndTrip() {
		this.tripObj["tripEnd"] := A_Now
		this.obj["trips"].push(this.tripObj)
		this.tripObj := {}
		
		;~ msgbox % json.dump(this.tripObj,,2)
		;~ msgbox % json.dump(this.obj,,2)
	}
	
	isTripStarted() {
		If (this.tripObj.tripStart)
			return true
		return false
	}
}