----------------labels
InitStruct:
global POINTL:="x,y"
global DEVICEMODE :="
(
TCHAR dmDeviceName[32]; // CCHDEVICENAME:=32
WORD dmSpecVersion;
WORD dmDriverVersion;
WORD dmSize;
WORD dmDriverExtra;
DWORD dmFields;
union {
struct {
short dmOrientation;
short dmPaperSize;
short dmPaperLength;
short dmPaperWidth;
short dmScale;
short dmCopies;
short dmDefaultSource;
short dmPrintQuality;
};
struct {
POINTL dmPosition;
DWORD dmDisplayOrientation;
DWORD dmDisplayFixedOutput;
};
};
short dmColor;
short dmDuplex;
short dmYResolution;
short dmTTOption;
short dmCollate;
TCHAR dmFormName[32];
WORD dmLogPixels;
DWORD dmBitsPerPel;
DWORD dmPelsWidth;
DWORD dmPelsHeight;
union {
DWORD dmDisplayFlags;
DWORD dmNup;
};
DWORD dmDisplayFrequency;
DWORD dmICMMethod;
DWORD dmICMIntent;
DWORD dmMediaType;
DWORD dmDitherType;
DWORD dmReserved1;
DWORD dmReserved2;
DWORD dmPanningWidth;
DWORD dmPanningHeight;
)"
Return

----------------functions
ChangeDisplaySettings( cD, sW, sH, rR ) {
dm:=new _Struct(DEVICEMODE),dm.dmSize:=sizeof(dm)
DllCall( "EnumDisplaySettings", UInt,0, UInt,-1, PTR,dM[""] )
dm.dmFields:=0x5c0000
dm.dmPelsWidth := sW
dm.dmPelsHeight := sH
dm.dmDisplayFrequency := rR
Return DllCall( "ChangeDisplaySettings", PTR,dM[""], UInt,0 )
}
