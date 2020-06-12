/*
	Create and read item id json file into object
	Get information from object
*/
class class_database {
	__New() {
		this.file := A_ScriptDir "\res\json\database.json"
		If !FileExist(this.file)
			this.rebuild()
		this.obj := JSON.Load(FileRead(this.file))
		
		this.mobList := this._getMobList() ; rebuild mob with a droplog list
	}
	
	/*
		Deletes and writes database file + obj
	*/
	rebuild() {
		this.obj := this._getBestiary()
		progress := new class_progress("Rebuilding database", A_Space, A_Space, A_Space, A_Space)
		this._writeObj()
		ini_replaceValue(ini, "General", "lastdatabaseRebuild", A_Now)
		ini_replaceValue(ini, "General", "lastdatabaseUpdate", A_Now)
		
		this.mobList := this._getMobList() ; rebuild mob with a droplog list
		
		progress.Destroy()
		progress := ""
	}
	
	/*
		Checks for new mobs and adds them
	*/
	update() {
		progress := new class_progress("Updating database", A_Space, A_Space, A_Space, A_Space)
		progress.SubText("Checking for new mobs")
		
		;; check if there are any new mobs that do not exist in database
		details := this.getBestiaryDetails()
		new := [] ; simple array of new mobs to add
		for k in details["items"]
			If !(this.obj.HasKey(details["items"][k]["title"]))
				new.push(details["items"][k]["title"])
		
		progress.ProgressBar(50)
		progress.SubText("Adding new mobs")
		progress.ProgressBar2MaxRange(new.length())
		
		; add new mobs to database
		loop, % new.length() {
			mob := new[A_Index]
			obj := this._getMobInfo(details, mob) ; get mob info
			this.obj[mob] := obj ; add mob info to database
			
			progress.ProgressBar2("+1")
			progress.SubText2(mob)
		}
		
		this.mobList := this._getMobList() ; rebuild mob with a droplog list
		
		this._writeObj()
		ini_replaceValue(ini, "General", "lastdatabaseUpdate", A_Now)
		
		progress.Destroy()
		progress := ""
	}
	
	_writeObj() {
		FileDelete, % this.file
		output := JSON.Dump(this.obj,,2)
		FileAppend, % output, % this.file
		return
	}
	
	/*
		Returns
			Object with details of all bestiary monsters. Info: http://oldschoolrunescape.wikia.com/api/v1
	*/
	getBestiaryDetails() {
		; grab list of all bestiary monster wiki ids
		input := JSON.Load(DownloadToJson("http://2007.runescape.wikia.com/api/v1/Articles/List?category=bestiary&limit=9999"))
		
		loop, % input["items"].length()
		{
			!(ids) ? ids := input.items[A_Index].id : ids .= "," input.items[A_Index].id
		}
		ids .= "," 82089 ; add raids
		
		; return list of all bestiary monster details
		return JSON.Load(DownloadToJson("http://2007.runescape.wikia.com/api/v1/Articles/Details?ids=" ids "&abstract=500&width=200&height=200&limit=100"))
	}
	
