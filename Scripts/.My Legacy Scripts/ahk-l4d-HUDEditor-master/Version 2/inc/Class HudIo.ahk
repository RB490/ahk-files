Class ClassHudIoV2 {
    _SetVariables() {
/* debug:   
        ; ----------------- debugging
        this.hudDir := A_ScriptDir "\debug\HUD_IO\hudDir"
        this.gameDir := A_ScriptDir "\debug\HUD_IO\gameDir"
        this.gameDirBackup := this.gameDir ".hud_editor_backup_game_files"
        FileRemoveDir, % this.hudDir, 1
        FileRemoveDir, % this.gameDir, 1
        FileRemoveDir, % this.gameDirBackup, 1
        FileCopyDir, % this.hudDir ".bak", % this.hudDir
        FileCopyDir, % this.gameDir ".bak", % this.gameDir
        ; ----------------- debugging
 */
        this.hudDir := HUD_INFO.dir
        this.gameDir := GAME_INFO.MainDirMain
        this.gameDirBackup := this.gameDir ".hud_editor_backup_game_files"

        If !IsDir(this.hudDir)
            Msg("FatalError", A_ThisFunc, "Invalid hudDir")
        If !IsDir(this.gameDir)
            Msg("FatalError", A_ThisFunc, "Invalid gameDir")

        this.uniqueHudDirItems := {}
    }

    ; move files & folders from 'hudDir' into 'gameDir'
    ; backing duplicate items in 'gameDir' and keeping track of unique 'hudDir' items
    Sync() {
        if !IsObject(HUD_INFO)
            return
        else if !DEV_SETUP.isDevModeEnabled()
            return
        else if this.isSynced and (HUD_INFO.dir != this.hudDir)
            Msg("FatalError", A_ThisFunc, "Attempted to load a hud while a previous hud is still loaded")
        else if !this.isSynced
            this._SetVariables()

        this._BackupGameDir()
        this._MergeHudIntoGameDir()
        this._RestoreDeletedHudItems()
        this.isSynced := true
    }

    ; backup duplicate 'gameDir' files & folders that are not unique to 'hudDir'
    _BackupGameDir() {
        FileCreateDir % this.gameDirBackup
        loop, files, % this.hudDir "\*.*", FDR
        {
            hudItem := A_LoopFileFullPath
            gameItem := StrReplace(hudItem, this.hudDir, this.gameDir)
            gameItemBackup := StrReplace(hudItem, this.hudDir, this.gameDirBackup)
            If !FileExist(gameItem)
                this.uniqueHudDirItems[hudItem] := ""
            
            If IsDir(hudItem)
                FileCreateDir, % gameItemBackup
            else
                FileCopy, % gameItem, % gameItemBackup, 0 ; don't overwrite backed up files
        }
    }

    _MergeHudIntoGameDir() {
        loop, files, % this.hudDir "\*.*", DFR
        {
            hudItem := A_LoopFileFullPath
            gameItem := StrReplace(hudItem, this.hudDir, this.gameDir)

            If IsDir(hudItem)
                FileCreateDir, % gameItem
            else {
                ; after the hud is synced, only overwrite modified files
                FileGetTime, hudItemLastModified, % hudItem, M
                FileGetTime, gameItemLastModified, % gameItem, M
                If this.isSynced and (hudItemLastModified = gameItemLastModified)
                    Continue
                FileCopy, % hudItem, % gameItem, 1 ; overwrite game file
            }
        }
    }

    _RestoreDeletedHudItems() {
        currentHudDir := {}
        loop, files, % this.hudDir "\*.*", FDR
            currentHudDir[A_LoopFileFullPath] := ""
        
        If IsObject(this.previousHudDir)
            for previousItem in this.previousHudDir
                If !currentHudDir.HasKey(previousItem)
                    this._RestoreDeletedHudItem(previousItem)

        this.previousHudDir := currentHudDir
    }

    _RestoreDeletedHudItem(deletedHudItem) {
        deletedItemGamePath := StrReplace(deletedHudItem, this.hudDir, this.gameDir)
        deletedItemBackupPath := StrReplace(deletedHudItem, this.hudDir, this.gameDirBackup)

        ; if deleted hud item is a unique custom hud file
        If this.uniqueHudDirItems.HasKey(deletedHudItem) {
            If IsDir(deletedItemGamePath) {
                FileRemoveDir, % deletedItemGamePath, 1
                this.uniqueHudDirItems.Remove(deletedHudItem)
            }
            else {
                FileDelete, % deletedItemGamePath
                this.uniqueHudDirItems.Remove(deletedHudItem)
            }
        }
        
        ; don't delete default dir's
        If IsDir(deletedItemGamePath)
            return
        
        ; deleted hud item is a default game file, restore it
        FileDelete % deletedItemGamePath
        If FileExist(deletedItemBackupPath)
            FileMove, % deletedItemBackupPath, % deletedItemGamePath, 1
    }

    Restore() {
        if !DEV_SETUP.isDevModeEnabled() or !this.isSynced
            return

        ; delete unique items
        for uniqueHudItem in this.uniqueHudDirItems {
            gameItem := StrReplace(uniqueHudItem, this.hudDir, this.gameDir)
            If IsDir(uniqueHudItem)
                FileRemoveDir, % gameItem, 1
            else
                FileDelete, % gameItem
        }


        ; restore original game files
        loop, files, % this.gameDirBackup "\*.*", FDR
        {
            If !IsDir(A_LoopFileFullPath) {
                gameItemBackup := A_LoopFileFullPath
                gameItem := StrReplace(gameItemBackup, this.gameDirBackup, this.gameDir)
                FileCopy, % A_LoopFileFullPath, % gameItem, 1 ; overwrite
            }
        }

        FileRemoveDir, % this.gameDirBackup, 1

        this.previousHudDir := ""
        this.isSynced := false
    }
}