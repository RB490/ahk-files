guiAbout() {
	; properties
	Gui about: New, +LastFound
	Gui about: +LabelguiAbout_
	
	; controls
	gui about: font, s12
	gui about: Add, Text,, Links
	gui about: font
	gui about: Add, Link,, Author: <a href="https://github.com/0125/ahk-rs-dropLogger">https://github.com/0125</a>
	gui about: Add, Link,, Home Page: <a href="https://github.com/0125/ahk-rs-dropLogger">https://github.com/0125/ahk-rs-dropLogger</a>
	gui about: font, s12
	gui about: Add, Text,, Info
	gui about: font
	gui about: Add, Text,, Prices are from OSBuddy's exchange`nImages and other data are from OSBuddy and the OSRS Wiki
	gui about: font, s12
	gui about: Add, Text,, Last updated
	gui about: font
	
	; Gui settings: Add, Text, x+5 yp+5 w190 hwnd_lastDatabaseUpdateDisplay, % "Last updated: " lastDatabaseUpdate_formatted
	
	If (ini_getValue(ini, "General", "lastProgramUpdate"))
		FormatTime, lastProgramUpdate_formatted, % ini_getValue(ini, "General", "lastProgramUpdate"), dd/MM/yyyy @ HH:mm:ss
	Gui about: Add, Text, w190, % "Program: " lastProgramUpdate_formatted
	
	If (ini_getValue(ini, "General", "lastItemDatabaseUpdate"))
		FormatTime, lastItemDatabaseUpdate_formatted, % ini_getValue(ini, "General", "lastItemDatabaseUpdate"), dd/MM/yyyy @ HH:mm:ss
	Gui about: Add, Text, w190, % "ItemDatabase: " lastItemDatabaseUpdate_formatted
	
	If (ini_getValue(ini, "General", "lastdatabaseUpdate"))
		FormatTime, lastdatabaseUpdate_formatted, % ini_getValue(ini, "General", "lastdatabaseUpdate"), dd/MM/yyyy @ HH:mm:ss
	Gui about: Add, Text, w190, % "Database: " lastdatabaseUpdate_formatted
	
	; show
	gui about: show, , % AppName " About"
	return
	
	guiAbout_close:
		gui about: destroy
	return
}