	/*
		Parameters
			details = object containing mob api details ( from getBestiaryDetails() )
			mob = mob name
			
		Returns
			object with layout:
				{
					Title = Title
					Drop Table = 1 (or 0 if it has no Drop Table)
					Rare Drop Table = 1 (or 0 if it has no access)
					Img = img url
	*/
	_getMobInfo(obj, mob) {
		If !IsObject(obj) {
			msgbox _getMobInfo(): Input passed to object parameter is not an object!`n`nClosing..
			exitapp
		}
		
		output := [] ; create output array
		for id in obj["items"] ; go through wiki article ids getting information about each mob and adding to output
		{
			If (obj["items"][id]["title"] = mob) {
				title:="",img:="",details:="" ; clear vars for each new loop
				
				title := obj["items"][id].title ; mob title
				If (obj["items"][id].thumbnail) and InStr(obj["items"][id].thumbnail, ".png") {	; mob img url
					img := obj["items"][id].thumbnail
					img := SubStr(img, 1, InStr(img, ".png") + 3)
				}
				else 
					img := getWikiImgUrl(title)
				
				; does the mob have a Drop Table?
				details := DownloadToString("http://2007.runescape.wikia.com/api/v1/Articles/AsSimpleJson?id=" id)
				dropSearchKey = "title":"Drops"
				dropSearchKey2 = "title":"Loot table" ; raids
				rareDropSearchKey =  "title":"Rare Drop Table"
				
				output := {}
				output["Title"] := title
				If (img)
					output["Img"] := img
				If InStr(details, dropSearchKey) or InStr(details, dropSearchKey2)
					output["Drop Table"] := 1
				else
					output["Drop Table"] := 0
				If InStr(details, rareDropSearchKey)
					output["Rare Drop Table"] := 1
				else
					output["Rare Drop Table"] := 0
			}
		}
		return output
	}
	
