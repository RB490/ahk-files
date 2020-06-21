; https://www.autohotkey.com/boards/viewtopic.php?t=30979

Gui, +AlwaysOnTop -SysMenu +ToolWindow -Border +hWndhGUI
Gui, Add, Button, hWndhButton1 x10 y8 w100 h23 gButton01, %A_Space%Button01
SetButtonIcon(hButton1, "shell32.dll", 4)
Gui, Add, Button, hWndhButton2 x130 y8 w100 h23 gButton02, %A_Space%Button02
SetButtonIcon(hButton2, "shell32.dll", 22)
Gui, Add, Button, hWndhButton3 x255 y8 w23 h23 gCloseGUI
GuiButtonIcon(hButton3, "imageres.dll", 219, 16, 0)
Gui, Show, x200 y200 h40 w290, GUI Test

OnMessage( 0x200, "WM_MOUSEMOVE")

HideFocusBorder(hGUI)
Return

WM_MOUSEMOVE(wparam, lparam, msg, hwnd)
{
    if wparam = 1 ; LButton
        PostMessage, 0xA1, 2,,, A ; WM_NCLBUTTONDOWN
}

GuiButtonIcon(Handle, File, Index := 0, Size := 12, Margin := 1, Align := 5)
{
    Size -= Margin
    Psz := A_PtrSize = "" ? 4 : A_PtrSize, DW := "UInt", Ptr := A_PtrSize = "" ? DW : "Ptr"
    VarSetCapacity( button_il, 20 + Psz, 0 )
    NumPut( normal_il := DllCall( "ImageList_Create", DW, Size, DW, Size, DW, 0x21, DW, 1, DW, 1 ), button_il, 0, Ptr )
    NumPut( Align, button_il, 16 + Psz, DW )
    SendMessage, BCM_SETIMAGELIST := 5634, 0, &button_il,, AHK_ID %Handle%
    return IL_Add( normal_il, File, Index )
}

SetButtonIcon(hButton, File, Index, Size := 16) {
    hIcon := LoadPicture(File, "h" . Size . " Icon" . Index, _)
    SendMessage 0xF7, 1, %hIcon%,, ahk_id %hButton% ; BM_SETIMAGE
}

CloseGUI:
    Gui, Destroy
Return

Button01:
    MsgBox, Button01 Works!
Return

Button02:
    MsgBox, Button02 Works!
Return

; https://autohotkey.com/boards/viewtopic.php?t=9919
HideFocusBorder(wParam, lParam := "", uMsg := "", hWnd := "") {
    ; WM_UPDATEUISTATE = 0x0128
    Static Affected := [] ; affected controls / GUIs
        , HideFocus := 0x00010001 ; UIS_SET << 16 | UISF_HIDEFOCUS
        , OnMsg := OnMessage(0x0128, Func("HideFocusBorder"))
    If (uMsg = 0x0128) { ; called by OnMessage()
        If (wParam = HideFocus)
            Affected[hWnd] := True
        Else If Affected[hWnd]
            PostMessage, 0x0128, %HideFocus%, 0, , ahk_id %hWnd%
    }
    Else If DllCall("IsWindow", "Ptr", wParam, "UInt")
        PostMessage, 0x0128, %HideFocus%, 0, , ahk_id %wParam%
}