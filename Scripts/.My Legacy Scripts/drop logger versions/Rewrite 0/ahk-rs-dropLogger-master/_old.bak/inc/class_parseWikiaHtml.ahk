/*
	Gets information from wikia html strings
	
	Note: wiki links are case sensitive
*/
class class_parseWikiaHtml {
	/*
		Parameters
			input =		wiki page name containing Drop Tables
		
		Returns
			Drop Table object
	*/
	getDropTable(input) {
		output := []
		
		html := DownloadToString("http://oldschoolrunescape.wikia.com/wiki/" input)
		If InStr(html, "not found") {
			msgbox class_parseWikiaHtml.getDropTable(): input (%input%) was not found in html. `n`nClosing..
			exitapp
		}

		tables := class_parseWikiaHtml._getDropTables(html) ; get html tables
		
		progress.SubText("Downloading tables")
		progress.ProgressBar2MaxRange(tables.length())
		progress.SubText2(input)
		
		loop, % tables.length() ; go through each html table
		{
			rows := class_parseWikiaHtml._getDropTableRows(tables[A_Index]) ; get object containing all rows and their column data of the table
			category := class_parseWikiaHtml._getDropTableCategory(tables[A_Index])
			
			; http://oldschoolrunescape.wikia.com/wiki/Barrows
			; barrows equipment is a header which has subheaders which have barrows brothers drop tables under them
			; the tables under subheaders are retrieved so dont add "Barrows Equipment" drop table here
			; as it only contains the first subheader drop table "ahrim's"
			; http://oldschoolrunescape.wikia.com/wiki/Zulrah , http://oldschoolrunescape.wikia.com/wiki/Aberrant_spectre etc.
			; Drops is a 'false positive' header received in all normal drop table pages
			If (rows.length() and !(category = "Barrows Equipment") and !(category = "Drops")) {
				If (input = "Rare_drop_table") {
					loop, % rows.length()
						output.push(rows[A_Index])
				}
				else {
					output[category A_Space "Drop Table"] := []
					loop, % rows.length()
						output[category A_Space "Drop Table"].push(rows[A_Index])
				}
			}
			
			progress.ProgressBar2("+1")
		}
		
		return output
	}
	
	/*
		Parameters
			input = 	wikia html string
		
		Returns
			array with all Drop Tables, except collapsible Drop Tables (eg: Rare Drop Table listed below normal mob Drop Table)
	*/
	_getDropTables(input) {
		output := []
		
		If (StringBetween(input, "<H4><span", "</dl>")) { ; check table type
			obj := class_parseWikiaHtml._getDropTablesTypeH4(input)
			
			for entry in obj
				output.push(obj[entry])
		}
		If (StringBetween(input, "<h3><span", "</dl>")) { ; check table type
			obj := class_parseWikiaHtml._getDropTablesTypeH3(input)
			
			for entry in obj
				output.push(obj[entry])
		}
		If (StringBetween(input, "<h2><span", "</dl>")) { ; check table type
			obj := class_parseWikiaHtml._getDropTablesTypeH2(input)
			
			for entry in obj
				output.push(obj[entry])
		}
		
		If !(output.length()) {
			msgbox %A_ThisFunc%: Did not find any drop tables in input`n`nClosing..
			exitapp
		}

		return output
	}
	
	/*
		Parameters
			input = 	wikia html string containing drop tables starting with <H4><span title and ending with </dl>, an example:
						http://oldschoolrunescape.wikia.com/wiki/Barrows
		
		Returns
			array with all Drop Tables, except collapsible Drop Tables (eg: Rare Drop Table listed below normal mob Drop Table)
	*/
	_getDropTablesTypeH4(input) {
		output := []
		tables := string_countOccurences(input, "<H4><span") ; example: http://oldschoolrunescape.wikia.com/wiki/Abyssal_demon

		loop, % tables
		{
			table := StringBetween(input, "<H4><span", "</table>") ; find table
			StringReplace, input, input, % "<H4><span" table "</table>" ; remove table from input
			
			If (string_countOccurences(table, "<H4><span")) { ; if multiple category titles were 'selected' take the last one 
				table := SubStr(table, InStr(table, "<H4><span" , false, 0)) ; instr right to left
				StringReplace, table, table, % "<H4><span"
			}
			
			If !InStr(table, "mw-collapsible") ; don't add table to output if table is collapsible (rare drop table)
				If (table)
					output.push(table) ; add table to output
		}

		return output
	}
	
