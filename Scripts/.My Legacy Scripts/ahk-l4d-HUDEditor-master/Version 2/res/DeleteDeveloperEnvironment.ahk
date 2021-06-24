#SingleInstance, force

MainDir := A_Args[1]
BackupDirDeveloper := A_Args[2]
BackupDirDefault := A_Args[3]

MainDirExists := FileExist(MainDir)
BackupDirDeveloperExists := FileExist(BackupDirDeveloper)
BackupDirDefaultExists := FileExist(BackupDirDefault)


; restore default game folder layout
If BackupDirDeveloperExists {
    loop 10 {
        FileMoveDir, % MainDir, % BackupDirDeveloper
        If ErrorLevel
            sleep 250
    } until !ErrorLevel

    loop 10 {
        FileMoveDir, % BackupDirDefaultExists, % MainDir
        If ErrorLevel
            sleep 250
    } until !ErrorLevel
}

; delete created developer dir
FileRemoveDir, % BackupDirDeveloper, 1