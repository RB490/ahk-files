/*

    todo:
        drop tables
            what: detect different kinds of drop tables on mob wiki pages https://oldschool.runescape.wiki/w/Drop_table
                and instead of saving every instance of the rare drop table to every mob
                separately save these special drop tables and
                register whether which ones a mob has access to. for instance 'gem drop table' and the rdt
            how: first properly store every kind of special drop table and before adding an individual mobs individual wiki drop table
                check if its not one of the stored special drop tables. compare item name & quantity & probably also rarity
                    possible issues: vorkath page rdt has "nothing" drop on it but on the official drop table page it doesnt
                        either manually add 'nothing' option or only check if every mobs drop is in the specific drop table not other way around

    info:
        ie COM: https://autohotkey.com/board/topic/64563-basic-ahk-v11-com-tutorial-for-webpages/

*/

; misc
    #SingleInstance, force
    FileCreateDir, % A_ScriptDir "\database" ; create database folder incase it doesn't exit so FileAppend can write files there

; global variables
    global file_database_specials := A_ScriptDir "\database\file_database_specials.json"
    global file_database_mobs := A_ScriptDir "\database\file_database_mobs.json"

    global dbSpecials := new class_database_specials  ; handles special drop tables
    global dbMobs := new class_database_mobs     ; handles mobs; their droptables and other information

; auto execute
    dbMobs.add("Vorkath")
return

doc := getUrlComObj("https://oldschool.runescape.wiki/w/Vorkath")

tables := doc.getElementsByClassName("wikitable sortable filterable item-drops autosort=4,a")
output := {}

loop % tables.length {
    rows := tables[A_Index-1].rows

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
        output.push(itemProperties)
    }
}
; clipboard := json.dump(output,,2)
; msgbox % json.dump(output,,2)
msgbox % output.length()

msgbox hi

~^s::reload

#Include <JSON>
#Include %A_ScriptDir%\inc
#Include class database mobs.ahk
#Include class database specials.ahk
#Include functions.ahk