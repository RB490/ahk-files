class ClassGuiAbout extends gui {
    Get() {
        If this.IsCreated {
            this.Show()
            return
        }
        
        ; set icon
        this.SetIcon(APP_ICON)
        
        this.Font("s13")
        this.Add("text", , "Github")
        this.Font("")

        url := PROJECT_WEBSITE
        html = <a id="A">%url%</a>
        this.Add("link", , html, this.BtnLink.Bind(this))

        this.Font("s13")
        this.Add("text", , "Info")
        this.Font("")

        dependencyMsg=
        ( LTrim
        Visual Studio Code Workspace recommended
        )
        this.Add("text", , dependencyMsg)

        url := "https://code.visualstudio.com"
        html = <a id="A">%url%</a>
        this.Add("link", , html, this.BtnLink.Bind(this))

        this.Show()
    }

    BtnLink() {
        html := this.GuiControlGet("FocusV")
        needleA1 = <a id="A">
        needleA2 = </a>
        html := StrReplace(html, needleA1)
        html := StrReplace(html, needleA2)
        run % html
    }
}