	/*
		Parameters
			input = 	wikia html string containing drop tables starting with <h3><span title and ending with </dl>, an example:
						http://oldschoolrunescape.wikia.com/wiki/Abyssal_demon
		
		Returns
			array with all Drop Tables, except collapsible Drop Tables (eg: Rare Drop Table listed below normal mob Drop Table)
	*/
	_getDropTablesTypeH3(input) {
		output := []
		tables := string_countOccurences(input, "<h3><span") ; example: http://oldschoolrunescape.wikia.com/wiki/Abyssal_demon
		loop, % tables
		{
			table := StringBetween(input, "<h3><span", "</table>") ; find table
			StringReplace, input, input, % "<h3><span" table "</table>" ; remove table from input
			
			If (string_countOccurences(table, "<h3><span")) { ; if multiple category titles were 'selected' take the last one 
				table := SubStr(table, InStr(table, "<h3><span" , false, 0)) ; instr right to left
				StringReplace, table, table, % "<h3><span"
			}
			
			If !InStr(table, "mw-collapsible") ; don't add table to output if table is collapsible (rare drop table)
				If (table)
					output.push(table) ; add table to output
		}
		return output
	}
	
	/*
		Parameters
			input = 	wikia html string containing drop tables starting with <H2><span title and ending with </dl>, an example:
						http://oldschoolrunescape.wikia.com/wiki/Young_impling
		
		Returns
			array with all Drop Tables, except collapsible Drop Tables (eg: Rare Drop Table listed below normal mob Drop Table)
	*/
	_getDropTablesTypeH2(input) {
		output := []
		tables := string_countOccurences(input, "<H2><span")

		loop, % tables
		{
			table := StringBetween(input, "<H2><span", "</table>") ; find table
			StringReplace, input, input, % "<H2><span" table "</table>" ; remove table from input
			
			If (string_countOccurences(table, "<h2><span")) { ; if multiple category titles were 'selected' take the last one 
				table := SubStr(table, InStr(table, "<h2><span" , false, 0)) ; instr right to left
				StringReplace, table, table, % "<h2><span"
			}
			
			If !InStr(table, "mw-collapsible") ; don't add table to output if table is collapsible (rare drop table)
				If (table)
					output.push(table) ; add table to output
		}

		return output
	}
	
	/*
		Parameters
			input = 	wikia html Drop Table table
		
		Returns
			object with layout:
				{
					Img:
					Title:
					Quantity:
					Drop Rate:
				}
	*/
	_getDropTableRows(input) {
		output := []
		
		searchKey_wikitable = "wikitable"
		searchKey_wikitableSortableDropstable = <table class="wikitable sortable dropstable"
		
		If InStr(input, searchKey_wikitable)
			output := class_parseWikiaHtml._getDropTableRowsTypeWikitable(input)
		else if InStr(input, searchKey_wikitableSortableDropstable)
			output := class_parseWikiaHtml._getDropTableRowsTypeWikitableSortableDropstable(input)
		
		return output
	}
	
