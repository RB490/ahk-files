#NoEnv
#Include WIA.ahk
Filters := WIA_FilterDescriptions()
Gui, Add, Edit, w800 r30, %Filters%
Gui, Show, , WIA.ImageProcess Filters
SendInput, ^{Home}
Return
GuiClose:
ExitApp