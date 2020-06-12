ThousandsSep(x, s=",") {
	return RegExReplace(x, "\G\d+?(?=(\d{3})+(?:\D|$))", "$0" s)
}