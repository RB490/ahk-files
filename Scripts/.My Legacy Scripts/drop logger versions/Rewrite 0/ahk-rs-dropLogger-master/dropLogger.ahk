#SingleInstance, force


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

; doc := ComObjCreate("HTMLfile")
; doc.write(html)
; oSample := doc.getElementById("sample")
; msgbox % oSample.innerHTML 







; // download the webpage source
; URLDownloadToFile, http://oldschoolrunescape.wikia.com/wiki/Vorkath, Google_HTML
; FileRead, html, Google_HTML

; // write the Google Source to an HTMLfile
; document :=	ComObjCreate("HTMLfile")
; document.write(html)

; msgbox % document.links.length

mobDb := new class_mobDb
mobDb.add("Vorkath")
msgbox end of script
return

~^s::reload

#Include <json>
#Include %A_ScriptDir%\inc
#Include class_mobDb.ahk
