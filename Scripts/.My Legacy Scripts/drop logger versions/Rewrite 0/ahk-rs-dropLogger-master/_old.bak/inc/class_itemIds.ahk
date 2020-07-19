/*
	Create and read item id json file into object
	Get information from object
*/
class class_itemIds {
	__New() {
		this.file := A_ScriptDir "\res\json\itemIds.json"
		If !FileExist(this.file)
			this.rebuild()
		this.obj := JSON.Load(FileRead(this.file))
	}
	
	/*
		Deletes and writes database file + obj
	*/
	rebuild() {
		rebuildProgress := new class_progress("Updating item database")
		this._writeJson()
		progressBox()
		ini_replaceValue(ini, "General", "lastItemDatabaseUpdate", A_Now)
		rebuildProgress.Destroy()
		rebuildProgress := ""
	}
	
	_writeJson() {
		FileDelete, % this.file
		FileAppend, % DownloadToJson("https://rsbuddy.com/exchange/summary.json"), % this.file
		return
	}
	
	/*
	Parameters
		item = 				'clean' item name eg: Pure Essence instead of Pure Essence (noted)
		quantity (opt) = 	item quantity
		
	Returns
		price of input
	*/
	getPrice(item, quantity = "") {
		If !(quantity)
			quantity := 1
		
		; get price
		If (item = "Coins")
			price := 1
		else {
			for k in this.obj
				If (this.obj[k]["name"] = item)
					price := this.obj[k]["sell_average"]
		}
				
		If !(price) {
			; msgbox %A_ThisFunc%: Could not retrieve price for: %item%
			price := 0
		}
				
		return quantity * price
	}
}