	/*
		Returns
			bestiary object with layout:
				{
					Title = Title
					Drop Table = array with associative arrays (if it has one) with layout:
						{
							Quantity
							Drop Rate
							Title
						}
					Rare Drop Table = 1 (or 0 if it has no access)
					Img = img url
	*/
	_getBestiary() {
		output := []
		
		filePath := A_Temp "\" A_ScriptName A_Now A_TickCount ".misc"
		run, %A_ScriptDir%\res\buildBestiaryDatabase.exe %filePath%
		loop, {
			If FileExist(filePath) {
				output := JSON.Load(FileRead(filePath))
				FileDelete, % filePath
				break
			}
			else
				sleep 100
		}
		
		progress.ProgressBar(50)
		
		;; add additional mobs. such as cluescrolls, minigames with a drop table and the Rare Drop Table
		; Rare Drop Table
		obj := class_getWikiDroptables.getDropTable("Rare_drop_table")
		obj.InsertAt(1, {"Title": "No drop", "Quantity": 1})
		output["Rare Drop Table"] := {"Title": "Rare Drop Table"}
		output["Rare Drop Table"]["Rare Drop Table"] := obj
		
		; download Rare Drop Table images images
		for k in output["Rare Drop Table"]["Rare Drop Table"]
			rareCount++
		
		progress.SubText("Downloading rare drop table images")
		progress.ProgressBar2MaxRange(rareCount)
		
		for k in output["Rare Drop Table"]["Rare Drop Table"]
		{
			DownloadDropImage(output["Rare Drop Table"]["Rare Drop Table"][k]["title"], output["Rare Drop Table"]["Rare Drop Table"][k]["img"])
			
			progress.ProgressBar2("+1")
			progress.SubText2(output["Rare Drop Table"]["Rare Drop Table"][k]["title"])
		}
		
		loop, parse, % "Easy,Medium,Hard,Elite,Master", `, ; clue scrolls
			output["Clue Scroll (" A_LoopField ")"] := {"Title": "Clue Scroll (" A_LoopField ")", "Drop Table": 1, "Img": "https://vignette3.wikia.nocookie.net/2007scape/images/d/df/Clue_scroll_detail.png"}

		output["Barbarian Assault"] := {"Title": "Barbarian Assault", "Drop Table": 1, "Img": "https://vignette4.wikia.nocookie.net/2007scape/images/2/28/Barbarian_Assault_gameplay.png"} ; barbarian assault

		output["Barrows"] := {"Title": "Barrows", "Drop Table": 1, "Img": "https://vignette4.wikia.nocookie.net/2007scape/images/8/8f/Barrows_minigame.png"} ; barrows
		
		output["Gnome Restaurant"] := {"Title": "Gnome Restaurant", "Drop Table": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/4/4c/Gnome_Restaurant.png"} ; Gnome Restaurant

		; output["Baby impling"] := {"Title": "Baby impling", "Drop Table": 1, "Img": "https://vignette1.wikia.nocookie.net/2007scape/images/9/9a/Baby_impling.png"} ; Baby impling
		; output["Young impling"] := {"Title": "Young impling", "Drop Table": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/2/2f/Young_impling.png"} ; Young impling
		; output["Gourmet impling"] := {"Title": "Gourmet impling", "Drop Table": 1, "Img": "https://vignette1.wikia.nocookie.net/2007scape/images/9/95/Gourmet_impling.png"} ; Gourmet impling
		; output["Earth impling"] := {"Title": "Earth impling", "Drop Table": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/8/88/Earth_impling.png"} ; Earth impling
		; output["Essence impling"] := {"Title": "Essence impling", "Drop Table": 1, "Img": "https://vignette3.wikia.nocookie.net/2007scape/images/d/d1/Essence_impling.png"} ; Essence impling
		; output["Eclectic impling"] := {"Title": "Eclectic impling", "Drop Table": 1, "Img": "https://vignette3.wikia.nocookie.net/2007scape/images/d/d4/Eclectic_impling.png"} ; Eclectic impling
		; output["Nature impling"] := {"Title": "Nature impling", "Drop Table": 1, "Img": "https://vignette1.wikia.nocookie.net/2007scape/images/7/73/Nature_impling.png"} ; Nature impling
		; output["Magpie impling"] := {"Title": "Magpie impling", "Drop Table": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/a/a5/Magpie_impling.png"} ; Magpie impling
		; output["Dragon impling"] := {"Title": "Dragon impling", "Drop Table": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/c/cb/Dragon_impling.png"} ; Dragon impling
		; output["Lucky impling"] := {"Title": "Lucky impling", "Drop Table": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/0/03/Lucky_impling.png"} ; Lucky impling
		
		output["Baby impling jar"] := {"Title": "Baby impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/5/54/Baby_impling_jar.png"} ; Baby impling jar
		output["Young impling jar"] := {"Title": "Young impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/1/1e/Young_impling_jar.png"} ; Young impling jar
		output["Gourmet impling jar"] := {"Title": "Gourmet impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/6/68/Gourmet_impling_jar.png"} ; Gourmet impling jar
		output["Earth impling jar"] := {"Title": "Earth impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/4/43/Earth_impling_jar.png"} ; Earth impling jar
		output["Essence impling jar"] := {"Title": "Essence impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/5/54/Essence_impling_jar.png"} ; Essence impling jar
		output["Eclectic impling jar"] := {"Title": "Eclectic impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/1/14/Eclectic_impling_jar.png"} ; Eclectic impling jar
		output["Nature impling jar"] := {"Title": "Nature impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/d/df/Nature_impling_jar.png"} ; Nature impling jar
		output["Magpie impling jar"] := {"Title": "Magpie impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/f/f3/Magpie_impling_jar.png"} ; Magpie impling jar
		output["Ninja impling jar"] := {"Title": "Ninja impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/8/88/Ninja_impling_jar.png"} ; Ninja impling jar
		output["Dragon impling jar"] := {"Title": "Dragon impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/3/3b/Dragon_impling_jar.png"} ; Dragon impling jar
		output["Lucky impling jar"] := {"Title": "Lucky impling jar", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/a/ae/Lucky_impling_jar.png"} ; Lucky impling jar

		output["Impetuous Impulses"] := {"Title": "Impetuous Impulses", "Drop Table": 1, "Img": "https://vignette3.wikia.nocookie.net/2007scape/images/a/ae/Elnock%27s_Exchange.png"} ; Gnome Restaurant
		
		output["Chambers of Xeric"] := {"Title": "Chambers of Xeric", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/3/34/Mount_Quidamortem.png"} ; Raids
		
		output["Unsired"] := {"Title": "Unsired", "Drop Table": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/f/f2/Unsired_detail.png"} ; Unsired
		
		progress.ProgressBar(100)
		return output
	}
	
	/*
		Parameters
			input =		difficulty/ tier cluescroll with a specific format, eg: Clue Scroll (medium)
			
		Returns
			drop table object with layout:
			{
				Title:
				Quantity:
			}
	*/
	getClueDropTable(input) {
		tier := StringBetween(input, "(", ")")

		progress.SubText("Downloading websites")
		progress.ProgressBar2MaxRange(2)
		
		html := IEGetSourceCode("https://rsbuddy.com/cluescroll")
		progress.ProgressBar2("+1")
		htmlRewards := DownloadToString("http://oldschoolrunescape.wikia.com/wiki/Treasure_Trails")
		progress.ProgressBar2("+1")
		progress.ProgressBar(50)
		
		startKey = <div class="panel rewards-panel" id="%tier%">
		stopKey = <div class="panel rewards-panel" id=

		output := []
		
		; get total item count for progress
		loop, parse, html, `n
		{
			If InStr(A_LoopField, stopKey) and (found)
				break
			
			If InStr(A_LoopField, startKey)
				found := 1
				
			If (found) and InStr(A_LoopField, "data-name") {
				count++
			}
		}
		progress.ProgressBar2MaxRange(count)
		progress.SubText("Getting drop information")
		
		found := ""
		loop, parse, html, `n
		{
			If InStr(A_LoopField, stopKey) and (found)
				break
			
			If InStr(A_LoopField, startKey)
				found := 1
				
			If (found) {
				If InStr(A_LoopField, "data-name") {
					item := Trim(A_LoopField) ; get item from string
					item := SubStr(item, InStr(item, "data-name=") + 11)
					item := SubStr(item, 1, InStr(item, """") - 1)

					; find item img link
					
					key := item
					; adjust format to wikia data-src format
					StringReplace, key, key, % A_Space, _, All
					StringReplace, key, key, (, `%28, All
					StringReplace, key, key, ), `%29, All
					key = /wiki/%key%" ; "

					Img := ""
					loop, parse, htmlRewards, `n ; go through cluescroll reward page
					{
						If InStr(A_LoopField, key) { ; if item is in current line
							LoopField := A_LoopField ; save line

							; find image url in current line
							loop {
								t := StringBetween(LoopField, """", """") ; get string
								
								If InStr(t, "revision") and InStr(t, key) {
									Img := SubStr(t, 1, InStr(t, ".png") + 3) ; remove /revision/latest?cb=20160223033625
									break, 2
								}
								else {
									StringReplace, LoopField, LoopField, "%t%", , UseErrorLevel ; remove string if not the right image
									If !(ErrorLevel) ; until out of strings between quotes
										break, 2
								}
							}
						}
					}
					
					If (Img)
						output.push({"Title": item, "Quantity": "1-100000", "Img": img}) ; add to output
					else
						output.push({"Title": item, "Quantity": "1-100000"}) ; add to output
						
					progress.ProgressBar2("+1")
					progress.SubText2(item)
				}
			}
		}
		
		return output
	}
	
	/*
		Parameters
			input =		mob
			
		Purpose
			get a mobs Drop Table if it has a 'dropTable' key with value and does not have a Drop Table yet
	*/
	getDropTable(input, overwrite := false) {
		If (this.isDropTableAdded(input)) and !(overwrite) or !(this.obj[input]["Drop Table"]) ; if drop Table already added and not overwriting OR if mob has no drop table
			return
		
		progress := new class_progress("Retrieving " input " Drop Table", A_Space, "Downloading tables", A_Space, A_Space)
		
		If InStr(input, "Clue Scroll")
			obj := this.getClueDropTable(input) ; get cluescroll Drop Table
		else if (input = "Barbarian Assault")
			obj := class_getWikiDroptables.getDropTable(input "/Rewards") ; has reward drop table on a separate page http://oldschoolrunescape.wikia.com/wiki/Barbarian_Assault/Rewards
		else if (input = "Menaphite Thug") { ; has bones drop without a drop table http://oldschoolrunescape.wikia.com/wiki/Menaphite_Thug
			obj := []
			obj.push({"Title": "Bones", "Quantity": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/5/5e/Bones.png", "Rarity": "Always"})
		}
		else if (input = "Unsired") { ; has drop table in a normal wiki table style table http://oldschoolrunescape.wikia.com/wiki/Menaphite_Thug
			obj := []
			obj.Push({"Title": "Abyssal head", "Quantity": 1, "Rarity": "10/128 (~7.81%)"})
			obj.Push({"Title": "Abyssal orphan", "Quantity": 1, "Rarity": "5/128 (~3.91%)"})
			obj.Push({"Title": "Abyssal dagger", "Quantity": 1, "Rarity": "26/128 (~20.31%)"})
			obj.Push({"Title": "Abyssal whip", "Quantity": 1, "Rarity": "12/128 (~9.37%)"})
			obj.Push({"Title": "Bludgeon claw", "Quantity": 1, "Rarity": "62/128 (~48.44%)"})
			obj.Push({"Title": "Bludgeon spine", "Quantity": 1, "Rarity": "62/128 (~48.44%)"})
			obj.Push({"Title": "Bludgeon axon", "Quantity": 1, "Rarity": "62/128 (~48.44%)"})
			obj.Push({"Title": "Jar of miasma", "Quantity": 1, "Rarity": "	13/128 (~10.16%)"})
		}
		else if (input = "Impetuous Impulses") { ; has drop table in a normal wiki table style table http://oldschoolrunescape.wikia.com/wiki/Impetuous_Impulses
			obj := []
			obj.push({"Title": "Baby impling", "Quantity": 1, "Img": "https://vignette1.wikia.nocookie.net/2007scape/images/9/9a/Baby_impling.png"})  ; Baby impling
			obj.push({"Title": "Young impling", "Quantity": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/2/2f/Young_impling.png"})  ; Young impling
			obj.push({"Title": "Gourmet impling", "Quantity": 1, "Img": "https://vignette1.wikia.nocookie.net/2007scape/images/9/95/Gourmet_impling.png"})  ; Gourmet impling
			obj.push({"Title": "Earth impling", "Quantity": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/8/88/Earth_impling.png"})  ; Earth impling
			obj.push({"Title": "Essence impling", "Quantity": 1, "Img": "https://vignette3.wikia.nocookie.net/2007scape/images/d/d1/Essence_impling.png"})  ; Essence impling
			obj.push({"Title": "Eclectic impling", "Quantity": 1, "Img": "https://vignette3.wikia.nocookie.net/2007scape/images/d/d4/Eclectic_impling.png"})  ; Eclectic impling
			obj.push({"Title": "Nature impling", "Quantity": 1, "Img": "https://vignette1.wikia.nocookie.net/2007scape/images/7/73/Nature_impling.png"})  ; Nature impling
			obj.push({"Title": "Magpie impling", "Quantity": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/a/a5/Magpie_impling.png"})  ; Magpie impling
			obj.push({"Title": "Dragon impling", "Quantity": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/c/cb/Dragon_impling.png"})  ; Dragon impling
			obj.push({"Title": "Lucky impling", "Quantity": 1, "Img": "https://vignette2.wikia.nocookie.net/2007scape/images/0/03/Lucky_impling.png"})  ; Lucky impling
		}
		else if (input = "Lucky impling jar") { ; does not have a drop table table on its page so add manually: http://oldschoolrunescape.wikia.com/wiki/Lucky_impling
			obj := []
			obj.push({"Title": "Clue scroll (easy)", "Quantity": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/a/a9/Clue_scroll.png", "Rarity": "1/5"})
			obj.push({"Title": "Clue scroll (medium)", "Quantity": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/a/a9/Clue_scroll.png", "Rarity": "1/5"})
			obj.push({"Title": "Clue scroll (hard)", "Quantity": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/a/a9/Clue_scroll.png", "Rarity": "1/5"})
			obj.push({"Title": "Clue scroll (elite)", "Quantity": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/a/a9/Clue_scroll.png", "Rarity": "1/5"})
			obj.push({"Title": "Clue scroll (master)", "Quantity": 1, "Img": "https://vignette.wikia.nocookie.net/2007scape/images/a/a9/Clue_scroll.png", "Rarity": "1/5"})
		}
		else
			obj := class_getWikiDroptables.getDropTable(input) ; get Drop Table
		
		this.obj[input]["Normal Drop Table"] := [] ; create dropTable key for this mob
		loop, % obj.length() ; add items to droptable
			this.obj[input]["Normal Drop Table"].push(obj[A_Index])

		this._writeObj() ; save Drop Table file
		
		; count total images to be downloaded for displaying in progress gui
		for k in this.obj[input]
			If InStr(k, "Drop Table") and !(k = "Rare Drop Table")
				loop, % this.obj[input][k].length()
					count++
		
		progress.ProgressBar(50)
		progress.ProgressBar2MaxRange(count)
		progress.SubText("Downloading images")
		
		for k in this.obj[input] ; download images from all Drop Tables this mob has
			If InStr(k, "Drop Table") and !(k = "Rare Drop Table")
				loop, % this.obj[input][k].length() {
					DownloadDropImage(this.obj[input][k][A_Index]["title"], this.obj[input][k][A_Index]["img"])
					progress.ProgressBar2("+1")
					progress.SubText2(this.obj[input][k][A_Index]["title"])
				}

		progress.ProgressBar(100)
		sleep 10
		progress.Destroy()
		progress := ""
	}
	
	/*
		Parameters
			input =				mob
			Drop Table =		which Drop Table to use
			
		Returns
			array with drops
	*/
	getDropList(mob, dropTable) {
		output := []
		If (dropTable = "Rare Drop Table")
			mob := "Rare Drop Table"
		loop, % this.obj[mob][dropTable].length()
			output.push(this.obj[mob][dropTable][A_Index]["title"])
		return output
	}
	
	/*
		Returns
			array containing all mobs with a droptable
	*/
	_getMobList() {
		output := []
		
		for k, v in this.obj
			If (this.obj[k]["Drop Table"])
				output.push(this.obj[k]["Title"])
		return output
	}
	
	/*
		Parameters
			mob =			mob
			dropTable =		which Drop Table to use
			item =			item (eg: Black sword)
			key =			key (eg: quantity)
		
		Returns
			key value
	*/
	dropTableGet(mob, dropTable, item, key) {
		If (dropTable = "Rare Drop Table")
			mob := "Rare Drop Table"
		loop, % this.obj[mob][dropTable].length()
			If (this.obj[mob][dropTable][A_Index]["title"] = item)
				return this.obj[mob][dropTable][A_Index][key]
	}
	
	/*
		Parameters
			mob =			mob
			dropTable =		which Drop Table to use
			index =			index (eg: 10)
		
		Returns
			object
	*/
	dropTableGetObj(mob, dropTable, index) {
		If (dropTable = "Rare Drop Table")
			mob := "Rare Drop Table"
		
		if index is not integer
		{
			msgbox % A_ThisFunc "(): index parameter was not an integer `n`nClosing.."
			exitapp
		}
		
		return this.obj[mob][dropTable][index].Clone()
	}
	
	/*
		Parameters
			mob =			mob
		
		Returns
			bool
	*/
	isDropTableAdded(mob) {
		for k in this.obj[mob]
			If InStr(k, "Drop Table") and IsObject(this.obj[mob][k])
				return true
		return false
	}
}