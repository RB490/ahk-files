Date := "2012/02/04"

StringReplace, Date, Date, /, , All

FormatTime, Date, %Date%, MM/dd/yyyy

MsgBox, % Date