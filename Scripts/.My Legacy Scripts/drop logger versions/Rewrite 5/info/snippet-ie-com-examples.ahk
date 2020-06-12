html =
(
<html>
<head>
</head>
<body>
<p id="sample">some text</p>
</body>
</html>
) 
html := DownloadToString("https://oldschool.runescape.wiki/w/Vorkath")

doc := ComObjCreate("HTMLfile")     ; open ie com object document
vHtml = <meta http-equiv="X-UA-Compatible" content="IE=edge">
doc.write(vHtml)                    ; enable getElementsByClassName https://autohotkey.com/boards/viewtopic.php?f=5&t=31907
doc.write(html)                     ; add webpage source


; oSample := doc.getElementById("sample")
; msgbox % doc.All.Tags.length
; msgbox % doc.getElementsByClassName("mw-headline").length
; msgbox % doc.getElementsByClassName("wikitable sortable filterable item-drops autosort=4,a").length
; msgbox % this.document.getElementsByName("drop table").length
; msgbox % this.document.getElementsByTagName("*").length
; msgbox % oSample.innerHTML 





----------------------------------------------------------------------------------------------------------

input := "https://oldschool.runescape.wiki/w/Fire_giant"
html := DownloadToString(input)     ; get webpage source

tablepos := InStr(html, "<table")


; tablePos := InStr(html, "wikitable sortable filterable item-drops autosort=4,a")
; msgbox % InStr(html, "mw-headline", false, tablePos)



; html := clipboard
; msgbox % input

; html =
; (
; <html>
; <head>
; </head>
; <body>
; <p id="sample">some text</p>
; </body>
; </html>
; ) 

doc := ComObjCreate("HTMLfile")     ; open ie com object document
vHtml = <meta http-equiv="X-UA-Compatible" content="IE=edge">
doc.write(vHtml)                    ; enable getElementsByClassName https://autohotkey.com/boards/viewtopic.php?f=5&t=31907
doc.write(html)                     ; add webpage source

; tables := doc.getElementsByTagName("table")
; loop % tables.length
;     msgbox % tables[A_Index-1].rows[0].cells.length
; msgbox % doc.getElementsByTagName("table").length
; msgbox % IsObject(doc)
; msgbox % doc.getElementById("sample")
; msgbox % doc.getElementsByTagName("*").length
; msgbox % doc.getElementsByClassName("wikitable sortable filterable item-drops autosort=4,a").length


; title := doc.getElementsByClassName("mw-headline")
; msgbox % title[0].innerText

; table := doc.getElementsByClassName("wikitable sortable filterable item-drops autosort=4,a")
; msgbox % table[0].rows[0].cells.length

msgbox end of script