GetHigherDir(LevelUp=0,CustomPath="") {
	if CustomPath = 
	CustomPath := A_ScriptDir
	StringSplit, d, CustomPath, \
	Num := d0 - LevelUp
	Loop, %Num%
	ToReturn := (ToReturn) ? ToReturn "\" d%A_Index% : d%A_Index%
	Return ToReturn
}