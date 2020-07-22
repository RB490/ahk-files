/*
Func: Dlg_Color
    Windows color dialog

Parameters:
	Color		-	Custom colors to show in the dialog
	hWnd		-	Hwnd of window to show on on top of
	Flags		-	Command

Returns:
	-

Examples:
    > msgbox % Dlg_Color()
	=	Returns color in hex
	
Source: https://autohotkey.com/board/topic/94083-ahk-11-font-and-color-dialogs/
*/
Dlg_Color(Color,hwnd){
	static
	if !cc{
		VarSetCapacity(CUSTOM,16*A_PtrSize,0),cc:=1,size:=VarSetCapacity(CHOOSECOLOR,9*A_PtrSize,0)
		Loop,16{
			IniRead,col,color.ini,color,%A_Index%,0
			NumPut(col,CUSTOM,(A_Index-1)*4,"UInt")
		}
	}
	NumPut(size,CHOOSECOLOR,0,"UInt"),NumPut(hwnd,CHOOSECOLOR,A_PtrSize,"UPtr")
	,NumPut(Color,CHOOSECOLOR,3*A_PtrSize,"UInt"),NumPut(3,CHOOSECOLOR,5*A_PtrSize,"UInt")
	,NumPut(&CUSTOM,CHOOSECOLOR,4*A_PtrSize,"UPtr")
	ret:=DllCall("comdlg32\ChooseColor","UPtr",&CHOOSECOLOR,"UInt")
	if !ret
	exit
	Loop,16
	IniWrite,% NumGet(custom,(A_Index-1)*4,"UInt"),color.ini,color,%A_Index%
	IniWrite,% Color:=NumGet(CHOOSECOLOR,3*A_PtrSize,"UInt"),color.ini,default,color
	return rgb(Color)
}

/*
Func: Dlg_Font
    Windows font dialog

Parameters:
	Name		-	Font name
	Style		-	Hwnd of window to show on on top of
	Effects		-	Command

Returns:
	-

Examples:
    > style := {size:l_fontSize,color:l_fontColor,strikeout:l_fontStrikeout,underline:l_fontUnderline,italic:l_fontItalic,bold:l_fontBold} ; load vars into style object for font dialog
    > if !Dlg_Font(fontType, style) ; shows the user the font selection dialog
		return ; dialog closed without saving
	> For fontKey, fontValue in style ; load modified vars from style object
	> {
	> 	fontVar := "l_font" fontKey
	> 	%fontVar% := fontValue
	> }
	=	Loads vars l_fontSize etc into object 'style' font dialog is opened which modified values of l_fontSize etc in styleobjects
		then after dlg_font is closed by selecting a new font, retrieve changed vars from style object
	
Source: https://autohotkey.com/board/topic/94083-ahk-11-font-and-color-dialogs/
*/
;to get any of the style return values : value:=style.bold will get you the bold value and so on
Dlg_Font(ByRef Name,ByRef Style,Effects=1){
	VarSetCapacity(LOGFONT,60),strput(name,&logfont+28,32,"CP0")
	LogPixels:=DllCall("GetDeviceCaps","uint",DllCall("GetDC","uint",0),"uint",90),Effects:=0x041+(Effects?0x100:0)
	for a,b in font:={16:"bold",20:"italic",21:"underline",22:"strikeout"}
	if style[b]
	NumPut(b="bold"?700:1,logfont,a)
	style.size?NumPut(Floor(style.size*logpixels/72),logfont,0):NumPut(16,LOGFONT,0)
	VarSetCapacity(CHOOSEFONT,60,0),NumPut(60,CHOOSEFONT,0),NumPut(&LOGFONT,CHOOSEFONT,12),NumPut(Effects,CHOOSEFONT,20),NumPut(RGB(style.color),CHOOSEFONT,24)
	if !r:=DllCall("comdlg32\ChooseFontA", "uint",&CHOOSEFONT)
	return
	Color:=RGB(NumGet(CHOOSEFONT,24))
	style:={size:NumGet(CHOOSEFONT,16)//10,name:name:=StrGet(&logfont+28,"CP0"),color:color,bold:bold}
	for a,b in font
	style[b]:=NumGet(LOGFONT,a,"UChar")?1:0
        style.bold:=NumGet(LOGFONT,16)>=700?1:0
	return 1
}

rgb(c){
	setformat,IntegerFast,H
	c:=(c&255)<<16|(c&65280)|(c>>16),c:=SubStr(c,1)
	SetFormat,IntegerFast,D
	return c
}