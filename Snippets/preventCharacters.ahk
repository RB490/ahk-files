Gui, Add, Edit, vEdit w200

Gui, Show



OnMessage(0x102, "WM_CHAR")

return



WM_CHAR(wParam, lParam){

	If(A_GuiControl = "Edit" and !RegExMatch(Chr(wParam), "i)^[a-z1-9\x08]$"))

		Return false

}



GuiClose:

ExitApp