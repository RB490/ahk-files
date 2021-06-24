/*
Python
    Uninstall pyton packages
        pip uninstall <package>
    
    Install package
        pip install <package>
        pip install vdf
        pip install vdf2json

    Check pyton installed packages + their location
        pip list -v

*/

#SingleInstance, force

sourceFilePath := A_ScriptDir "\spectatorsurvivor.res"
outputFilePath := A_ScriptDir "\output.txt"
; If FileExist(outputFilePath)
;     FileDelete, % outputFilePath

; example compsec ahk line
    ; run %A_ComSpec% /c code ., % HUD_INFO.dir, Hide       ; auto close
    ; run %A_ComSpec% /k code ., % HUD_INFO.dir, Hide       ; don't close

; confirm vdf2json working
    ; run %A_ComSpec% /k vdf2json -h

; run vdf2json
    run %A_ComSpec% /k vdf2json -p %sourceFilePath% %outputFilePath%

msgbox Finished

~^s::reload