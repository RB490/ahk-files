#NoEnv
#Include WIA.ahk
; ======================================================================================================================
CommonProps := ["FileExtension", "FormatID", "Height", "Width", "PixelDepth", "HorizontalResolution",
              , "VerticalResolution", "IsAlphaPixelFormat", "IsAnimated", "IsExtendedPixelFormat"
              , "IsIndexedPixelFormat", "FrameCount", "ActiveFrame"]
PicW := 400 ; width of the Pic controls
; ======================================================================================================================
; ImgPath := A_ScriptDir . "\Test.jpeg"  ; image path
ImgPath := ""
Loop, Files, %A_WinDir%\Web\WallPaper\*.jpg, R
   ImgPath := A_LoopFileLongPath
Until (ImgPath <> "")
If (ImgPath = "") {
   MsgBox, 16, Error, Couldn't find a JPG image file!`n`nThe program will exit.
   ExitApp
}
; Load the image
If !(ImgObj := WIA_LoadImage(ImgPath)) {
   MsgBox, 16, Error, Couldn't load %ImagePath%!`n`nThe program will exit.
   ExitApp
}
; ======================================================================================================================
Menu, Show, Add, Common properties, ShowCommonProps
Menu, Show, Add, Extended properties, ShowExtendedProps
Menu, Menubar, Add, Show, :Show
; ======================================================================================================================
Gui, Menu, Menubar
Gui, Margin, 20, 20
Gui, Color, Black
; Scale the image to a width of PicW pixels and preserve the aspect ratio for the height.
Scaled := WIA_ScaleImage(ImgObj, PicW, 0)
; Get the height
PicH := Scaled.Height
Gui, Add, Text, cWhite, Original scaled to %PicW%x%PicH%:
Gui, Add, Pic, xm y+2 w%PicW% h%PicH% hwndHPIC1 +0x4E
; Get the bitmap data
PicObj := WIA_GetImageBitmap(Scaled)
; Get the HBITMAP handle
HBM := PicObj.Handle
; STM_SETIMAGE message: Set the control's image.
SendMessage, 0x172, 0, %HBM%, , ahk_id %HPIC1%
; Crop 25 percent of the Top, Left, Bottom, and Right of the image.
CropTB := ImgObj.Height // 4
CropLR := ImgObj.Width // 4
Cropped := WIA_CropImage(ImgObj, CropLR, CropTB, CropLR, CropTB)
; Scale the image to a width of PicW pixels and preserve the aspect ratio for the height.
Scaled := WIA_ScaleImage(Cropped, PicW, 0)
; Get the height
PicH := Scaled.Height
Gui, Add, Text, ym cWhite, Cropped scaled to %PicW%x%PicH%:
Gui, Add, Pic, xp y+2 w%PicW% h%PicH% hwndHPIC2 +0x4E
; Get the bitmap data
PicObj := WIA_GetImageBitmap(Scaled)
; Get the HBITMAP handle
HBM := PicObj.Handle
; STM_SETIMAGE message: Set the control's image.
SendMessage, 0x172, 0, %HBM%, , ahk_id %HPIC2%
Gui, Show, AutoSize, %ImgPath%
Return
; ======================================================================================================================
GuiClose:
ExitApp
; ======================================================================================================================
ShowCommonProps:
Properties := ""
For Each, Prop In CommonProps
   Properties .= Prop . " : " . ImgObj[Prop] . "`r`n"
MsgBox, 0, Common Properties, % RTrim(Properties, "`r`n")
Return
; ======================================================================================================================
ShowExtendedProps:
   MsgBox, 0, Extended Properties, % WIA_GetImageProperties(ImbObj)
Return