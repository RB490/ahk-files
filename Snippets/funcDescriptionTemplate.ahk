/*
Func: guiAddonInfo
    Form to create and edit addoninfo files

Parameters:
    file	-	Path to addoninfo.txt file

Returns:
    ErrorLevel on nonexistent file parameter or when the dialog for selecting a folder
	to create a new addoinfo file is closed without selecting a folder
	
Examples:
    > guiAddonInfo()
    =	prompts to select a folder to create new addonfile and opens form with default values
	
	> guiAddonInfo("e:\downloads\addoninfo.txt")
	=	opens form with contents of addoninfo.txt
*/