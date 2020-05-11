; https://autohotkey.com/board/topic/68877-practical-oop-advantage-showing-example-is-needed/page-3

#SingleInstance, force
#Persistent

outline := new Outline("yellow")
outline.show(10,10,100,100)

msgbox

outline.setcolor("red")
return


class Outline {
	__New(color="red") {
		Gui, +HWNDdefault
		Loop, 4 {
			Gui, New, -Caption +ToolWindow HWNDhwnd
			Gui, Color, %color%
			this[A_Index] := hwnd
		}
		this.visible := false
		this.color := color
		this.top := this[1]
		this.right := this[2]
		this.bottom := this[3]
		this.left := this[4]
		Gui, %default%: Default
	}
	Show(x1, y1, x2, y2, sides="TRBL") { ; show outline at coords
		Gui, +HWNDdefault
		if InStr( sides, "T" )
			Gui, % this[1] ":Show", % "NA X" x1-2 " Y" y1-2 " W" x2-x1+4 " H" 2
		Else, Gui, % this[1] ":Hide"
		if InStr( sides, "R" )
			Gui, % this[2] ":Show", % "NA X" x2 " Y" y1 " W" 2 " H" y2-y1
		Else, Gui, % this[2] ":Hide"
		if InStr( sides, "B" )
			Gui, % this[3] ":Show", % "NA X" x1-2 " Y" y2 " W" x2-x1+4 " H" 2
		Else, Gui, % this[3] ":Hide"
		if InStr( sides, "L" )
			Gui, % this[4] ":Show", % "NA X" x1-2 " Y" y1 " W" 2 " H" y2-y1
		Else, Gui, % this[3] ":Hide"
		self.visible := true
		Gui, %default%: Default
	}
	Hide() { ; hide outline
		Gui, +HWNDdefault
		Loop, 4
			Gui, % this[A_Index] ": Hide"
		this.visible := false
		Gui, %default%: Default
	}
	SetAbove(hwnd) { ; set Z-Order one above "hwnd"
		ABOVE := DllCall("GetWindow", "uint", hwnd, "uint", 3) ; get window directly above "hwnd"
		Loop, 4  ; set 4 "outline" GUI's directly below "hwnd_above"
			DllCall(	"SetWindowPos", "uint", this[A_Index], "uint", ABOVE
						,	"int", 0, "int", 0, "int", 0, "int", 0
						,	"uint", 0x1|0x2|0x10	) ; NOSIZE | NOMOVE | NOACTIVATE
	}
	Transparent(param) { ; set Transparent ( different from hiding )
		Loop, 4
			WinSet, Transparent, % param=1? 0:255, % "ahk_id" this[A_Index]
		this.visible := !param
	}
	SetColor(color) {
		Gui, +HWNDdefault
		Loop, 4
			Gui, % this[A_Index] ": Color" , %color%
		this.color := color
		Gui, %default%: Default
	}
	Destroy() {
		Loop, 4
			Gui, % this[A_Index] ": Destroy"
	}
	__Delete() {
		this.Destroy()
	}
}
~^s::reload