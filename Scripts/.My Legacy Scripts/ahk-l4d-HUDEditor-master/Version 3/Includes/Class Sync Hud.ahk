/* 
sourceDir = hud
targetDir = game
backupDir = any folder, contains items that exist in sourceDir & targetDir

goal:
    sync
        - backup items that exist in source & target
        - copy source items into target
        - restore backed up items for deleted items in source

    restore
        - delete every unique source item
        - restore backed up items
 */

Class ClassSyncHud {
    __New(sourceDir, targetDir) {
/* 
        ; sync debug code
        If DEBUG_MODE {
            ; set variables
            debugRoot := A_ScriptDir "\Debug\Sync\"
            If !IsDir(debugRoot)
                Msg("Fatal", A_ThisFunc, "Debug root dir does not exist: " debugRoot)

            sourceDir := debugRoot "hud"
            targetDir := debugRoot "game"
            targetDirDlc := debugRoot "game_dlc"

            ; clean up junk
            loop, files, % debugRoot "\*.*", D
                If !InStr(A_LoopFileFullPath, "backup.")
                    FileRemoveDir, % A_LoopFileFullPath, 1

            ; copy work folders
            FileCopyDir, % debugRoot "backup.hud", % sourceDir
            FileCopyDir, % debugRoot "backup.game", % targetDir
            FileCopyDir, % debugRoot "backup.game_dlc", % targetDirDlc
        }
 */
        ; set variables
        this.sourceDir := sourceDir
        this.targetDir := targetDir
        SplitPath, targetDir, name, root
        this.targetDirs := [targetDir, root "\" name "_dlc",  root "\" name "_dlc1",  root "\" name "_dlc2",  root "\" name "_dlc3",  root "\update"]
        this.backupDirs := [] ; <- keep backup dirs identical with GetDefaultHudFile()
        for index, targetDir in this.targetDirs
            this.backupDirs[targetDir] := targetDir A_Space "Hud Editor Backup"

        for index, targetDir in this.targetDirs
            this.uniqueItems[targetDir] := []

        ; verify main folders
        If !IsDir(this.sourceDir) {
            Msg("Info", A_ThisFunc, "Invalid source dir: " this.sourceDir)
            return
        }
        If !IsDir(this.targetDir) {
            Msg("Info", A_ThisFunc, "Invalid target dir: " this.targetDir)
            return
        }

        ; check if somehow a backup dir wasnt restored
        for targetDir, backupDir in this.backupDirs {
            If IsDir(backupDir) {
                Msg("Info", A_ThisFunc, "Detected already existing backup dir: " backupDir "`n`nRestoring it")
                FileMoveDir, % backupDir, % targetDir, 2
            }
        }

        ; sync
        this.Sync()
    }

    __Delete() {
        this._Unsync()
    }

    Sync() {
        this._BackupTarget()
        this._OverwriteTarget()
        this._UnsyncDeletedSourceItems()
    }

    ; move original target items to backup that exist in source and hereby also moving any extra dlc version copies out of the way
    _BackupTarget() {
        loop, files, % this.sourceDir "\*.*", FDR
        {
            sourceItem := A_LoopFileFullPath

            for targetDir, backupDir in this.backupDirs {
                ; set variables
                targetItem := StrReplace(sourceItem, this.sourceDir, targetDir)
                backupItem := StrReplace(targetItem, targetDir, backupDir)

                ; don't backup unique items
                if this.uniqueItems[targetDir].HasKey(sourceItem)
                    Continue

                ; store unique items
                If !FileExist(targetItem) {
                    this.uniqueItems[targetDir][sourceItem] := ""
                    Continue
                }

                ; backup target (game) & dlc files
                If IsDir(sourceItem)
                    FileCreateDir, % backupItem
                else
                    FileMove, % targetItem, % backupItem, 0
            }
        }
    }

    ; overwrite items that exist in source and in target
    _OverwriteTarget() {
        static overwrittenItems := []

        loop, files, % this.sourceDir "\*.*", FDR
        {
            sourceItem := A_LoopFileFullPath
            targetItem := StrReplace(sourceItem, this.sourceDir, this.targetDir)
            backupItem := StrReplace(targetItem, this.targetDir, this.backupDir)

            ; after file is already overwritten, only overwrite when it's modified
            If overwrittenItems.HasKey(sourceItem) {
                FileGetTime, sourceItemLastModified, % sourceItem, M
                FileGetTime, targetItemLastModified, % targetItem, M
                If (sourceItemLastModified = targetItemLastModified)
                    Continue
            }

            If IsDir(sourceItem)
                FileCreateDir, % targetItem
            else
                FileCopy, % sourceItem, % targetItem, 1

            overwrittenItems[sourceItem] := ""
        }
    }

    _UnsyncDeletedSourceItems() {
        static sourceItems, lastSourceItems

        sourceItems := []
        loop, files, % this.sourceDir "\*.*", FDR
            sourceItems[A_LoopFileFullPath] := ""
        
        for lastItem in lastSourceItems
            If !sourceItems.HasKey(lastItem)
                this._UnsyncDeletedSourceItem(lastItem)
        
        lastSourceItems := sourceItems
    }

    _UnsyncDeletedSourceItem(deletedItem) {
        for index, targetDir in this.targetDirs {
            ; set variables
            backupItem := StrReplace(deletedItem, this.sourceDir, this.backupDirs[targetDir])
            targetItem := StrReplace(deletedItem, this.sourceDir, targetDir)

            If this.uniqueItems[targetDir].HasKey(deletedItem) {
                ; delete and remove from 'uniqueItems'
                If IsDir(targetItem)
                    FileRemoveDir, % targetItem , 1
                else
                    FileDelete, % targetItem
                this.uniqueItems[targetDir].Remove(deletedItem)
            } else {
                ; restore backup item by overwriting target
                If IsFile(backupItem)
                    FileMove, % backupItem, % targetItem, 1
            }
        }
    }

    _Unsync() {
        ; delete unique items
        for uniqueItem in this.uniqueItems[this.targetDir] {
            targetItem := StrReplace(uniqueItem, this.sourceDir, this.targetDir)
            If IsDir(targetItem)
                FileRemoveDir, % targetItem, 1
            else
                FileDelete, % targetItem
        }

        ; restore backed up files
        for targetDir, backupDir in this.backupDirs {
            ; skip if no backup files are available
            If !IsDir(backupDir)
                Continue

            ; restore backup files
            loop, files, % backupDir "\*.*", FDR
            {
                backupItem := A_LoopFileFullPath
                targetItem := StrReplace(backupItem, backupDir, targetDir)

                If IsDir(backupItem)
                    FileCreateDir, % backupItem
                else
                    FileMove, % backupItem, % targetItem, 1
            }
            
            ; delete backup folder
            FileRemoveDir, % backupDir, 1
        }
    }
}