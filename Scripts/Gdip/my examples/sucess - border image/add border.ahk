#SingleInstance, Force
#NoEnv
SetBatchLines, -1
#Include, Gdip_all.ahk

; FileSelectFile, file1
file1 := "D:\Downloads\Resized_resizeThis.png"

If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}
pBitmapFile1 := Gdip_CreateBitmapFromFile(File1)
Width := Gdip_GetImageWidth(pBitmapFile1), Height := Gdip_GetImageHeight(pBitmapFile1)
; w:=width+60
; h:=height+60

w:=280
h:=280

imageX := (w - Width) / 2
imageY := (h - Height) / 2

; msgbox % imageX
; imageX := 0
; w+= imageX
; imageY := 


pBitmap := Gdip_CreateBitmap(w, h)
G := Gdip_GraphicsFromImage(pBitmap)
; pBrush := Gdip_BrushCreateSolid(0xffffffff)
; Gdip_FillRectangle(G, pBrush, 0, 0, w, h)
; Gdip_DeleteBrush(pBrush)

Gdip_DrawImage(G, pBitmapFile1, imageX, imageY, Width, Height, 0, 0, Width, Height)



Gdip_DisposeImage(pBitmapFile1)


Gdip_SaveBitmapToFile(pBitmap, "FinalImage.png")


Gdip_DisposeImage(pBitmap)
Gdip_DeleteGraphics(G)
Gdip_Shutdown(pToken)

ExitApp
Return