; https://autohotkey.com/boards/viewtopic.php?p=398#p398

/*
enabling getElementsByClassName
	https://autohotkey.com/boards/viewtopic.php?f=5&t=31907
	https://autohotkey.com/boards/viewtopic.php?t=32059
	
		this.document := ComObjCreate("HTMLfile")
		vHtml = <meta http-equiv="X-UA-Compatible" content="IE=9"> ; version 9 supports getElementsByClassName and IE=edge gives warning dialog
		this.document.write(vHtml)
*/

#SingleInstance, force

;// download the webpage source
URLDownloadToFile, http://oldschoolrunescape.wikia.com/wiki/Vorkath, Google_HTML
FileRead, html, Google_HTML
FileDelete, Google_HTML

;// write the Google Source to an HTMLfile
document :=	ComObjCreate("HTMLfile")
document.write(html)

;// loop through all the links
links :=	document.links
while	(A_Index<=links.length, i:=A_Index-1)
	list .=	i ") " links[i].innerText "`nURL: " links[i].href "`n`n"

;// some URLs have "about:" rather than the domain
StringReplace, list, list, about:, http://www.google.com, All

MsgBox, %list%

~^s::reload