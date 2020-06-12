/*
    1
        keep the same droptable order as the wiki

    2
        write dropTable method that returns object with categories under x amount of items combined

        but only combine categories when the total amount of items is above x amount (too large to display in one tab nicely)

        ALWAYS create a specific category for 'rare / special' drop tables and ignore them while counting total drops to decide whether to create
            separate categories
*/


class class_gui_drop extends gui {
    Setup() {
        ; events

        ; properties
        this.SetDefault() ; set as default for GuiControl
        marginSize := 10

        ; controls
        this.Add("tab3",, "")
        this._LoadDrops()

        DetectHiddenWindows, On ; for ControlGetPos
        ControlGetPos , tabX, tabY, tabW, tabH, SysTabControl321, % this.ahkid
        var = tabX = %tabX% %A_Tab% tabY = %tabY% %A_Tab% tabW = %tabW% %A_Tab% tabH = %tabH%
        this.Add("edit", "w" tabW, var)

        this.Add("edit", "x" tabW + marginSize " y" marginSize, "test")

        ; show
        this.Show()
        ; this.Show("w450 h250")
    }

    _LoadDrops() {
        this.Margin(0, 0)
        dropSize := 27
        maxRowDrops := 10 ; after this amount of drops a new row is started

        obj := dropTable.Obj

        loop % obj.length() {
            tab := obj[A_Index].tableTitle
            drops := obj[A_Index].tableDrops

            ; add tab
            GuiControl,, SysTabControl321, % tab
            this.Tab(tab) ; Future controls are owned by the tab whose name starts with Name (not case sensitive).

            ; add drops
            rowDrops := 0
            loop % drops.length() {
                If (rowDrops = maxRowDrops)
                    rowDrops := 0
                
                If (A_Index = 1)
                    this.Add("picture", "x+0 section w" dropSize " h" dropSize " border", g_itemsPath "\" drops[A_Index].itemName ".png") ; first drop
                else if !(rowDrops)
                    this.Add("picture", "xs ys+" dropSize " section w" dropSize " h" dropSize " border", g_itemsPath "\" drops[A_Index].itemName ".png") ; first drop of a new row
                else
                    this.Add("picture", "xp+" dropSize "  w" dropSize " h" dropSize " border", g_itemsPath "\" drops[A_Index].itemName ".png") ; add normal drop

                rowDrops++
            }
        }

        this.Tab("") ; Future controls are not part of any tab control.
        this.Margin(marginSize, marginSize) ; restore margin size
    }
}

