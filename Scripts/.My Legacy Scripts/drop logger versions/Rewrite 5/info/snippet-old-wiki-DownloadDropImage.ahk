DownloadDropImage(title, url = "", overwrite = "") {
	If !(overwrite) and FileExist(A_ScriptDir "\res\img\items\" title ".png")
		return
	
	If (title = "no drop") {
		FileCopy, % A_ScriptDir "\res\img\no drop.png", % A_ScriptDir "\res\img\items\no drop.png"
		return
	}

	If !(url)
		url := getWikiImgUrl(title)

	StringReplace, title, title, /, @, All ; filename cant contain slashes

	DownloadToFile(url "/revision/latest/fixed-aspect-ratio-down/width/38/height/38?fill=transparent", A_ScriptDir "\res\img\items\" title ".png")
}

getWikiImgUrl(input) {
	StringReplace, input, input, % A_Space, _, All

	; get image name. not always identical to article name eg: http://2007.runescape.wikia.com/wiki/Afflicted. image used is afflicted_woman.png
	img := DownloadToString("http://2007.runescape.wikia.com/wiki/" input)

	img := SubStr(img, InStr(img, "</caption>"))
	img := SubStr(img, 1, InStr(img, "</td></tr>"))

	StringReplace, img, img, img src=,img src=, UseErrorLevel ; find last image occurence to download for example: Willow_seed_5.png instead of Willow_seed_1.png
	lastImgSrcOccurence := ErrorLevel
	img := SubStr(img, InStr(img, "img src=", , , lastImgSrcOccurence))
	img := StringBetween(img, """", """")
	img := SubStr(img, 1, InStr(img, "/revision") -1 )


	return img
}