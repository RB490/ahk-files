; retrieves drop tables from https://oldschool.runescape.wiki/
class class_wiki {
    Get(input) { ; input = context sensitive wiki page containing drop tables
        this.html := DownloadToString("https://oldschool.runescape.wiki/w/" input)     ; get webpage source
        this.doc := ComObjCreate("HTMLfile")     ; open ie com object document
        vHtml = <meta http-equiv="X-UA-Compatible" content="IE=edge">
        this.doc.write(vHtml)                    ; enable getElementsByClassName https://autohotkey.com/boards/viewtopic.php?f=5&t=31907
        this.doc.write(this.html)                ; add webpage source

        this.tables := this.doc.getElementsByTagName("table") ; retrieve all tables

        output := {}
        loop, % this.tables.length {
            table := this.tables[A_Index-1]
            
            ; check if table is a drop table
            If !(table.rows[0].cells.length = 6) ; table's first row cell count
                continue

            title := this._GetTableTitle(A_Index-1) ; get drop table title
            table := this._GetTable(A_Index-1) ; get drop table

            entry := {}
            entry.tableTitle := title
            entry.tableDrops := table
            output.push(entry)
        }
        return output
    }

    ; returns drop table object. tableNumber should be in com format aka the arrays start at 0
    _GetTable(tableNumber) {
        table := this.tables[tableNumber]

        output := {}
        loop % table.rows.length {
            row := table.rows[A_Index-1]
            If (A_Index = 1) ; skip 'header row' containing item, quantity, rarity etc.
                continue

            item := {}
            loop % row.cells.length {
                cell := row.cells[A_Index-1]
                
                If (A_Index = 1)
                    item.itemImage := cell.innerHtml
                If (A_Index = 2)
                    item.itemName := cell.innerText
                If (A_Index = 3)
                    item.itemQuantity := cell.innerText
                If (A_Index = 4)
                    item.itemRarity := cell.innerText
                If (A_Index = 5)
                    item.itemPrice := cell.innerText
                If (A_Index = 6)
                    item.itemHighAlch := cell.innerText
            }
            output.push(item)
       }
       return output
    }

    ; returns drop table title string. tableNumber should be in com format aka the arrays start at 0
    _GetTableTitle(tableNumber) {
        table := this.tables[tableNumber]
        
        ; retrieve drop table's first item image wiki 'url key' eg. '/images/f/fe/Larran%27s_key_1.png?c6772'
        img := table.rows[1].cells[0].innerHtml
        img := SubStr(img, InStr(img, "src=") + 5)
        img := SubStr(img, 1, InStr(img, """") - 1) ; src=" end quote
        
        ; get html with drop tables title in it
        html := SubStr(this.html, 1, InStr(this.html, img)) ; cut off everything beyond '<item name>.png'
        html := SubStr(html, InStr(html, "mw-headline", false, 0) - 27) ; get latest mw-header searching from the end of the string -- 17 is exact

        ; use com to retrieve mw-headeline text
        doc := ComObjCreate("HTMLfile")     ; open ie com object document
        vHtml = <meta http-equiv="X-UA-Compatible" content="IE=edge">
        doc.write(vHtml)                    ; enable getElementsByClassName https://autohotkey.com/boards/viewtopic.php?f=5&t=31907
        doc.write(html)                     ; add webpage source
        return doc.getElementsByClassName("mw-headline")[0].innerText
    }

    ; returns drop table title string. tableNumber should be in com format aka the arrays start at 0
    _GetTableTitle_Rewrite(tableNumber) {
        table := this.tables[tableNumber]

        ; remove all tables infront of the correct one
        msgbox % tableNumber
        clipboard := SubStr(this.html, 1, InStr(this.html, "</table>", false, 1, tableNumber))
        msgbox % SubStr(this.html, 1, InStr(this.html, "</table>", false, 1, tableNumber))
    }
}