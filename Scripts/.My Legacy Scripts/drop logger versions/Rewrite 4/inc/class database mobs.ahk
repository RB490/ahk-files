class class_database_mobs {
    __New() {
        ; check file_database_mobs and load if valid json is available
        FileRead, Input, % file_database_mobs
        If (Input) and !(Input = "{}") and !(Input = """" """") ; double quotes
            this.obj := json.load(Input)
        else
            this.obj := {}
    }

    ; input = wiki page case sentitive correct mob name containing drop tables. good: 'Vorkath' bad: 'vOrKaTH'
    ; purpose = checks if mob is already in the database and adds it if necessary
    add(input) {
        doc := getUrlComObj("https://oldschool.runescape.wiki/w/" input)
        
        ; check if input has a valid wiki link attached to it - wiki links are case sentitive
        
        ; check if mob is already added

        ; add mob

        tables := doc.getElementsByClassName("wikitable sortable filterable item-drops autosort=4,a")
        output := {}

        loop % tables.length {
            rows := tables[A_Index-1].rows

            table := {}
            loop % rows.length {
                cells := rows[A_Index-1].cells
                If (A_Index = 1) ; skip table 'header' aka item, quantity, rarity, price
                    Continue

                itemProperties := {}
                loop % cells.length { ; item image | item name | quantity | rarity | price | high alch value
                    cellTextContent := cells[A_Index-1].textContent ; textContent, innerHtml, innerText
                    
                    If (A_Index = 1)
                        itemProperties.itemImage := "todo: parse innerHtml to get image wiki link"
                    If (A_Index = 2)
                        itemProperties.itemName := cellTextContent
                    If (A_Index = 3)
                        itemProperties.itemQuantity := cellTextContent
                    If (A_Index = 4)
                        itemProperties.itemRarity := cellTextContent
                    If (A_Index = 5)
                        itemProperties.itemPrice := cellTextContent
                    If (A_Index = 6)
                        itemProperties.itemHighAlch := cellTextContent
                }
                table.push(itemProperties)
            }

            dbSpecials.isTableSpecial(table)
            ; msgbox hi there
            ; msgbox % json.dump(table,,2)

            ; todo : check if current table is a special drop table. add a keyvalue entry rather than the drop table if so and add to output if not
        }
        ; clipboard := json.dump(output,,2)
        ; msgbox % json.dump(output,,2)
        ; msgbox % output.length()
    }
}