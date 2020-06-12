class class_dropLog2 {
	__New() {
		this.obj["trips"] := {}
		
		this.undoObj := {}
		this.redoObj := {}
	}
	
	undo() {
		If !(this.undoObj.length())
			return
		
		this.redoObj.push(DeepCopy(this.obj)) ; save current state for redo() before making changes
		
		this.obj := this.undoObj.pop() ; restore last state
	}
	
	redo() {
		If !(this.redoObj.length())
			return
		
		this.undoObj.push(DeepCopy(this.obj)) ; backup current state, use deepcopy to not copy object references
		this.obj := this.redoObj.pop() ; set content
	}
	
	startTrip() { 
		this.undoObj.push(DeepCopy(this.obj)) ; backup current state, use deepcopy to not copy object references
		
		this.obj["trips"].push({startTrip: A_Now, kills: {}})
		
		this.clearSelectedDrops()
	}
	
	endTrip() {
		this.undoObj.push(DeepCopy(this.obj)) ; backup current state, use deepcopy to not copy object references
		
		this.trip().endTrip := A_Now ; add end time to the current trip
		
		this.clearSelectedDrops()
	}
	
	trip() { ; return current trip obj
		return this.obj["trips"][this.obj["trips"].length()]
	}
	
	isTripStarted() {
		If !(this.trip().startTrip) ; no trip is active because there is no start timestamp
			return false
		
		If (this.trip().endTrip)
			return false ; no trip is active because the last trip has an end timestamp
		return true
	}
	
	addKill() { ; add drop to current kill
		this.undoObj.push(DeepCopy(this.obj)) ; backup current state, use deepcopy to not copy object references

		this.trip()["kills"].push(this.selectedDrops)
		
		this.clearSelectedDrops()
	}
	
	addSelectedDrop(item, quantity) { ; add drop to current kill selected drops
		If !IsObject(this.selectedDrops)
			this.selectedDrops := {}
		this.selectedDrops.push({item: item, quantity: quantity})
	}
	
	getSelectedDrops() { ; returns formatted string with selected drops
		return this.getDrops(this.selectedDrops)
	}
	
	clearSelectedDrops() {
		this.selectedDrops := ""
	}
	
	getCurrentTrip() { ; returns formatted string with current trip kills
		If !(this.isTripStarted()) ; return nothing if no trip is ongoing
			return
		
		input := this.trip()["kills"].clone() ; grab current trip kills
		loop % input.length() { ; go through kills in this trip
			output .= this.getDrops(input[A_Index]) ; get drops for current kill
		
			If (A_Index < input.length()) ; if this is not the last kill
				output .= "`n`n" ; add spacer between kills
		}
		return output
	}
	
	; input is kill object with drops
	; returns formatted string with drops in this kill
	getDrops(input) {
		input := input.clone()
		
		loop, % input.length() { ; go through drops
			Output .= input[A_Index].item ; start with item name
		
			If (input[A_Index].quantity > 1) ; add quantity if more then one
				Output .= " x " input[A_Index].quantity
			
			Output .= ", " ; add spacer between drops
		}
		return RTrim(Output, ", ") ; remove trailing comma from last drop
	}
}