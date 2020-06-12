class class_dropTable {
    Download(input) { ; input = context sensitive wiki page containing drop tables
        If !(g_debug)
            SplashTextOn, 200, 70, % A_ScriptName, Retrieving drop table..
        this.obj := wiki.Get(input)

        for category, v in this.obj
            categories++

        this.DownloadImages()

        SplashTextOff
        return categories
    }

    GetDrops() {
        output := {}
        for category, v in this.obj {
            loop % this.obj[category].length() {
                output.push(this.obj[category][A_Index].itemName)
            }
        }
        return output
    }

    DownloadImages() {
        loop % this.obj.length() {
            obj := this.obj[A_Index].tableDrops
            loop % obj.length() {
                html := obj[A_Index].itemImage
                
                html := SubStr(html, InStr(html, "src=") + 5)
                html := SubStr(html, 1, InStr(html, ".png") + 3)
                
                itemPath := g_itemsPath "\" obj[A_Index].itemName ".png"

                ; get image wiki high detail url
                item := StrReplace(obj[A_Index].itemName, A_Space, "_")
                detailHtml := DownloadToString("https://oldschool.runescape.wiki/w/" item "#/media/File: " item "_detail.png")

                If (item = "Fire_battlestaff") {
                    clipboard := detailHtml
                    msgbox % detailHtml
                }


                loop, parse, detailHtml, `n
                {
                    If (InStr(A_LoopField, "_detail.png")) {
                        detailHtml := A_LoopField
                        break
                    }
                }
                ; msgbox % detailHtml
                detailHtml := SubStr(detailHtml, InStr(detailHtml, "https://"))
                detailHtml := SubStr(detailHtml, 1, InStr(detailHtml, ".png") + 3)


                If !(FileExist(itemPath)) {
                    ; DownloadToFile("https://oldschool.runescape.wiki" html, itemPath)
                    ; tooltip % "Downloaded: https://oldschool.runescape.wiki" detailHtml " to.. " itemPath
                    
                    DownloadToFile(detailHtml, itemPath)
                    tooltip % "Downloaded: " detailHtml " to.. " itemPath
                }

                ; DOWNLOAD EVERY IMAGE WITH THE SAME AMOUNT OF PX?
                    ; https://oldschool.runescape.wiki/images/thumb/f/f7/Lobster_detail.png/100px-Lobster_detail.png?17424
            }
        }
    }
}