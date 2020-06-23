#NoEnv
SetBatchLines, -1

Successfuldownload := A_ScriptDir "\vorkath.png" ; you need to put in a valid image path here !!!

PicW := 275
PicH := 275
Gui, Margin, 20, 20
Gui, Add, Picture, w%PicW% h%PicH% hwndHPIC Border +0x020E ; important, set SS_CENTERIMAGE (0x0200) | SS_BITMAP (0x0E)
Gui, Add, Button, gLoadPic, Click here to load the picture!
Gui, Show, , WIA Test
Return

GuiClose:
Gui, Destroy
ExitApp

LoadPic:
Gui, +OwnDialogs
; Load the image
If !(ImgObj := WIA_LoadImage(Successfuldownload)) {
   MsgBox, 16, Error, Couldn't load %Successfuldownload%!
   Return
}
; Determine how to scale
If (ImgObj.Width - PicW) > (ImgObj.Height - PicH) {
   ScaleW := PicW
   ScaleH := 0
}
Else {
   ScaleW := 0
   ScaleH := PicH
}
; Scale the image
Scaled := WIA_ScaleImage(ImgObj, ScaleW, ScaleH)
; Get the bitmap data
PicObj := WIA_GetImageBitmap(Scaled)
; STM_SETIMAGE message: Set the control's image.
SendMessage, 0x172, 0, % PicObj.Handle, , ahk_id %HPIC%
; Delete the previous bitmap, if any
If (Errorevel) 
   DllCall("DeleteObject", "Ptr", ErrorLevel)
Return

#Include WIA.ahk