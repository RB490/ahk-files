f1:: ;send ctrl+shift+left without using Send/SendInput/ControlSend
    ;e.g. tested on Notepad (Windows 7)
    WinGet, hWnd, ID, ahk_class Valve001
    ControlGetFocus, vCtlClassNN, % "ahk_id " hWnd
    if !(vCtlClassNN = "")
        ControlGet, hWnd, Hwnd,, % vCtlClassNN, % "ahk_id " hWnd

    vTIDAhk := DllCall("kernel32\GetCurrentThreadId", "UInt")
    VarSetCapacity(PBYTE1, 256, 0)
    DllCall("user32\GetKeyboardState", "Ptr",&PBYTE1)

    vTID := DllCall("user32\GetWindowThreadProcessId", "Ptr",hWnd, "Ptr",0, "UInt")
    DllCall("user32\AttachThreadInput", "UInt",vTIDAhk, "UInt",vTID, "Int",1)
    VarSetCapacity(PBYTE2, 256, 0)
    NumPut(0x80, PBYTE2, 0x10, "UChar") ;VK_SHIFT := 0x10
    NumPut(0x80, PBYTE2, 0x11, "UChar") ;VK_CONTROL := 0x11
    DllCall("user32\SetKeyboardState", "Ptr",&PBYTE2)

    ;VK_LEFT := 0x25
    SendMessage, 0x100, 0x25, 0x014B0001,, % "ahk_id " hWnd ;WM_KEYDOWN := 0x100
    SendMessage, 0x101, 0x25, 0xC14B0001,, % "ahk_id " hWnd ;WM_KEYUP := 0x101
    DllCall("user32\AttachThreadInput", "UInt",vTIDAhk, "UInt",vTID, "Int",0)
    DllCall("user32\SetKeyboardState", "Ptr",&PBYTE1)
return