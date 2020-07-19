debugLog(input) { ; set filter to ahk in DebugView
	; OutputDebug, % A_ScriptName ": " A_ThisFunc "(): " input
	
	
	; FormatTime, now_formatted, % A_Now, dd/MM/yyyy @ HH:mm:ss
	FormatTime, now_formatted, % A_Now, HH:mm:ss
	; OutputDebug, % now_formatted ":" input
	; OutputDebug, % A_ScriptName A_Space now_formatted " = " input
	OutputDebug, % A_ScriptName ": " input
}

convertEnumerate(input) {
	If (IsObject(input)) { ; input is object, convert to string
		output := JSON.Dump(input)
		StringReplace, output, output, % """", #A_QUOTE#, All
		StringReplace, output, output, % A_Space, #A_SPACE#, All
	}
	else { ; input is string, convert to object
		StringReplace, output, input, #A_QUOTE#, % """", All
		StringReplace, output, output, #A_SPACE#, % A_Space, All
		output := JSON.Load(output)
	}
	
	debugLog(A_ThisFunc "(): Returning")
	return output
}

/*
	Parameters
		way = to OR from
		input = input string

	Purpose
		Allows to assign and retrieve information in gui variables since they don't allow strange characters
		
	Returns
		Converted input string
*/
convertChars(way, input) {
	If (way = "from") { ; convert from strange to normal characters
		StringReplace, output, input, % A_Space, $space$, All
		StringReplace, output, output, (, $parenthesisOpen$, All ; eg: cluescroll (medium)
		StringReplace, output, output, ), $parenthesisClose$, All ; eg: cluescroll (medium)
		StringReplace, output, output, `%, $percentage$, All
		StringReplace, output, output, &, $andSymbol$, All
		StringReplace, output, output, /, $forwardSlash$, All
		StringReplace, output, output, ', $apostrophe$, All
		StringReplace, output, output, `,, $comma$, All
	}
	
	If (way = "to") { ; convert from normal to strange characters
		StringReplace, output, input, $space$, % A_Space, All
		StringReplace, output, output, $parenthesisOpen$, (, All ; eg: cluescroll (medium)
		StringReplace, output, output, $parenthesisClose$, ), All ; eg: cluescroll (medium)
		StringReplace, output, output, $percentage$, `%, All
		StringReplace, output, output, $andSymbol$, &, All
		StringReplace, output, output, $forwardSlash$, /, All
		StringReplace, output, output, $apostrophe$, ', All
		StringReplace, output, output, $comma$, `,, All
	}
	
	return output
}

disableToolTip(WhichToolTip = "") {
	ToolTip, , , , % WhichToolTip
}

/*
	Parameters
		start =				YYYYMMDDHH24MISS format starting time
		end =				YYYYMMDDHH24MISS format ending time
		(ByRef) output1		passed time in seconds
		(ByRef) output2		passed time formatted

	Purpose
		Calculates how much time has passed between start and end
		
	Returns
		Passed time in seconds and passed time formatted
*/
getPassedTime(start, end, ByRef output1 := "", ByRef output2 := "") {
	output1 := ""
	output2 := ""
	
	totalPassedSeconds := end
	EnvSub, totalPassedSeconds, start, Seconds
	
	passedSeconds := totalPassedSeconds
	
	passedDays := Floor(passedSeconds / 86400) ; how many Days
	passedSeconds -= (passedDays * 86400)
	
	passedHours := Floor(passedSeconds / 3600) ; how many hours
	passedSeconds -= (passedHours * 3600)
	
	passedMinutes := Floor(passedSeconds / 60) ; how many minutes
	passedSeconds -= (passedMinutes * 60)

	If (passedHours < 10)
		passedHours := "0" passedHours
	If (passedMinutes < 10)
		passedMinutes := "0" passedMinutes
	If (passedSeconds < 10)
		passedSeconds := "0" passedSeconds

	output1 := totalPassedSeconds
	
	If (passedDays) {
		If (passedDays = 1)
			output2 := passedDays " Day "
		else
			output2 := passedDays " Days "
	}
	output2 .= passedHours ":" passedMinutes ":" passedSeconds
}

