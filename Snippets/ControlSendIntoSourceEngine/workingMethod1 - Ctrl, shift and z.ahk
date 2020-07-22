; CTRL
    ; SendMessage, 0x100, 0x70, 0x001D0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
    Sleep, 200
    ; SendMessage, 0x101, 0x70, 0x001D0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101

; SHIFT
    SendMessage, 0x100, 0x10, 0x002A0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
    Sleep, 200
    SendMessage, 0x101, 0x10, 0xC02A0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101

; Z - https://stackoverflow.com/questions/54638741/how-is-the-lparam-of-postmessage-constructed
    SendMessage, 0x100, 0x12, 0x002C0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
    Sleep, 200
    SendMessage, 0x101, 0x12, 0x002C0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101