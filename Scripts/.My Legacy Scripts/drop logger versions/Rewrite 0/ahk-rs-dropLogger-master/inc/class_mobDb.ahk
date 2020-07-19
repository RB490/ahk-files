/*
enabling getElementsByClassName
	https://autohotkey.com/boards/viewtopic.php?f=5&t=31907
	https://autohotkey.com/boards/viewtopic.php?t=32059
*/

class class_mobDb {
	__New() {
	}
	
	save() {
	}
	
	add(input) {
		; msgbox % A_ThisFunc " input = " input

		this.document := ComObjCreate("HTMLfile")
		this.document.silent := true
		
		; vHtml = <meta http-equiv="X-UA-Compatible" content="IE=edge">
		; this.document.write(vHtml)
		
		this.document.write(DownloadToString("http://oldschoolrunescape.wikia.com/wiki/" input))
		
		
		; this.document.getElementsByClassName("wikitable sortable dropstable")
		; this.document.getElementsByClassName("wikitable sortable dropstable")
		; msgbox % this.document.getElementsByName("drop table").length
		; msgbox % this.document.getElementsByTagName("*").length
		
		; msgbox % this.document.documentMode
		; msgbox % InStr(this.document, "wikitable sortable dropstable")
		; clipboard := DownloadToString("http://oldschoolrunescape.wikia.com/wiki/" input)
		msgbox clipboard
	}
}