	/*
		Parameters
			input = 	wikia html Drop Table table type <table class="wikitable sortable dropstable"
		
		Returns
			object with layout:
				{
					Img:
					Title:
					Quantity:
					Drop Rate:
				}
	*/
	_getDropTableRowsTypeWikitableSortableDropstable(input) {
		output := []
		
		loop, parse, input, `n ; loop table html
		{
			If InStr(A_LoopField, "<tr style=") or InStr(A_LoopField, "</dd>") { ; start of new row or end of table (</dd>)
				If (img) { ; if row information was collected
					output.push({"Img": img, "Title": title, "Quantity": quantity, "Drop Rate": dropRate, "Noted": noted}) ; add row var to output
				}
				newRow := 1
				img := "", title := "", quantity := "", dropRate := "", noted := ""
			} else If (newRow) { ; add lines to row var
				If !InStr(A_LoopField, "</td></tr>")
				{
					If InStr(A_LoopField, "img src=") { ; get image url
						If InStr(A_LoopField, "gif")
							img := SubStr(A_LoopField, InStr(A_LoopField, "img src=",,,2) + 9)
						else
							img := SubStr(A_LoopField, InStr(A_LoopField, "img src=") + 9)
						img := SubStr(img, 1, InStr(img, "/revision") - 1)
					}
					
					If InStr(A_LoopField, "text-align:left") { ; get title
						title := SubStr(A_LoopField, InStr(A_LoopField, "title=") + 7)
						title := SubStr(title, 1, InStr(title, """") - 1)
					}
					
					If InStr(A_LoopField, "</td><td>") and !(quantity) { ; get quantity
						quantity := A_LoopField
						
						noted := 0
						If InStr(quantity, "(noted)") {
							StringReplace, quantity, quantity, % A_Space "(noted)", , All
							noted := 1
						}
						
						StringReplace, quantity, quantity, % "</td><td>" A_Space, , All
						StringReplace, quantity, quantity, `,, , All ; remove commas eg: 1,000 flax
						
						If InStr(quantity, A_Space) ; remove junk behind the quantity integer
							quantity := SubStr(quantity, 1, InStr(quantity, A_Space))
					}
					
					If InStr(A_LoopField, "data-sort-value") { ; get drop rate
						dropRate := SubStr(A_LoopField, InStr(A_LoopField, "> ") + 2)
						
						If InStr(dropRate, " <")
							dropRate := SubStr(dropRate, 1, InStr(dropRate, " <") - 1)
						
						StringReplace, dropRate, dropRate, <small>
						StringReplace, dropRate, dropRate, </small>
						
						If InStr(dropRate, "[")
							dropRate := Trim(SubStr(dropRate, 1, InStr(dropRate, "[") - 1)) ; remove wiki "[X]" references where x is a digit
					}
				}
			}
			
		}
		If (img)
			output.push({"Img": img, "Title": title, "Quantity": quantity, "Drop Rate": dropRate, "Noted": noted}) ; add last entry
		return output
	}
	
	/*
		Parameters
			input = 	wikia html Drop Table table type "wikitable"
		
		Returns
			object with layout:
				{
					Img:
					Title:
					Quantity:
					Drop Rate:
				}
	*/
	_getDropTableRowsTypeWikitable(input) {
		output := []
		
		loop, parse, input, `n ; loop table html
		{
			If InStr(A_LoopField, "<tr") or InStr(A_LoopField, "</dd>") { ; start of new row or end of table (</dd>)
				If (img) { ; if row information was collected
					output.push({"Img": img, "Title": title, "Quantity": 1, "Drop Rate": "", "Noted": 0}) ; add row var to output
				}
				newRow := 1
				img := "", title := "", quantity := "", dropRate := "", noted := ""
			} else If (newRow) { ; add lines to row var
				If !InStr(A_LoopField, "</td></tr>")
				{
					If InStr(A_LoopField, "img src=") { ; get image url
						If InStr(A_LoopField, "gif")
							img := SubStr(A_LoopField, InStr(A_LoopField, "img src=",,,2) + 9)
						else
							img := SubStr(A_LoopField, InStr(A_LoopField, "img src=") + 9)
						img := SubStr(img, 1, InStr(img, "/revision") - 1)
					}
					
					If InStr(A_LoopField, "title=") { ; get title
						title := SubStr(A_LoopField, InStr(A_LoopField, "title=") + 7)
						title := SubStr(title, 1, InStr(title, """") - 1)
					}
				}
			}
		}
		If (img)
			output.push({"Img": img, "Title": title, "Quantity": 1, "Drop Rate": "", "Noted": 0}) ; add last entry
		return output
	}
	
	/*
		Parameters
			input = 	wikia html Drop Table table
		
		Returns
			category
	*/
	_getDropTableCategory(input) {
		output := StringBetween(input, """>")
		output := StringBetween(output, "", "</span>")
		
		; remove html junk
		If InStr(output, "amp;")
			StringReplace, output, output, amp;
		
		return output
	}
}