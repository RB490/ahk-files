ExitFunc() {
    new ClassSavedInfo("Save", SAVED_INFO)
    HUD_DESC.Save()

    If DEV_SETUP_ACTIVE
        GAME_DEV.DeleteDevMode()

    ; cleanup
    StopHudEditing()
}

StopHudEditing(switchBackToVanillaAndReturnToMainMenu := false) {
    SetTimer, StopHudEditWhenGameCloses, Off
    
    If SYNC_HUD {
        SYNC_HUD := ""
        UnsyncHudIngame := true
    }
    
    If !DEBUG_MODE {
        GAME_WIN.Close()
        GAME_DEV.Mode(false)
    }
    else If UnsyncHudIngame and WinExist(GAME_INFO.ahkId)
        GAME_WIN.Cmd("ReloadEverything")

    If switchBackToVanillaAndReturnToMainMenu {
        MAIN_GUI.Get()
        GAME_DEV.Mode(false)
    }
}

StartHudEditing(hudObj) {
        static previousGameVersion
        
        ; check object validity
        If !IsObject(hudObj)
            Msg("Fatal", A_ThisFunc, "Param 'hudObj' is not an object")
        If !hudObj.HasKey("dir") or !hudObj.HasKey("name") or !hudObj.HasKey("game")
            Msg("Fatal", A_ThisFunc, "Param 'hudObj' is missing one or more keys: dir, name or game")

        ; pause checking for game close
        SetTimer, StopHudEditWhenGameCloses, Off
        
        ; unsync current hud
        SYNC_HUD := ""

        ; get hud info
        HUD_INFO := hudObj

        ; get game info if it has not been set before, so the game doesnt have to be restarted incase its running
        If !GAME_INFO.Count()
            GAME_INFO := new ClassGetAppInfo(HUD_INFO.game)

        ; switching between games?
        If (HUD_INFO.game != previousGameVersion) and (HUD_INFO.game != GAME_WIN.GetRunningVersion())
            ; set other game version to vanilla
            GAME_DEV.Mode(false)

        ; get game info
        GAME_INFO := new ClassGetAppInfo(HUD_INFO.game)

        ; enable dev mode
        devModeEnabled := GAME_DEV.Mode(true)
        If !devModeEnabled {
            StopHudEditing("switchBackToVanillaAndReturnToMainMenu")
            return
        }

        ; sync hud if valid folders
        SYNC_HUD := new ClassSyncHud(HUD_INFO.dir, GAME_INFO.MainDir)
        If !SYNC_HUD {
            StopHudEditing("switchBackToVanillaAndReturnToMainMenu")
            return
        }
        
        ; run game or get game hwnd
        GAME_WIN.Run()
        
        ; refresh hud incase game has not restarted
        GAME_WIN.Cmd("ReloadEverything")
        
        ; continue checking for game close
        SetTimer, StopHudEditWhenGameCloses, On

        ; finish
        previousGameVersion := HUD_INFO.game
        return true
}

IsFile(input) {
    If (FileExist(input) = "A")
        return true
}

IsDir(input) {
    If (FileExist(input) = "D")
        return true
}

OutputDebug(input) {
    OutputDebug, % A_ScriptName ":" A_Space input
}

MenuGetTextAfterTab(input) {
    If !InStr(input, A_Tab)
        return input
    
    part := StrSplit(input, A_Tab)
    output := LTrim(part[2], A_Space)
    return output
}

GetMouseCoordOnClick(ByRef mouseX, ByRef mouseY) {
    KeyWait, LButton, D
    MouseGetPos, mouseX, mouseY
}

ShowEditorMenu() {
    If !GAME_INFO.Version {
        Msg("Info", A_ThisFunc, "Can't show menu without game version set")
        return
    }
    #Include, %A_ScriptDir%\Includes\Editor Menu.ahk
    Menu, EditorMenu, Show
}

RunVpkExeOn(target) {
    PATH_VPKEXE_COMPILE := A_ScriptDir "\Assets\VPK Tool\left4dead\vpk.exe"
    PATH_VPKEXE_EXTRACT := A_ScriptDir "\Assets\VPK Tool\nosteam\vpk.exe"
    
    If IsDir(target) ; compile
        exe := PATH_VPKEXE_COMPILE
    else ; extract
        exe := PATH_VPKEXE_EXTRACT

    RunWait % exe A_Space """" target """", , Hide
}

CloseL4D() {
    DetectHiddenWindows, On
    WinGet, RunningExe, ProcessName, ahk_class Valve001
    If !InStr(RunningExe, "left4dead")
        return
    process, close, % RunningExe
    WinWaitClose, % "ahk_exe" A_Space RunningExe
}

