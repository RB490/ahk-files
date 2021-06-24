#SingleInstance, force

gameDir := A_Args[1]
vanillaDir := A_Args[2]
devDir := A_Args[3]

loop {
    FileRemoveDir, % devDir, 1
    sleep 1000
} until !ErrorLevel or (A_Index = 20)
If ErrorLevel
    exitapp

FileMoveDir, % vanillaDir, % gameDir

exitapp