; https://oldschool.runescape.wiki/w/Drop_table
class class_database_specials {
    __New() {
        this.Update() ; ensure file_database_specials is available
        
        ; read file_database_specials into object
        FileRead, Input, % file_database_specials
        If (Input) and !(Input = "{}") and !(Input = """" """") ; double quotes
            this.obj := json.load(Input)
        else {
            msgbox %A_ThisFunc%()`n`nFailed to load critical file 'file_database_specials': '%file_database_specials%'
            exitapp   
        }
    }

    /* 
    isTableSpecial()

    example input:
        [
            {
                "itemHighAlch": "192",
                "itemImage": "todo: parse innerHtml to get image wiki link",
                "itemName": "Superior dragon bones",
                "itemPrice": "23,638",
                "itemQuantity": "2",
                "itemRarity": "Always"
            },
            {
                "itemHighAlch": "168",
                "itemImage": "todo: parse innerHtml to get image wiki link",
                "itemName": "Blue dragonhide",
                "itemPrice": "3,616",
                "itemQuantity": "2",
                "itemRarity": "Always"
            }
        ]
    */
    isTableSpecial(input) {
        needleObj := input.Clone()
        ; haystackObj := 
        ; loop % this.obj.length()

        ; msgbox % json.dump(input,,2)
        ; If (input[1].itemName = "Nothing")
        ;     msgbox % json.dump(needleObj,,2)

        For specialTable in this.obj ; check each special table
        {
            matches := 0
            loop % this.obj[specialTable].length() { ; each drop of this special table
                specialDrop := this.obj[specialTable][A_Index]
                
                ; check if specialDrop is in input
                loop % needleObj.length() {
                    needleDrop := needleObj[A_Index]

                    If (needleDrop.itemName = specialDrop.itemName) and,
                    (needleDrop.itemHighAlch = specialDrop.itemHighAlch) and,
                    (needleDrop.itemQuantity = specialDrop.itemQuantity)
                        matches++
                }
            }
            msgbox % matches
        }

        ; msgbox % this.obj.length()


        ; input = object containing a drop table
        ; checks whether drop table is one of the drop tables inside file_database_specials
    }

    /*
    Update()
        retrieves the special drop tables
        checks if wiki special drop tables page has changed
            yes > the script throws a warning and closes
            no > write special drop table file using hardcoded code
    */
    Update() {
        source := getUrlComObj("https://oldschool.runescape.wiki/w/Drop_table")

        ; check if wiki droplog page changed
        headlines := source.getElementsByClassName("mw-headline")
        loop % headlines.length - 1
            headlinesMatchlist .= headlines[A_Index].textContent ","
        headlinesMatchlist := RTrim(headlinesMatchlist, ",")

        ; update this matchlist after updating this script for new wiki changes. current: 2020.05.15
        savedHeadlinesMatchlist := "Common seed drop table,Fixed allotment seed drop table,Rare seed drop table
        ,Tree-herb seed drop table,Variable allotment seed drop table,Hops drop table,Herb tables,Herb drop table
        ,Useful herb drop table,Rare drop table,Runes and ammunition,Weapons and armour,Other,Subtables,Gem drop table
        ,Mega-rare drop table,Miscellaneous tables,Fossil drop table,Superior drop table,Talisman drop table"

        loop, parse, headlinesMatchlist, `,
        {
            If !(InStr(savedHeadlinesMatchlist, A_LoopField)) {
                msgbox,
                ( LTrim `t
                    %A_ThisFunc%()
                    
                    mw-headline headers on 'https://oldschool.runescape.wiki/w/Drop_table' have changed

                    Update updateSpecialDropTablesFiles() in %A_ScriptDir%\inc\functions.ahk and rebuild 'savedHeadlinesMatchlist'

                    Closing..
                )
                exitapp
            }
        }

        ; check if file exists
        If (FileExist(file_database_specials))
            return

        ; retrieve drop tables
        output := {}
        tables := source.getElementsByClassName("wikitable sortable filterable item-drops autosort=4,a")
        loop % tables.length {
            rows := tables[A_Index-1].rows
            tableIndex := A_Index

            If (tableIndex = 1)
                output["Common seed drop table"] := {}
            If (tableIndex = 2)
                output["Fixed allotment seed drop table"] := {}
            If (tableIndex = 3)
                output["Rare seed drop table"] := {}
            If (tableIndex = 4)
                output["Tree-herb seed drop table"] := {}
            If (tableIndex = 5)
                output["Variable allotment seed drop table"] := {}
            If (tableIndex = 6)
                output["Hops drop table"] := {}
            If (tableIndex = 7)
                output["Herb drop table"] := {}
            If (tableIndex = 8)
                output["Useful herb drop table"] := {}
            If (tableIndex = 9)
                output["Rare drop table"] := {}
            If (tableIndex = 13)
                output["Gem drop table"] := {}
            If (tableIndex = 14)
                output["Mega-rare drop table"] := {}
            If (tableIndex = 15)
                output["Fossil drop table"] := {}
            If (tableIndex = 16)
                output["Superior drop table"] := {}
            If (tableIndex = 17)
                output["Talisman drop table"] := {}

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

                If (tableIndex = 1)
                    output["Common seed drop table"].push(itemProperties)
                If (tableIndex = 2)
                    output["Fixed allotment seed drop table"].push(itemProperties)
                If (tableIndex = 3)
                    output["Rare seed drop table"].push(itemProperties)
                If (tableIndex = 4)
                    output["Tree-herb seed drop table"].push(itemProperties)
                If (tableIndex = 5)
                    output["Variable allotment seed drop table"].push(itemProperties)
                If (tableIndex = 6)
                    output["Hops drop table"].push(itemProperties)
                If (tableIndex = 7)
                    output["Herb drop table"].push(itemProperties)
                If (tableIndex = 8)
                    output["Useful herb drop table"].push(itemProperties)
                If (tableIndex = 9) or (tableIndex = 10) or (tableIndex = 11) or (tableIndex = 12)
                    output["Rare drop table"].push(itemProperties)
                If (tableIndex = 13)
                    output["Gem drop table"].push(itemProperties)
                If (tableIndex = 14)
                    output["Mega-rare drop table"].push(itemProperties)
                If (tableIndex = 15)
                    output["Fossil drop table"].push(itemProperties)
                If (tableIndex = 16)
                    output["Superior drop table"].push(itemProperties)
                If (tableIndex = 17)
                    output["Talisman drop table"].push(itemProperties)
            }
        }
        FileAppend, % json.dump(output,,2), % file_database_specials
    }
}