GetGameVideoSettingsObj() {
    input := FileRead(GAME_INFO.CfgDir "\video.txt")
    output := {}
    loop, parse, input, `n
    {
        If InStr(A_LoopField, ".") {
            setting := StringBetween(A_LoopField, """", """")
            value := StringBetween(A_LoopField, A_Tab A_Tab """", """")
            output[StrReplace(setting, "setting.")] := value
        }
    }
    return output
}

GetDefaultHudFile(relativePath) {
    ; set variables -- copy pasted & keep idenetical from 'ClassSyncHud'
    targetDir := GAME_INFO.mainDir
    SplitPath, targetDir, name, root
    targetDirs := [targetDir, root "\" name "_dlc",  root "\" name "_dlc1",  root "\" name "_dlc2",  root "\" name "_dlc3",  root "\update"]
    backupDirs := [] ; <- keep backup dirs identical with GetDefaultHudFile()
    for index, targetDir in targetDirs
        backupDirs[targetDir] := targetDir A_Space "Hud Editor Backup"

    ; search backup dirs
    for targetDir, backupDir in backupDirs {
        targetPath := backupDir "\" relativePath
        If FileExist(targetPath)
            mostRecentMatch := targetPath
    }
    
    ; search game dirs
    If !mostRecentMatch {
        for targetDir, backupDir in backupDirs {
            targetPath := targetDir "\" relativePath
            If FileExist(targetPath)
                mostRecentMatch := targetPath
        }
    }
    return mostRecentMatch
}

AddHudFileDescriptionsToFile(filePath) {
    ; ask to describe menu file, if menu file
    SplitPath, filePath, fileName
    fileDescription := HUD_DESC.GetFileFromName(fileName)
    If InStr(fileDescription.fileRelativePath, "l4d360ui") {
        Msg("InfoYesNo", A_ThisFunc, "Also describe menu files? As a side effect the script will cause some bugs inside the those files")
        IfMsgBox, Yes
            parseUnsafeMenuFiles := true
    }
    
    FileSetAttrib, -R, % filePath
    
    If !InStr(filePath, HUD_INFO.Dir)
        Msg("Info", A_ThisFunc, "File is not inside current hud folder. File will be parsed, but descriptions will not be added")
    
    relativeFilePath := StrReplace(filePath, HUD_INFO.Dir "\")
    fileStr := new ClassParseVdf(filePath).GetStringFromFile(relativeFilePath, parseUnsafeMenuFiles)
    If !fileStr {
        Msg("Info", A_ThisFunc, "Could not parse file:`n`n" filePath)
        return
    }

    FileDelete, % filePath
    FileAppend, % fileStr, % filePath

}

AddHudFileDescriptionsToDir(dir) {
    Msg("InfoYesNo", A_ThisFunc, "Also describe menu files? As a side effect the script will cause some bugs inside the those files")
    IfMsgBox, Yes
        parseUnsafeMenuFiles := true
    
    failedFiles := []
    loop, files, % dir "\*.res", FR
    {
        filePath := A_LoopFileFullPath
        relativeFilePath := StrReplace(A_LoopFileFullPath, dir "\")

        ; ask to describe menu file, if menu file
        If (parseUnsafeMenuFiles = "") {
            SplitPath, filePath, fileName
            fileDescription := HUD_DESC.GetFileFromName(fileName)
            If InStr(fileDescription.fileRelativePath, "l4d360ui") {
                Msg("InfoYesNo", A_ThisFunc, "Also describe menu files? As a side effect the script will cause some bugs inside the those files")
                IfMsgBox, Yes
                    parseUnsafeMenuFiles := true
            }
        }

        fileStr := new ClassParseVdf(filePath).GetStringFromFile(relativeFilePath, parseUnsafeMenuFiles)
        If fileStr {
            FileSetAttrib, -R, % filePath
            FileDelete, % filePath
            FileAppend, % fileStr, % filePath
        }
        else
            failedFiles.push(filePath)
    }


    If failedFiles.length()
        Msg("Info", A_ThisFunc, "Finished! Did not parse these files:`n`n" json.dump(failedFiles,,2))
    else
        Msg("Info", A_ThisFunc, "Finished!")
}

ExportHudAsVpk(hudName, hudDir) {
    If !IsDir(hudDir) {
        Msg("Info", A_ThisFunc, "Hud dir does not exist: " hudDir)
        return
    }
    
    SplitPath, hudDir, vpkName, vpkDir, OutExtension, OutNameNoExt, OutDrive

    ; prompt target file
    FileSelectFile, exportPath, S, % vpkDir "\" hudName, Save Hud As Vpk, VPK Files (*.vpk)
    If !exportPath
        return
    SplitPath, exportPath, , exportDir, , exportFileName
    exportPath := exportDir "\" exportFileName ".vpk"

    ; create vpk
    RunVpkExeOn(hudDir)

    ; rename & move vpk file
    vpkPath := vpkDir "\" vpkName ".vpk"
    FileMove, % vpkPath, % exportPath, 1
    
    ; notify if failed & cleanup compiled vpk
    If ErrorLevel {
        Msg("Info", A_ThisFunc, "Failed to overwrite target file:`n`n" exportPath "`n`nMost likely in use by another program")
        FileDelete, % vpkPath
    }

    ; open export dir
    ; run % exportDir
}