; thread: https://autohotkey.com/boards/viewtopic.php?t=15638

FileRead, string, % A_ScriptDir "\steam.json"

steam := Jxon_Load(string)

loop % steam.result.items.Length()
{
	i := A_Index
    if (steam.result.items[i].id = "4924696929")
    {
        loop % steam.result.items[i].attributes.Length()
        {
            j := A_Index
            if (steam.result.items[i].attributes[j].defindex = 8)
                MsgBox % steam.result.items[i].attributes[j].float_value
        }
    }
}

;MsgBox % Jxon_Load(string).result.items[1].attributes[3].float_value

; ===============================================================================================================================

DownloadToString(url, encoding := "utf-8")
{
    static a := "AutoHotkey/" A_AhkVersion
    if (!DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
        return 0
    c := s := 0, o := ""
    if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
    {
        while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s > 0)
        {
            VarSetCapacity(b, s, 0)
            DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
            o .= StrGet(&b, r >> (encoding = "utf-16" || encoding = "cp1200"), encoding)
        }
        DllCall("wininet\InternetCloseHandle", "ptr", f)
    }
    DllCall("wininet\InternetCloseHandle", "ptr", h)
    return o
}

Jxon_Load(ByRef src, args*)
{
    static q := Chr(34)

    key := "", is_key := false
    stack := [ tree := [] ]
    is_arr := { (tree): 1 }
    next := q . "{[01234567890-tfn"
    pos := 0
    while ( (ch := SubStr(src, ++pos, 1)) != "" )
    {
        if InStr(" `t`n`r", ch)
            continue
        if !InStr(next, ch, true)
        {
            ln := ObjLength(StrSplit(SubStr(src, 1, pos), "`n"))
            col := pos - InStr(src, "`n",, -(StrLen(src)-pos+1))

            msg := Format("{}: line {} col {} (char {})"
            ,   (next == "")      ? ["Extra data", ch := SubStr(src, pos)][1]
              : (next == "'")     ? "Unterminated string starting at"
              : (next == "\")     ? "Invalid \escape"
              : (next == ":")     ? "Expecting ':' delimiter"
              : (next == q)       ? "Expecting object key enclosed in double quotes"
              : (next == q . "}") ? "Expecting object key enclosed in double quotes or object closing '}'"
              : (next == ",}")    ? "Expecting ',' delimiter or object closing '}'"
              : (next == ",]")    ? "Expecting ',' delimiter or array closing ']'"
              : [ "Expecting JSON value(string, number, [true, false, null], object or array)"
                , ch := SubStr(src, pos, (SubStr(src, pos)~="[\]\},\s]|$")-1) ][1]
            , ln, col, pos)

            throw Exception(msg, -1, ch)
        }

        is_array := is_arr[obj := stack[1]]

        if i := InStr("{[", ch)
        {
            val := (proto := args[i]) ? new proto : {}
            is_array? ObjPush(obj, val) : obj[key] := val
            ObjInsertAt(stack, 1, val)
            
            is_arr[val] := !(is_key := ch == "{")
            next := q . (is_key ? "}" : "{[]0123456789-tfn")
        }

        else if InStr("}]", ch)
        {
            ObjRemoveAt(stack, 1)
            next := stack[1]==tree ? "" : is_arr[stack[1]] ? ",]" : ",}"
        }

        else if InStr(",:", ch)
        {
            is_key := (!is_array && ch == ",")
            next := is_key ? q : q . "{[0123456789-tfn"
        }

        else ; string | number | true | false | null
        {
            if (ch == q) ; string
            {
                i := pos
                while i := InStr(src, q,, i+1)
                {
                    val := StrReplace(SubStr(src, pos+1, i-pos-1), "\\", "\u005C")
                    static end := A_AhkVersion<"2" ? 0 : -1
                    if (SubStr(val, end) != "\")
                        break
                }
                if !i ? (pos--, next := "'") : 0
                    continue

                pos := i ; update pos

                  val := StrReplace(val,    "\/",  "/")
                , val := StrReplace(val, "\" . q,    q)
                , val := StrReplace(val,    "\b", "`b")
                , val := StrReplace(val,    "\f", "`f")
                , val := StrReplace(val,    "\n", "`n")
                , val := StrReplace(val,    "\r", "`r")
                , val := StrReplace(val,    "\t", "`t")

                i := 0
                while i := InStr(val, "\",, i+1)
                {
                    if (SubStr(val, i+1, 1) != "u") ? (pos -= StrLen(SubStr(val, i)), next := "\") : 0
                        continue 2

                    ; \uXXXX - JSON unicode escape sequence
                    xxxx := Abs("0x" . SubStr(val, i+2, 4))
                    if (A_IsUnicode || xxxx < 0x100)
                        val := SubStr(val, 1, i-1) . Chr(xxxx) . SubStr(val, i+6)
                }

                if is_key
                {
                    key := val, next := ":"
                    continue
                }
            }

            else ; number | true | false | null
            {
                val := SubStr(src, pos, i := RegExMatch(src, "[\]\},\s]|$",, pos)-pos)
                
                static null := "" ; for #Warn
                if InStr(",true,false,null,", "," . val . ",", true) ; if var in
                    val := %val%
                else if (Abs(val) == "") ? (pos--, next := "#") : 0
                    continue
                
                val := val + 0, pos += i-1
            }
            
            is_array? ObjPush(obj, val) : obj[key] := val
            next := obj==tree ? "" : is_array ? ",]" : ",}"
        }
    }

    return tree[1]
}

~^s::reload