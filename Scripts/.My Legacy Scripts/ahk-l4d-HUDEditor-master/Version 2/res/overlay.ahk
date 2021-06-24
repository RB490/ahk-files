#SingleInstance, force
; eg: DrawOverlayOverHwnd(WinExist("Calculator"))
_targetHwnd := A_Args[1]
DrawOverlayOverHwnd(_targetHwnd)
return

DrawOverlayOverHwnd(hwnd := "") {
    If !hwnd {
        gui overlay: destroy
        return   
    }

    gui overlay: new
    gui overlay: -Caption +ToolWindow +hwnd_overlay
    If (hwnd) {
        _game := hwnd
        gui overlay: +Owner%_game%
    }

    ; make transparent
    Gui overlay: Color, White
    Gui overlay: +LastFound
    WinSet, Transparent, 50
    
    WinGetPos, winX, winY, winW, winH, % "ahk_id" A_Space hwnd
    If (winX != "")
        gui overlay: show, % "x" winX A_Space "y" winY A_Space "w" winW A_Space "h" winH A_Space
    else
        gui overlay: show, w250 h250 x0 y0
    WinWait % "ahk_id" A_Space _overlay
}