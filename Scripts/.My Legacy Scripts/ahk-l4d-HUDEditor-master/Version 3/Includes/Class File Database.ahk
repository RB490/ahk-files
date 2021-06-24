Class ClassFileDatabase {
    __New() {
        this.file := A_ScriptDir "\Assets\fileDescriptions.json"
        this.Load()
    }

    GetFiles() {
        return ObjFullyClone(this.obj)
    }

    SetFile(key, obj) {
        this.obj[key] := obj
    }

    GetFileFromName(fileName) {
        for index, f in this.obj
            If (f.fileName = fileName)
                return ObjFullyClone(f)
    }

    GetFile(relativePath) {
        ; get file name
        part := StrSplit(relativePath, "\")
        fileName := part[part.length()]
        If !fileName
            Msg("Fatal", A_ThisFunc, "Could not retrieve file name")

        ; temp remove extension
        part := StrSplit(fileName, ".")
        fileNameNoExt := part[1]

        ; create entry if not available
        If !this.obj.HasKey(relativePath) {
            If !GAME_DEV.ModeIsEnabled()
                Msg("Fatal", A_ThisFunc, "Dev mode is not enabled. Can't access correct default file to build file controls object")

            obj := []
            obj.fileRelativePath := relativePath
            obj.fileName := fileName
            obj.fileDescription := ""
            obj.fileControls := new ClassParseVdf(GetDefaultHudFile(relativePath), relativePath, true).GetControls()
            this.obj[relativePath] := obj
        }

        ; return requested information
        return ObjFullyClone(this.obj[relativePath]) ; fully clone so 'this.obj' reference isn't passed
    }

    Load() {
        this.obj := json.load(FileRead(this.file))
        If !IsObject(this.obj)
            this.obj := {}
        this.Validate()
    }

    Save() {
        FileDelete, % this.file
        FileAppend, % json.dump(this.obj,,2), % this.file
    }
}