/*
	Purpose
		Loads vars
*/
loadSettings() {
	pl := new class_progress("Initializing", A_Space, A_Space)
	pl.ProgressBarMaxRange(4)
	
	; create or restore folder structure
	FileCreateDir, % A_ScriptDir "\res\json"
	FileCreateDir, % A_ScriptDir "\res\img\items"
	FileCreateDir, % A_ScriptDir "\res\img\mobs"
	FileCreateDir, % A_ScriptDir "\res\img\mobs icons"
	
	pl.SubText("Item database")
	itemIds := new class_itemIds
	pl.ProgressBar(1)
	pl.SubText("Mob database")
	database := new class_database
	pl.ProgressBar(2)
	pl.SubText("Item categories database")
	categoriesDatabase := new class_categoryDatabase
	pl.ProgressBar(3)
	pl.SubText("Settings")

	iniCheckFile := A_Temp "\" A_TickCount A_Now ".ini"
	
	; restore critical files if they dont exist
	loop, parse, % "coins.png,no drop.png,no image available.png", CSV
		If !FileExist(A_ScriptDir "\res\img\" A_LoopField)
			URLDownloadToFile, https://raw.githubusercontent.com/0125/ahk-rs-droplogger/master/res/img/%A_LoopField%, % A_ScriptDir "\res\img\" A_LoopField
	
	; presets ini
	ini_load(iniPresets, iniPresetsFile)
	If (ErrorLevel) {
		writeIni(iniPresets, iniPresetsFile)
		ini_load(iniPresets, iniPresetsFile)
	}

	; settings ini
	ini_load(ini, iniSettingsFile)
	If (ErrorLevel)	{
		writeIni(ini, iniSettingsFile, "settings")
		ini_load(ini, iniSettingsFile)
	}
	else {
		writeIni(iniCheck, iniCheckFile, "settings")
		ini_load(iniCheck, iniCheckFile)
		If (ini_getAllKeyNames(ini) != ini_getAllKeyNames(iniCheck)) or (ini_getAllSectionNames(ini) != ini_getAllSectionNames(iniCheck)) {
			FileDelete, % iniSettingsFile
			ini_load(ini, iniSettingsFile) ; empty ini var
			writeIni(ini, iniSettingsFile, "settings")
			ini_load(ini, iniSettingsFile)
		}
		FileDelete, % iniCheckFile
	}
	pl.ProgressBar(4)
	
	pl.Destroy()
	pl := ""
}

/*
	Parameters
		var =			ini var
		file =			ini file
		type (opt) =	settings or blank

	Purpose
		Writes ini file
*/
writeIni(var, file, type = "") {
	If (type = "settings") {
		ini_insertSection(var, "General")
			ini_insertKey(var, "General", "g_mob=")
			ini_insertKey(var, "General", "s_preset=")
			ini_insertKey(var, "General", "lastProgramUpdateSha=" . "")
			ini_insertKey(var, "General", "lastProgramUpdate=" . "")
			ini_insertKey(var, "General", "lastItemDatabaseUpdate=" . "")
			ini_insertKey(var, "General", "lastdatabaseUpdate=" . "")
			
		ini_insertSection(var, "Settings")
			ini_insertKey(var, "Settings", "autoOpenStats=" . "0")
			ini_insertKey(var, "Settings", "guiLogTabCategories=" . "0")
			ini_insertKey(var, "Settings", "guiLogRowLength=" . "8")
			ini_insertKey(var, "Settings", "guiLogImgSize=" . "45")
			
			ini_insertKey(var, "Settings", "showTab_Mob=" . "1")
			ini_insertKey(var, "Settings", "showTab_Drop=" . "1")
			ini_insertKey(var, "Settings", "showTab_Amount=" . "1")
			ini_insertKey(var, "Settings", "showTab_Value=" . "1")
			ini_insertKey(var, "Settings", "showTab_DropRate=" . "1")
			ini_insertKey(var, "Settings", "showTab_WikiDropRate=" . "1")
			ini_insertKey(var, "Settings", "showTab_KillsSinceLastDrop=" . "1")
			ini_insertKey(var, "Settings", "showTab_ShortestDryStreak=" . "1")
			ini_insertKey(var, "Settings", "showTab_LongestDryStreak=" . "1")
		
		ini_insertSection(var, "Window Positions")
			ini_insertKey(var, "Window Positions", "guiMainX=" . "")
			ini_insertKey(var, "Window Positions", "guiMainY=" . "")
			ini_insertKey(var, "Window Positions", "guiLogX=" . "")
			ini_insertKey(var, "Window Positions", "guiLogY=" . "")
			ini_insertKey(var, "Window Positions", "guiStatsX=" . "")
			ini_insertKey(var, "Window Positions", "guiStatsY=" . "")
			ini_insertKey(var, "Window Positions", "guiStatsW=" . "")
			ini_insertKey(var, "Window Positions", "guiStatsH=" . "")
			ini_insertKey(var, "Window Positions", "guiSettingsX=" . "")
			ini_insertKey(var, "Window Positions", "guiSettingsY=" . "")
	}
	
	ini_save(var, file)
}

/*
	Triggers when hovering over gui
*/
WM_MOUSEMOVE() {
	static oldTip
	
	obj := getMouseObj()
	If !IsObject(obj)
		tip := ""
	else
		tip := getToolTip(obj)

	If !(tip) {
		oldTip := ""
		disableToolTip()
		return
	}
	If !(tip = oldTip)
		tooltip, % tip
	oldTip := tip
}

/*
	Triggers when left mouse button is released
*/
WM_LBUTTONUP() {
	obj := getMouseObj()
	If !IsObject(obj)
		return

	If !(dropLog.stats.isTripOnGoing) { ; dont continue without trip started
		tooltip No trip started!
		fn := Func("disableToolTip").bind()
		SetTimer, %fn%, -500
		return
	}

	; get vars for showing guis
	CoordMode, Mouse, Screen
	MouseGetPos, mX, mY, _WIN, CTRL
	ControlGetPos, xCtrl, yCtrl, wCtrl, hCtrl, % CTRL, % "ahk_id " _WIN
	WinGetPos, xWin, yWin, , , % "ahk_id " _WIN
	xx := xWin + xCtrl + 2
	yy := yWin + yCtrl + 2
	
	If (obj.title = "rare drop table") { ; activate rare tab if rare drop was selected
		GuiControl, Choose, SysTabControl321, rare
		return
	}
	
	; show guis if applicable
	quantityType := getItemQuantityType(obj.quantity, high, low, buttons) ; get quantity type and highest & lowest buttons
	
	If (quantityType = "varied") {
		; create button array
		quantity := guiDigitsVaried(buttons, mX, mY)
		If !(quantity)
			return
	}
	If (quantityType = "variedRange") {
		; create button array
		buttons := []
		loop, % high
		{
			If (low + count > high) ; break if all digits have been added
				break
			
			If !(count) ; first loop
				buttons.push(low)
			else
				buttons.push(low + count)
			count++
		}
		
		quantity := guiDigitsVaried(buttons, mX, mY)
		If !(quantity)
			return
	}
	If (quantityType = "custom") {
		quantity := guiDigitsCustom(xx, yy, wCtrl)
		If !(quantity)
			return
	}
	If !(quantity)
		 quantity := obj.quantity ; set quantity in selected drop
	
	; add output to gui & global drops object
	obj.Quantity := quantity ; save set quantity to obj
	
	ControlGetText, drops, Edit2, % AppName
	If !(drops) {
		g_drops := {}
		g_drops.push(obj.clone())
		ControlSetText, Edit2, % getToolTip(obj, quantity), % AppName
	}
	else {
		g_drops.InsertAt(1, obj.clone())
		ControlSetText, Edit2, % drops ", " getToolTip(obj, quantity), % AppName
	}
	GuiControl log: Enable, % g__btnClearDrops
}

/*
	Returns
		string, eg:
			custom x pure essence
			varied x coins
			321 x gold bars
*/
getMouseObj() {
	GuiControlGet, sTab, , SysTabControl321, % AppName
	If !(sTab)
		return
	
	; read info from window and control cursor is hovering over
	MouseGetPos, , , _WIN, CTRL
	MouseGetPos, , , , _CTRL, 2
	
	; return if window is not drop logger or control under mouse is a static control aka picture
	WinGetTitle, w, % "ahk_id " _WIN
	If !InStr(w, "Drop Logger") or !InStr(CTRL, "static")
		return
	
	; get item name from image control path
	ControlGetText, t, % CTRL, % "ahk_id " _WIN
	StringReplace, t, t, @, /, All ; convert @'s to slashes because a filename cant contain slashes, DownloadDropImage converts them on download
	SplitPath, t,,,, item
	
	; get mob from gui controls variable as assigned in guiLog_loadDropTable
	GuiControlGet, controlVar, %_WIN%:Name, %_CTRL%
	
	loop, parse, controlVar, #
	{
		If (A_Index = 1)
			cMob := A_LoopField
		If (A_Index = 2)
			cDropTable := A_LoopField
		If (A_Index = 3)
			cIndex := A_LoopField
	}
	
	; converted in guiLog()
	cMob := convertChars("to", cMob)
	cDropTable := convertChars("to", cDropTable)
	cIndex := convertChars("to", cIndex)
	
	If !(cMob) or !(cDropTable) or !(cIndex)
		return
	
	; get & modify object
	obj := database.DropTableGetObj(cMob, cDropTable, cIndex)
	
	obj.Delete("img")
	obj.Delete("DropRate")
	obj["Drop Table"] := cDropTable
	obj["Mob"] := g_mob
	
	return obj
}

/*
	Parameters
		obj =				item object as retrieved by getMouseObj()
		quantity (opt) =	if not specified item quantity gets converted eg: 1-1000 gets converted to 'varied' to show guiDigitsVaried gui on WM_LBUTTONUP
	
	Returns
		eg: 460 x Pure Essence (noted) or Pure Essence
*/
getToolTip(obj, quantity = "") {
	If !(IsObject(obj)) {
		msgbox %A_ThisFunc%: Input parameter was not an object!`n`nClosing..
		exitapp
	}
	
	If !(quantity) {
		quantity := obj.quantity
		quantity := getItemQuantityType(quantity)
	}
	
	If (quantity = 1)
		output := obj.title
	else
		output := quantity " x " obj.title
	
	If (obj.noted)
		output .= " (noted)"
		
	return output
}

/*
	Parameters
		input =		quantity eg:
						1-3
						385
						356; 498; 468
	
	Returns
		string (these would be the results from the numbers shown in input), eg:
			varied
			385
			custom
*/
getItemQuantityType(input, ByRef highDigit = "", ByRef lowDigit = "", ByRef buttons = "") {
	output := input
	
	; set quantity
	temp := []
	loop, parse, input
	{
		If (A_LoopField = ";") {
			semicolon := true
			output := "varied"
			break
		}
		
		If A_LoopField is not integer ; assuming eg: "1-3"
		{
			notInt := 1
			loop, % temp.length()
				digits .= temp.pop()
			digits .= "`n"
		}
		else
			temp.InsertAt(1, A_LoopField)
	}
	
	If (notInt) { ; assuming format: 1-3
		loop, % temp.length()
			digits .= temp.pop()
		Sort, digits, NR ; high to low
		loop, parse, digits, `n
		{
			If (A_Index = 1)
				highDigit := A_LoopField
			If (A_Index = 2)
				lowDigit := A_LoopField
		}
		
		If ((highDigit - lowDigit) > 16) ; if more digits then X use custom input gui
			output := "custom"
		else
			output := "variedRange"
	}
	
	If (semicolon) { ; assuming format: 356; 498; 468
		buttons := []
		
		loop, parse, input, `;
		{
			LoopField := StrReplace(A_LoopField, A_Space)
			buttons.push(LoopField)
		}
	}
	
	return output
}

/*
	Parameters
		title =			mob title
		url =			image url (if not specified 'no img available' image is used)
		overwrite =		overwrite if parameter specified

	Purpose
		Downloads images
*/
DownloadMobImage(title, url = "", overwrite = "") {
	If !(overwrite) and FileExist(A_ScriptDir "\res\img\mobs\" title ".png")
		return
	
	If !(url) {
		FileCopy, % A_ScriptDir "\res\img\no image available.png", % A_ScriptDir "\res\img\mobs\" title ".png"
		return
	}
	
	; download with same width & height as guiMain displays them, or lower. to save disk space
	DownloadToFile(url "/revision/latest/fixed-aspect-ratio/width/237/height/237?fill=transparent", A_ScriptDir "\res\img\mobs\" title ".png")
}

/*
	Parameters
		title =			mob title
		url =			image url (if not specified 'no img available' image is used)
		overwrite =		overwrite if parameter specified

	Purpose
		Downloads images
*/
DownloadMobIcon(title, url = "", overwrite = "") {
	If !(overwrite) and FileExist(A_ScriptDir "\res\img\mobs icons\" title ".png")
		return
	
	If !(url) {
		FileCopy, % A_ScriptDir "\res\img\no image available.png", % A_ScriptDir "\res\img\mobs icons\" title ".png"
		return
	}
	
	; download icon size image
	DownloadToFile(url "/revision/latest/fixed-aspect-ratio/width/32/height/32?fill=transparent", A_ScriptDir "\res\img\mobs icons\" title ".png")
}

/*
	Parameters

	Purpose
		Downloads images
*/
DownloadDropImage(title, url = "", overwrite = "") {
	If !(overwrite) and FileExist(A_ScriptDir "\res\img\items\" title ".png")
		return
	
	If (title = "no drop") {
		FileCopy, % A_ScriptDir "\res\img\no drop.png", % A_ScriptDir "\res\img\items\no drop.png"
		return
	}

	If !(url)
		url := getWikiImgUrl(title)

	StringReplace, title, title, /, @, All ; filename cant contain slashes

	DownloadToFile(url "/revision/latest/fixed-aspect-ratio-down/width/38/height/38?fill=transparent", A_ScriptDir "\res\img\items\" title ".png")
}

/*
	Parameters
		input =	article name
	
	Returns
		Image url
*/
getWikiImgUrl(input) {
	StringReplace, input, input, % A_Space, _, All

	; get image name. not always identical to article name eg: http://2007.runescape.wikia.com/wiki/Afflicted. image used is afflicted_woman.png
	img := DownloadToString("http://2007.runescape.wikia.com/wiki/" input)

	img := SubStr(img, InStr(img, "</caption>"))
	img := SubStr(img, 1, InStr(img, "</td></tr>"))

	StringReplace, img, img, img src=,img src=, UseErrorLevel ; find last image occurence to download for example: Willow_seed_5.png instead of Willow_seed_1.png
	lastImgSrcOccurence := ErrorLevel
	img := SubStr(img, InStr(img, "img src=", , , lastImgSrcOccurence))
	img := StringBetween(img, """", """")
	img := SubStr(img, 1, InStr(img, "/revision") -1 )


	return img
}

/*
	Parameters
		Haystack = 		string
		SearchText = 	string to be searched in Haystack
	
	Purpose
		Gets information from wikia html strings
*/
string_countOccurences(Haystack, SearchText) {
	StringReplace, OutputVar, Haystack, % SearchText, % SearchText, UseErrorLevel
	return ErrorLevel
}

/*
	Parameters
		input		= string
		removedLine	= removed line output var
	
	Returns
		Removes last line from string and returns it
*/
removeLastLine(input, ByRef removedLine := "") {
	lines := TF_CountLines(input)
	
	loop, parse, % input, `n
	{
		If (A_Index = lines) {
			removedLine := A_LoopField
			break
		}
		output .= A_LoopField "`n"
	}
	return RTrim(output, "`n`r")
}

/*
	Parameters
		haystack	= object to be searched
		needle		= string to be searched in haystack
	
	Returns
		needle index if found, 0 if not found
*/
HasVal(haystack, needle) {
	if !(IsObject(haystack))
		return 0
	for index, value in haystack
		if (value = needle)
			return index
	return 0
}

/*
	Parameters
		url	= webpage url
	
	Returns
		source code of specified url
*/
IEGetSourceCode(url) {
	ie := ComObjCreate("InternetExplorer.Application")
	ie.Navigate(url)

	While ie.readyState!=4 || ie.document.readyState!="complete" || ie.busy
		Sleep 50
		
	output := ie.document.documentElement.innerHTML
	
	If InStr(output, "Checking your browser") { ; cloudflare check
		loop, {
			If (A_Index = 20) {
				msgbox IEGetSourceCode(): attempted to retrieve source code from url "%url%" for 20 seconds but cloudflare is still active. `n`nClosing..
				exitapp
			}
			
			sleep 1000
			output := ie.document.documentElement.innerHTML
			
			If !InStr(output, "Checking your browser")
				break
		}
	}
	ie.quit
	
	return output
}