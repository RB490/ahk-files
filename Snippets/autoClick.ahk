#SingleInstance, force
return

#If WinClassActive("ahk_class GLFW30")

LButton::
    loop, {
        SendInput, {LButton}
        Sleep, 1
    } until (GetKeyState("LButton", "P") = false)
return

RButton::
    loop, {
        SendInput, {RButton}
        Sleep, 1
    } until (GetKeyState("RButton", "P") = false)
return

#If

f12::
    suspend
    SoundBeep
return

~^s::reload