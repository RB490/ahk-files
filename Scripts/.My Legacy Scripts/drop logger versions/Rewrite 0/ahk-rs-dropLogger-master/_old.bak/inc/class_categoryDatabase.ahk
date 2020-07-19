class class_categoryDatabase {
	__New() {
		this._setCategoryObj()
		this.file := A_ScriptDir "\res\json\categoryDatabase.json"
		If !FileExist(this.file)
			this._rebuild()
		this.obj := JSON.Load(FileRead(this.file))
	}
	
	_rebuild() {
		progress := new class_progress("Rebuilding category database", A_Space, A_Space)
		this.obj := this._getCategoryDatabase()
		this._writeObj()
		ini_replaceValue(ini, "General", "lastCategoryDatabaseRebuild", A_Now)
		
		progress.Destroy()
		progress := ""
	}
	
	getItemCategory(input) {
		If !IsObject(this.obj) {
			msgbox getItemCategory() empty this.obj`n`nClosing..
			exitapp
		}
		
		for category in this.obj
			loop, % this.obj[category].length()
				If (this.obj[category][A_Index] = input)
					return category
	}
	
	/*
		input = object list with drops
		output = object
		{
			weapons
			{
				weapon drop
			}
		}
	*/
	getDroplistCategories(input) {
		If !IsObject(this.obj) {
			msgbox getDroplistCategories() empty this.obj`n`nClosing..
			exitapp
		}
		output := []
		
		dropList := input.clone()
		
		for category in this.obj
		{
			If !InStr(category, "_slot") {
				categoryObj := this.getDropListCategory(dropList, category)

				If IsObject(categoryObj)
					output[category] := categoryObj
			}
		}
		
		; msgbox % json.dump(output,,2)
		return output
	}
	
	/*
		dropList = object list with drops
		category = category name
		output = c
		{
			item1
			item2
		}
	*/
	getDropListCategory(dropList, category) {
		output := []
		
		loop, % this.obj[category].length() {
			catItem := this.obj[category][A_Index]
			
			loop, % dropList.length() {
				dropListItem := dropList[A_Index]
				
				If (catItem = dropListItem) { ; droplist item is found in category
					output.push(dropListItem) ; add droplist item to output
					dropList.RemoveAt(A_Index) ; and remove droplist item from input
				}
			}
		}

		If (output.length() = 0)
			output := ""
		
		return output
	}
	
	_writeObj() {
		FileDelete, % this.file
		output := JSON.Dump(this.obj,,2)
		FileAppend, % output, % this.file
		return
	}
	
	_getCategoryDatabase() {
		output := []
		output["Weapons"] := []
		output["Armour"] := []
		
		for categoryGroup in this.categoriesObj 
			loop, % this.categoriesObj[categoryGroup].length()
				categoryCount++
		progress.ProgressBarMaxRange(categoryCount)
		
		for categoryGroup in this.categoriesObj 
		{
			loop, % this.categoriesObj[categoryGroup].length()
			{
				category := this.categoriesObj[categoryGroup][A_Index]
				; create category displayname for adding to database
				categoryDisplayname := category
				StringReplace, categoryDisplayname, categoryDisplayname, _items
				
				output[categoryDisplayname] := []
				c := this._getCategory(category)
				
				for item in c["items"]
				{
					output[categoryDisplayname].push(c["items"][item].title)
					
					; create additional categories containing the items of multiple other categories
					If (categoryGroup = "weapons")
						output["Weapons"].push(c["items"][item].title)
						
					If (categoryGroup = "armour")
						output["Armour"].push(c["items"][item].title)
				}
				
				progress.ProgressBar("+1")
				progress.SubText(category)
			}
		}
		return output
	}
	
	
	_getCategory(input) {
		output := JSON.Load(DownloadToString("http://2007.runescape.wikia.com/api/v1/Articles/List?category=" input "&limit=9999"))	
		return output
	}
	
	_setCategoryObj() {
		this.categoriesObj := []
		this.categoriesObj["items"] := []
		this.categoriesObj["skills"] := []
		this.categoriesObj["weapons"] := []
		this.categoriesObj["armour"] := []
		
		this.categoriesObj["items"].push("Runes")
		this.categoriesObj["items"].push("Gems")
		this.categoriesObj["items"].push("Herbs")
		this.categoriesObj["items"].push("Logs")
		this.categoriesObj["items"].push("Ores")
		this.categoriesObj["items"].push("Potions")
		this.categoriesObj["items"].push("Fish")
		
		this.categoriesObj["skills"].push("Construction")
		this.categoriesObj["skills"].push("Farming")
		this.categoriesObj["skills"].push("Firemaking")
		this.categoriesObj["skills"].push("Fishing")
		this.categoriesObj["skills"].push("Hunter")
		this.categoriesObj["skills"].push("Mining")
		this.categoriesObj["skills"].push("Runecrafting")
		this.categoriesObj["skills"].push("Smithing")
		this.categoriesObj["skills"].push("Woodcutting")
		this.categoriesObj["skills"].push("Crafting_items")
		this.categoriesObj["skills"].push("Prayer_items")
		this.categoriesObj["skills"].push("Herblore_items")
		
		this.categoriesObj["weapons"].push("Ammunition_slot_items")
		this.categoriesObj["weapons"].push("Weapon_slot_items")
		
		this.categoriesObj["armour"].push("Head_slot_items")
		this.categoriesObj["armour"].push("Neck_slot_items")
		this.categoriesObj["armour"].push("Body_slot_items")
		this.categoriesObj["armour"].push("Legwear_slot_items")
		this.categoriesObj["armour"].push("Feet_slot_items")
		this.categoriesObj["armour"].push("Cape_slot_items")
		this.categoriesObj["armour"].push("Shield_slot_items")
		this.categoriesObj["armour"].push("Hand_slot_items")
		this.categoriesObj["armour"].push("Ring_slot_items")
		
		; this.listOfCategoryLists=
		; ( Ltrim A_Tab join`,
		; category_items
		; category_skills
		; category_weapons
		; category_armour
		; )
		
		; category_items=
		; ( Ltrim A_Tab join`,
		; Runes
		; Gems
		; Herbs
		; Logs
		; Ores
		; Seeds
		; Potions
		; Fish
		; )
		
		; category_skills=
		; ( Ltrim A_Tab join`,
		; Construction
		; Farming
		; Firemaking
		; Fishing
		; Hunter
		; Mining
		; Runecrafting
		; Smithing
		; Woodcutting
		; Crafting_items
		; Prayer_items
		; Herblore_items
		; )
		
		; category_weapons=
		; ( Ltrim A_Tab join`,
		; Ammunition_slot_items
		; Weapon_slot_items
		; )

		; category_armour=
		; ( Ltrim A_Tab join`,
		; Head_slot_items
		; Neck_slot_items
		; Body_slot_items
		; Legwear_slot_items
		; Feet_slot_items
		; Cape_slot_items
		; Shield_slot_items
		; Hand_slot_items
		; Ring_slot_items
		; )
	}
}