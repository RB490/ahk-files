FileRemoveDir, % A_ScriptDir "\res\json", 1
FileRemoveDir, % A_ScriptDir "\res\img\items", 1
FileRemoveDir, % A_ScriptDir "\res\img\mobs", 1
FileRemoveDir, % A_ScriptDir "\res\img\mobs icons", 1

FileDelete, % A_ScriptDir "\dropLogger.ini", 1
FileDelete, % A_ScriptDir "\dropLogger_presets.ini", 1

exitapp
