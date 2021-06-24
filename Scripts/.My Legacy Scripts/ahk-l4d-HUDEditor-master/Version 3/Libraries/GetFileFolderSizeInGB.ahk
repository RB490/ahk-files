; https://autohotkey.com/board/topic/67917-get-folder-size/
GetFileFolderSizeInGB(fPath="")
{
	if InStr(FileExist(fPath), "D") 
	{
		Loop, %fPath%\*.*, 1, 1
			FolderSize += %A_LoopFileSize%
		Size := % FolderSize ? FolderSize : 0
		Return, Round(Size/1024**3, 2) . " GB" 
	}
	else if (FileExist(fPath) <> "") 
	{
		FileGetSize, FileSize, %fPath%
		Size := % FileSize ? FileSize : 0
		Return, Round(Size/1024**3, 2) . " GB" 
	} 
	else
		Return, -1
}