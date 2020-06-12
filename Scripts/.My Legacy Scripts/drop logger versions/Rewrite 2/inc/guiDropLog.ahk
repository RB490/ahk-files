; input is a mob string
guiDropLog(input) {
	static
	
	If (input = "update") {
		Gosub guiDropLog_Update
		return
	}
	
	imgSize := 35
	rowLength := 10
	marginSize := 5
	
	; properties
	gui guiDropLog: Default
	gui guiDropLog: Margin, % marginSize, % marginSize
	gui guiDropLog: +LabelguiDropLog_ +hwnd_guiDropLog
	
	; controls
	drops := db_Mob.GetDropTable(input)
	
	;~ gui guiDropLog: Add, Tab3,, General|View|Settings
	
	gui guiDropLog: Margin, 0, 0
	imgXtopLeft := marginSize
	imgYtopLeft := marginSize
	loop, % drops.length() {
		imgX := "+0"
	
		If (A_Index = 1) {
			rows := 1 ; first row is started
			
			; set coordinates for top left image
			imgX := imgXtopLeft
			imgY := imgYtopLeft
		}
		If (A_Index > 1) ; position every image after the first slightly to the left so the "border" property on the picture controls ligns up nicely
			imgX := "+-1"
		
		If (currentRowLength = rowLength) { ; start a new row
			currentRowLength := 0
			imgX := imgXtopLeft
			imgY := imgXtopLeft + rows * imgSize
			rows++
		}
		
		associatedVar := drops[A_Index].title "#" drops[A_Index].quantity
		associatedVar := convertChars("encrypt", associatedVar)
		
		gui guiDropLog: add, picture, x%imgX% y%imgY% w%imgSize% h%imgSize% v%associatedVar% border, % A_ScriptDir "\res\img\items\" drops[A_Index].title ".png"
		
		currentRowLength++
	}
	gui guiDropLog: Margin, % marginSize, % marginSize
	
	listX := rowLength * imgSize + (marginSize * 2) + imgXtopLeft + marginSize
	listH := rows * imgSize
	gui guiDropLog: add, edit, x%listX% y%imgYtopLeft% h%listH% w300
	
	editW := rowLength * imgSize + (marginSize * 2)
	gui guiDropLog: add, edit, x%imgXtopLeft% w%editW%
	
	gui guiDropLog: add, button, x+%marginSize% w60 gguiDropLog_clearSelectedDrops, Clear
	gui guiDropLog: add, button, x+%marginSize% w60 gguiDropLog_kill, + Kill
	gui guiDropLog: add, button, x+%marginSize% w60 gguiDropLog_trip hwnd_guiDropLog_trip, Trip
	gui guiDropLog: add, button, x+%marginSize% w60 gguiDropLog_undo, Undo
	gui guiDropLog: add, button, x+%marginSize% w60 gguiDropLog_redo, Redo

	; show
	gui guiDropLog: show, , test
	
	Gosub guiDropLog_Update
	return
	
	guiDropLog_clearSelectedDrops:
		dropLog2.clearSelectedDrops()
		Gosub guiDropLog_Update
	return
	
	guiDropLog_kill:
		dropLog2.addKill()
		Gosub guiDropLog_Update
	return
	
	guiDropLog_trip:
		If (dropLog2.isTripStarted())
			dropLog2.endTrip()
		else
			dropLog2.startTrip()
		
		Gosub guiDropLog_Update
	return
	
	guiDropLog_undo:
		dropLog2.undo()
		Gosub guiDropLog_Update
	return
	
	guiDropLog_redo:
		dropLog2.redo()
		Gosub guiDropLog_Update
	return
	
	guiDropLog_Update:
		; update selected drops view
		GuiControl guiDropLog: Text, Edit2, % dropLog2.getSelectedDrops()
		ControlSend, Edit2, ^{end} ; scroll to the end of edit control
		
		; update current trip view
		GuiControl guiDropLog: Text, Edit1, % dropLog2.getCurrentTrip()
		ControlSend, Edit1, ^{end} ; scroll to the end of edit control
		
		; update trip button
		If (dropLog2.isTripStarted())
			GuiControl guiDropLog: Text, % _guiDropLog_trip, End Trip
		else
			GuiControl guiDropLog: Text, % _guiDropLog_trip, Start Trip
	return
}