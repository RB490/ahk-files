Class ClassGameDevMode {
    __Call(caller) {
        If !GAME_INFO.count() {
            Msg("Info", A_ThisFunc, "Game info not set! Returning before accessing caller: " caller)
            return
        }
    }
    
    Mode(enableBool) {
        Switch enableBool {
            case true: {
                If !this._GetDevDir() {
                    setupSuccess := new this.ClassDevSetup(this)
                    P.Destroy()
                    If !setupSuccess
                        return
                }
                this._SwitchFolderTo("developer")
                return true
            }
            case false: this._SwitchFolderTo("vanilla")
            Default: Msg("Fatal", A_ThisFunc, "Invalid mode specified: " mode)
        }
    }

    ModeIsEnabled() {
        If (this._GetDevDir() = GAME_INFO.Dir)
            return true
    }

    _GetDevDir() {
        loop, files, % STEAM_INFO.GameDir "\*.*", D
        {
            gameDir := A_LoopFileFullPath
            idFilePath := gameDir "\" GAME_INFO.idFileRelativePath
            If FileExist(idFilePath)
                return A_LoopFileFullPath
        }
    }

    _GetVanillaDir() {
        loop, files, % STEAM_INFO.GameDir "\*.*", D
        {
            gameDir := A_LoopFileFullPath
            idFilePath := gameDir "\" GAME_INFO.idFileRelativePath
            If !FileExist(idFilePath) and FileExist(gameDir "\" GAME_INFO.exe)
                return A_LoopFileFullPath
        }
    }

    _SwitchFolderTo(mode) {
        vanillaDir := this._GetVanillaDir()
        devDir := this._GetDevDir()
        gameDir := GAME_INFO.Dir
        If (GAME_INFO = "Left 4 Dead")
            gameNr := A_Space 1

        switch mode {
            case "developer": {
                If (gameDir = devDir)
                    return
                CloseL4D()
                FileMoveDir, % vanillaDir, % gameDir gameNr " Vanilla"
                FileMoveDir, % devDir, % gameDir
            }
            case "vanilla": {
                If (gameDir = vanillaDir)
                    return
                CloseL4D()
                FileMoveDir, % devDir, % gameDir gameNr " Hud Dev Mode"
                FileMoveDir, % vanillaDir, % gameDir
            }
            default: Msg("Fatal", A_ThisFunc, "Invalid mode specified: " mode)
        }
    }

    DeleteDevMode() {
        gameDir := """" GAME_INFO.Dir """"
        vanillaDir := """" this._GetVanillaDir() """"
        devDir := """" this._GetDevDir() """"
        scriptPath := A_ScriptDir "\Assets\Scripts\DeleteDevModeAndRestoreVanilla.ahk"
        CloseL4D()
        run, % scriptPath A_Space gameDir A_Space vanillaDir A_Space devDir
    }

    _CopyOrMoveDirSourceToDestination(action, sourceDir, destDir, isOverwriteMode := false) {
        If isOverwriteMode
            isOverwriteMode := true
        
        Loop, Files, % sourceDir "\*.*", DFR
            actions++
        P.B2(actions)

        FileCreateDir, % destDir
        Loop, Files, % sourceDir "\*.*", DFR
        {
            target := StrReplace(A_LoopFileFullPath, sourceDir, destDir)

            If IsDir(A_LoopFileFullPath)
                FileCreateDir, % target
            else {
                switch action {
                    case "copy": {
                        FileCopy, % A_LoopFileFullPath, % target, % isOverwriteMode
                        ; Msg("FatalIfErrorLevel", A_ThisFunc, "Failed to copy`n`n" A_LoopFileFullPath "`n`n->`n`n" target)
                    }
                    case "move": {
                        FileMove, % A_LoopFileFullPath, % target, % isOverwriteMode
                        ; Msg("FatalIfErrorLevel", A_ThisFunc, "Failed to move`n`n" A_LoopFileFullPath "`n`n->`n`n" target)
                    }
                    default: Msg("FatalError", A_ThisFunc, "Invalid action specified: " action)
                }
            }

            P.B2T(A_LoopFileShortName)
        }

        If (action = "move")
            FileRemoveDir, % sourceDir, true
    }

    Class ClassDevSetup {
        __New(parentInstance) {
            this.parent := parentInstance

            ; prompt start setup
            continueSetup := this._PromptStartSetup()
            If !continueSetup
                return
            DEV_SETUP_ACTIVE := true

            ; create dev folder
            P.Get("Setup", "Copying game folder", 6, A_Space, A_Space)
            SplitPath, % GAME_INFO.idFileRelativePath, , idFileRelativeDir
            FileCreateDir, % GAME_INFO.dir " Hud Dev Mode\" idFileRelativeDir
            FileAppend, , % GAME_INFO.dir " Hud Dev Mode\" GAME_INFO.idFileRelativePath

            this.parent._CopyOrMoveDirSourceToDestination("copy", GAME_INFO.dir, GAME_INFO.dir " Hud Dev Mode")
            this.parent._SwitchFolderTo("developer")

            ; prompt steam verify
            P.B1T("Waiting on steam verify"), P.B2(0)
            continueSetup := this._PromptSteamVerify()
            If !continueSetup
                return

            ; extract pak01_dir vpk's
            this._ExtractPak01s()
            
            ; merge extracted pak01_dir vpk's
            this._MergeExtractedPak01Folders()

            ; delete pak01 vpks
            this._DeletePak01s()

            ; install sourcemod
            this._InstallSourcemod()

            ; install raymans admin system
            FileCopyDir, % GAME_INFO.raymansAdminSystemDir, % GAME_INFO.mainDir, 1

            ; rebuild audio cache
            this._RebuildAudioCache()

            DEV_SETUP_ACTIVE := false
            return true
        }

        _ExtractPak01s() {
            P.B1T("Extracting pak01_dirs"), P.B2(GAME_INFO.dirsWithPak01s.length())
            for index, dir in GAME_INFO.dirsWithPak01s {
                relativeDisplayDir := StrReplace(dir, GAME_INFO.Dir)
                P.B2T("..." relativeDisplayDir "\pak01_dir.vpk")
                RunVpkExeOn(dir "\pak01_dir.vpk")
            }
        }

        _MergeExtractedPak01Folders() {
            for index, dir in GAME_INFO.dirsWithPak01s {
                relativeDisplayDir := StrReplace(dir, GAME_INFO.Dir)
                P.B1T("Merging ..." relativeDisplayDir "\pak01_dir") ; T.2 gets set by file copy func
                this.parent._CopyOrMoveDirSourceToDestination("move", dir "\pak01_dir", dir, "overwrite")
            }
        }

        _DeletePak01s() {
            P.B1T("Deleting pak01 vpks"), P.B2(0)
            for index, dir in GAME_INFO.dirsWithPak01s
                loop, files, % dir "\*.vpk", F
                    FileDelete % A_LoopFileFullPath
        }

        _InstallSourcemod() {
            P.B1T("Installing sourcemod"), P.B2(0)
            FileCopyDir, % GAME_INFO.sourcemodFilesDir, % GAME_INFO.mainDir, 1
        }

        _RebuildAudioCache() {
            P.B1T("Rebuilding audio cache"), P.B2(0), P.B2T("Do not close the game")
            CloseL4D()
            FileDelete % GAME_INFO.cfgDir "\valve.rc"
            FileAppend, snd_rebuildaudiocache`nexit, % GAME_INFO.cfgDir "\valve.rc"
            Run, % STEAM_INFO.ExePath A_Space "-applaunch " GAME_INFO.appid " -novid -w 1 -h 1 -x 0 -y 0 -windowed"
            WinWait, % "ahk_exe " GAME_INFO.exe
            WinHide, % "ahk_exe " GAME_INFO.exe
            DetectHiddenWindows, On
            WinWaitClose, % "ahk_exe " GAME_INFO.exe
        }

        _PromptStartSetup() {
            ; If DEBUG_MODE
            ;     return true
            
            sizeOnDisk := GetFileFolderSizeInGB(GAME_INFO.Dir)
            msgStartSetup=
            ( LTrim
            Enable hud editing?
            
            - This can take up to ~30 minutes depending on drive and processor speed
            - This will use around %sizeOnDisk% of disk space (copy of the game folder)
            - Keep L4D closed during this time
            )
            Msg("InfoYesNo", A_ThisFunc, msgStartSetup)
            IfMsgBox, Yes
                return true
        }

        _PromptSteamVerify() {
            game := GAME_INFO.version
            msgWaitForSteamVerify=
            ( Ltrim
            'Verify integrity of games files' for %game% in steam
            
            Steam finished verifying, downloading missing files and continue setup?
            )
            Msg("InfoYesNo", A_ThisFunc, msgWaitForSteamVerify)
            IfMsgBox, No
                return
            
            Msg("InfoYesNo", A_ThisFunc, "Are you sure Steam finished verifying, downloading missing files and continue setup?")
            IfMsgBox, No
                return
            
            return true
        }
    }
}