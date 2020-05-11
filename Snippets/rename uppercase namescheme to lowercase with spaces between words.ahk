global sourceFolder := "E:\Videos\Recordings\Shadowplay\Unsorted"

#SingleInstance, force

sourceFolder := RTrim(sourceFolder, "\")

checkFiles()

msgbox end of script
return

checkFiles() {
    Loop, Files, % sourceFolder "\*.*", R
    {
        SplitPath, % A_LoopFileFullPath, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
        fileName := OutNameNoExt

        If !stringContainsUppercase(fileName) ; skip non uppercase strings
            continue
        If stringContainsSpace(fileName) ; skip files with spaces in them
            continue

        newFileName := getSplitUppercaseFileName(OutNameNoExt)

        ; InputBox, OutputVar, % A_ScriptName, Rename `n`n%OutDir%`n%fileName%`n`nto, , 800, 250, , , , , % newFileName
        ; If (ErrorLevel = 1) ; inputbox cancelled 
        ;     exitapp

        FileMove, % A_LoopFileFullPath, % OutDir "\" newFileName "." OutExtension
    }
}

; example: forsenDonateTriHardcmonBruh
getSplitUppercaseFileName(input) {
    loop, parse, input
    {
        LoopField := A_LoopField
        
        If A_LoopField is lower
            currentWord .= A_LoopField
        else if A_LoopField is integer
            currentWord .= A_LoopField
        else {
            output .= currentWord A_Space
            StringLower, LoopField, A_LoopField
            currentWord := LoopField
        }
    }
    output .= currentWord A_Space ; add last word
    return string_CleanUp(output)
}

stringContainsUppercase(input) {
    loop, parse, input
        If A_LoopField is upper
            return true
    return false
}

stringContainsSpace(input) {
    loop, parse, input
        If A_LoopField is space
            return true
    return false
}

~^s::reload

#Include, <JSON>