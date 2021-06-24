Class DeveloperModeSetup {
    Mode(mode) {
        If (mode = "Developer") {
            if !this._DeveloperEnvironmentExists() {
                If SAVED_SETTINGS.devModeSetupCompleted
                    repairSuccess := this._TryToRepairDeveloperEnvironment()
                if !repairSuccess
                    this._CreateDeveloperEnvironment()
            }
        }
        this._SwitchGameFoldersToMode(mode)
    }

    isDevModeEnabled() {
        If IsDir(GAME_INFO.MainDir) and IsDir(GAME_INFO.BackupDirDefault)
            return true
    }

    _SwitchGameFoldersToMode(mode) {
        BackupDirDeveloperExists := FileExist(GAME_INFO.BackupDirDeveloper)
        BackupDirDefaultExists := FileExist(GAME_INFO.BackupDirDefault)

        CloseGame()

        /*
            bug: not using FileMoveDir rename flag because the l4d2 default game folder cant get renamed with it for no reason
            and FileMoveDir fails with ErrorLevel = true anyways when a file is opened (tested with left4dead2.exe running)
        */
        switch mode {
            case "Default": {
                If BackupDirDefaultExists {
                    FileMoveDir, % GAME_INFO.MainDir, % GAME_INFO.BackupDirDeveloper
                    Msg("FatalIfErrorLevel", A_ThisFunc, "FileMoveDir failed:`n`n" GAME_INFO.MainDir "`n`n->`n`n" GAME_INFO.BackupDirDeveloper)
                    FileMoveDir, % GAME_INFO.BackupDirDefault, % GAME_INFO.MainDir
                    Msg("FatalIfErrorLevel", A_ThisFunc, "FileMoveDir failed:`n`n" GAME_INFO.BackupDirDefault "`n`n->`n`n" GAME_INFO.MainDir)
                }
            }
            case "Developer": {
                If BackupDirDeveloperExists {
                    FileMoveDir, % GAME_INFO.MainDir, % GAME_INFO.BackupDirDefault
                    Msg("FatalIfErrorLevel", A_ThisFunc, "FileMoveDir failed:`n`n" GAME_INFO.MainDir "`n`n->`n`n" GAME_INFO.BackupDirDefault)
                    FileMoveDir, % GAME_INFO.BackupDirDeveloper, % GAME_INFO.MainDir
                    Msg("FatalIfErrorLevel", A_ThisFunc, "FileMoveDir failed:`n`n" GAME_INFO.BackupDirDeveloper "`n`n->`n`n" GAME_INFO.MainDir)
                }
            }
            default: Msg("FatalError", A_ThisFunc, "Unhandled mode specified:" A_Space "'" mode "'")
        }
    }

    _DeveloperEnvironmentExists() {
        MainDirExists := FileExist(GAME_INFO.MainDir)
        BackupDirDeveloperExists := FileExist(GAME_INFO.BackupDirDeveloper)
        BackupDirDefaultExists := FileExist(GAME_INFO.BackupDirDefault)

        If !MainDirExists
            Msg("FatalError", A_ThisFunc, "Unhandled game dir configuration, MainDir not found: " GAME_INFO.MainDir)
        If (MainDirExists) and (BackupDirDeveloperExists)
            return true
        If (MainDirExists) and (BackupDirDefaultExists)
            return true
    }

    _CreateDeveloperEnvironment() {
        sizeOnDisk := GetFileFolderSizeInGB(GAME_INFO.MainDir)
        msgStartSetup=
        ( LTrim
        Enable hud editing?
        
        - This can take up to ~30 minutes depending on drive and processor speed
        - This will use %sizeOnDisk% of disk space (copy of the game folder)
        )
        game := GAME_INFO.version
        msgWaitForSteamVerify=
		( Ltrim
		'Verify integrity of games files' for %game% in steam
		
        Steam finished verifying, downloading missing files and continue setup?
		)

        ; prompt start setup
        Msg("InfoYesNo", A_ThisFunc, msgStartSetup)
        IfMsgBox, No
            reload
        
        ; copy game folder (file by file, so the script doesnt lock up)
        SAVED_SETTINGS.devModeSetupCompleted := false
        DEV_SETUP_ACTIVE := true
        this.CloseGame()
        P.Get(A_ThisFunc, "Copying game dir", A_Space, A_Space)
        CopyOrMoveDirSourceToDestination("copy", GAME_INFO.MainDir, GAME_INFO.BackupDirDeveloper)
        this._SwitchGameFoldersToMode("Developer")

        ; prompt steam verify
        P.T1("Waiting on steam verify"), P.B1(0)
        Msg("InfoYesNo", A_ThisFunc, msgWaitForSteamVerify)
        IfMsgBox, No
            reload

        ; extract pak01_dirs
        P.T1("Extracting pak01_dirs"), P.B1(GAME_INFO.dirsContainingPak01.length())
        for index, dir in GAME_INFO.dirsContainingPak01 {
            relativeDisplayDir := StrReplace(dir, GAME_INFO.MainDir)
            P.T2("..." relativeDisplayDir "\pak01_dir.vpk")
            vpk(dir "\pak01_dir.vpk")
            P.B1()
        }

        ; merge extracted pak01_dirs
        for index, dir in GAME_INFO.dirsContainingPak01 {
            relativeDisplayDir := StrReplace(dir, GAME_INFO.MainDir)
            P.T1("Merging ..." relativeDisplayDir "\pak01_dir") ; T.2 gets set by file copy func
            CopyOrMoveDirSourceToDestination("move", dir "\pak01_dir", dir)
        }

        ; delete pak01 vpks
        P.T1("Deleting pak01 vpks"), P.B1(0)
        for index, dir in GAME_INFO.dirsContainingPak01
            loop, files, % dir "\*.vpk", F
                FileDelete % A_LoopFileFullPath

        ; merge dirsContainingPak01 aka dlc folders
        for index, dir in GAME_INFO.dirsContainingPak01 {
            If (index = 1) ; skip main folder eg. 'left4dead'
                Continue
            relativeDisplayDir := StrReplace(dir, GAME_INFO.MainDir)
            P.T1("Merging ..." relativeDisplayDir) ; T.2 gets set by file copy func
            CopyOrMoveDirSourceToDestination("move", dir, GAME_INFO.MainDirMain)
        }

        ; disable/remove addons
        WriteGameConfig()

        ; rebuild audio cache
        P.T1("Rebuilding audio cache"), P.B1(0), P.T2("Do not close the game")
        FileDelete % GAME_INFO.MainDirMain "\cfg\valve.rc"
        FileAppend, snd_rebuildaudiocache`n, % GAME_INFO.MainDirMain "\cfg\valve.rc"
        FileAppend, exit, % GAME_INFO.MainDirMain "\cfg\valve.rc"
        CloseGame() ; just to be sure
        Run, % SAVED_SETTINGS.ExePath_Steam A_Space "-applaunch " GAME_INFO.appid " -novid -w 1 -h 1", , , OutputVarPID
        WinWait, % "ahk_exe " GAME_INFO.exe
        WinHide, % "ahk_exe " GAME_INFO.exe
        DetectHiddenWindows, On
        WinWaitClose, % "ahk_exe " GAME_INFO.exe

        P.Destroy()
        SAVED_SETTINGS.devModeSetupCompleted := true
        DEV_SETUP_ACTIVE := false
    }

    DeleteDeveloperEnvironment() {
        this._SwitchGameFoldersToMode("Default")
		FileRemoveDir, % GAME_INFO.BackupDirDeveloper, R
    }

    ExitThenDeleteDeveloperEnvironment() {
        CloseGame()
        MainDir := """" GAME_INFO.MainDir """"
        BackupDirDeveloper := """" GAME_INFO.BackupDirDeveloper """"
        BackupDirDefault := """" GAME_INFO.BackupDirDefault """"
        ; delete with separate script so the folders arent in use by this script and 'FileMoveDir' actually works
        run % PATH_DELETE_DEVMODE A_Space MainDir A_Space BackupDirDeveloper A_Space BackupDirDefault
    }

    _TryToRepairDeveloperEnvironment() {
        repairGui := new this.ClassGuiRepairSetup(APP_NAME A_Space "Repair game folders")
        success := repairGui.Get(this)
        return success
    }

    Class ClassGuiRepairSetup extends gui {
        ; Get(defaultGameDir := "", developerGameDir := "") {
        Get(parentInstance) {
            this.parent := parentInstance
            width := 400

            this._searchCorrectGameFolders()

            this.font("s10")
            this.add("text", "w" width, "Unexpected game folder names. Set correct folder paths or create new developer environment")

            this.font("s12")
            this.add("text", "w" width, "Default Game Folder")
            this.font()
            this.add("text", "w" width, "Contains ..\left4dead\pak01.vpk files and '..\left4dead_DLC' folders")
            this.add("edit", "w" width, this.defaultGameDir)

            this.font("s12")
            this.add("text", "w" width, "Developer Game Folder")
            this.font()
            this.add("text", "w" width, "No ..\left4dead\pak01.vpk files and no '..\left4dead_DLC' folders")
            this.add("edit", "w" width, this.developerGameDir)

            this.add("button", "w" width, "Repair", this.repair.bind(this))
            this.add("button", "w" width " r2", "Create new developer environment", this.dontRepair.bind(this))

            this.show()
            WinWaitClose, % this.ahkid
            return this.result
        }

        _searchCorrectGameFolders() {
            ; search saved game installation dir for installations
            foundDirs := {} 
            SplitPath, % GAME_INFO.MainDir, OutFileName, MainDirParent, OutExtension, OutNameNoExt, OutDrive
            If MainDirParent {
                loop, files, % MainDirParent "\*.*", D ; directories
                {
                    SplitPath, % A_LoopFileFullPath, OutFileName, OutDir, OutExtension, loopDirName, OutDrive
                    If InStr(loopDirName, GAME_INFO.version)
                        foundDirs[A_LoopFileFullPath] := ""
                }
            }

            for dir in foundDirs {
                If FileExist(dir "\" GAME_INFO.versionNoSpaces "\pak01_dir.vpk")
                    this.defaultGameDir := dir
                else
                    this.developerGameDir := dir
            }
        }

        dontRepair() {
            this.Hide()
        }

        repair() {
            this.defaultDir := this.GetText("edit1")
            isValid := this._isValidDefaultDir(this.defaultDir)
            If !isValid {
                Msg("Info", A_ThisFunc, "Invalid default game directory")
                return
            }

            this.developerDir := this.GetText("edit2")
            isValid := this._isValidDeveloperDir(developerDir)
            If !isValid {
                Msg("Info", A_ThisFunc, "Invalid developer game directory")
                return
            }

            CloseGame()
            FileMoveDir, % this.defaultDir, % GAME_INFO.BackupDirDefault
            FileMoveDir, % this.developerDir, % GAME_INFO.BackupDirDeveloper
            FileMoveDir, % GAME_INFO.BackupDirDefault, % GAME_INFO.MainDir
            this.result := true
            this.Hide()
        }

        _isValidDefaultDir() {
            If FileExist(this.defaultDir "\" GAME_INFO.versionNoSpaces "\pak01_dir.vpk")
                return true
        }

        _isValidDeveloperDir() {
            If !FileExist(this.developerDir "\" GAME_INFO.versionNoSpaces "\pak01_dir.vpk")
                return true
        }

        Close() {
            exitapp
        }
    }
}