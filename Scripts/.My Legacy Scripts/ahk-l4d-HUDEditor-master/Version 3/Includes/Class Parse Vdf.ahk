
Class ClassParseVdf {
    __New(filePath) {
        ; set variables
        vdf2jsonDir := A_ScriptDir "\Assets\VDF To JSON\vdf2json"
        vdf2jsonExePath := A_ScriptDir "\Assets\VDF To JSON\vdf2json\vdf2json.exe"

        SplitPath, filePath, fileName, fileDir, fileExt
        inFile := filePath
        outFile := fileDir "\" fileName "_hud_editor_temp.json" 
        tempFile := fileDir "\" fileName "_hud_editor_temp.txt"

        ; skip certain files
        If (fileExt != "res")
            return
        If InStr(fileName, "scheme")
            return

        ; get file content
        FileRead, fileContent, % inFile
        If !fileContent
            Msg("Fatal", A_ThisFunc, "Empty file: " filePath)
    
        ; remove redundant lines
        fileContent := this._GetCleanResourceString(fileContent)

        ; retrieve json from python script
        FileDelete, % outFile
        RunWait, % vdf2jsonExePath A_Space "-p" A_Space """" inFile """" A_Space """" outFile """",, Hide
        FileRead, fileContent, % outFile
        If !fileContent
            return
            ; Msg("Fatal", A_ThisFunc, "No data retrieved (most likely invalid resource file) for: " filePath)
        FileDelete, % outFile

        ; load json into object
        ; jsonReviverFunc
        jsonReviverFunc := Func("jsonReviverFuncDefinition").Bind()
        this.obj := json.load(fileContent, jsonReviverFunc)

        ; for key, value in this.obj {
        ;     fileHeader := key
        ; }
        ; obj := this.obj[fileHeader]
        ; for key, value in obj {
        ;     msgbox % key " and " value
        ; }
        ; clipboard := json.dump(this.obj,,2)
        ; msgbox % json.dump(this.obj,,2)
        ; msgbox clipboard

        ; check if valid input
        If !IsObject(this.obj)
            return
    }

    ModifyIntegerKeys(integerKey, integerAmount) {
        Switch integerKey {
            Case "visible":
            Case "enabled":
            Case "xpos":
            Case "ypos":
            Case "wide":
            Case "tall":
            Default: Msg("Fatal", A_ThisFunc, "Invalid key")
        }
        
        ; get obj
        outputObj := obj := this.obj

        ; get file header
        for key in obj
            fileHeader := key
        obj := obj[fileHeader]

        ; go through controls
        for control in obj {
            control := obj[control]
            If !control.HasKey(integerKey)
                Continue
            int := control[integerKey]

            ; handle 'paramStr' values eg. c-25
            part := StrSplit(int, "-")
            paramStr := ""
            If (part.length() > 1)
                paramStr := part[1], int := "-" part[2]
            int += integerAmount
            newInt := paramStr int

            ; save modified value
            control[integerKey] := newInt
        }
        return this._GetStringFromObj(outputObj)
    }

    GetControls() {
        obj := this.obj
        
        for key in obj
            fileHeader := key
        obj := obj[fileHeader]

        output := []
        for control in obj
            output[control] := ""
        return output
    }

    GetStringFromFileDebug() {
        return this._GetStringFromObj(this.obj)
    }

    GetStringFromFile(relativeFilePath, parseUnsafeMenuFiles) {
        relativeFilePath := RTrim(relativeFilePath, "\")
        If !parseUnsafeMenuFiles and InStr(relativeFilePath, "resource\ui\l4d360ui")
            return

        outputStr := this._GetStringFromObj(this.obj, relativeFilePath)
        return outputStr
    }

    _GetStringFromObj(obj, relativeFilePath := "") {
        output := []
        
        ; get file description
        If relativeFilePath
            this.fileDesc := HUD_DESC.GetFile(relativeFilePath)

        ; fileheader
        for key in obj
            fileHeader := key
        obj := obj[fileHeader]

        If this.fileDesc.fileDescription
            output.push("// " this.fileDesc.fileDescription)
        output.push("""" fileHeader """")
        output.push("{")

        ; key:values
        for controlName in obj {
            control := obj[controlName]
            output.push("`r")
            
            If this.fileDesc.fileControls[controlName]
                output.push(A_Tab "// " this.fileDesc.fileControls[controlName])
            output.push(A_Tab controlName)
            output.push(A_Tab "{")
            longestKey := this._ObjGetLongestKeyStr(control) + 4

            ; sorted key:values
            priorityControls := ["fieldname", "controlName", "visible","enabled","xpos","ypos","zpos","wide","tall","usetitlesafe", "PaintBackgroundType"]
            for i, k in priorityControls {
                If !control.HasKey(k)
                    Continue
                output.push(this._GetKeyValueStr(k, control[k], 1, longestKey))
                control.Remove(k)
            }

            ; remaining key:values
            for key, value in control {
                
                If !IsObject(value) {
                    ; normal key:value
                    output.push(this._GetKeyValueStr(key, value, 1, longestKey))
                } else {
                    ; key:value object
                    If InStr(key, "if_split_screen")
                        Continue
                    nestedObj := value

                    output.push(A_Tab A_Tab """" key """")
                    output.push(A_Tab A_Tab "{")
                    longestKey := this._ObjGetLongestKeyStr(control) + 4
                    
                    for key, value in nestedObj {
                        If IsObject(value)
                            Msg("Fatal", A_ThisFunc, "Current file has one indent level too deep: " fileHeader)
                        
                        output.push(this._GetKeyValueStr(key, value, 2, longestKey))
                    }
                    
                    output.push(A_Tab A_Tab "}")
                }
            }
            
            output.push(A_Tab "}")
        }
        output.push("}")

        loop % output.length()
            outputStr .= output[A_Index] "`n"

        return outputStr
    }

    _GetKeyValueStr(key, value, indent, longestKey) {
        indent++
        loop % indent
            spacing .= A_Tab

        key := """" key """"
        value := """" value """"

        valueIndent := longestKey - StrLen(key)
        loop % valueIndent
            valueSpacing .= A_Space

        output := spacing key valueSpacing value
        return output
    }

    _GetCleanResourceString(resourceString) {
        ; get lines obj
        lines := []
        loop, parse, % resourceString, `n
        {
            line := Trim(A_LoopField) ; cleanup tabs&spaces
            line := LTrim(line, "`r`n") ; remove extra 'new lines'   
            lines.push(line)
        }

        ; remove xbox controls. eg: "BackgroundImage" [$X360]
        output := []
        for lineNo, line in lines {
            If InStr(line, "{")
                indent++
            If InStr(line, "}")
                indent--
            
            If skipThisControl and (indent = 1) and !InStr(line, "}")
                skipThisControl := false
            
            If (indent = 1) and InStr(line, "[$X360]")
                skipThisControl := true


            If skipThisControl
                Continue

            output.push(line)
        }

        ; remove remaining junk lines
        lines := output.clone()
        output := []
        for lineNo, line in lines {
            ; skip lines
            If InStr(line, "[$X360]")
                Continue
            If InStr(line, "[$X360GUEST]")
                Continue
            If InStr(line, "[!$ENGLISH]")
                Continue
            
            ; cleanup lines
            line := StrReplace(line, "[!$X360GUEST]")

            ; add line
            output.push(line)
        }

        ; build output str
        for lineNo, line in output
            outputStr .= line "`n"
        return outputStr
    }

    _ObjGetLongestKeyStr(obj) {
        for key, value in obj {
            len := StrLen(key)
            If (len > output)
                output := len
        }
        return output
    }
}