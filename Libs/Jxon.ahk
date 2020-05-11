/*
https://github.com/cocobelgica/AutoHotkey-JSON

# JSON and Jxon

#### [JSON](http://json.org/) lib for [AutoHotkey](http://ahkscript.org/)

Requirements: Latest version of AutoHotkey _(v1.1+ or v2.0-a+)_

Version: v2.1.1 _(updated 01/30/2016)_

License: [WTFPL](http://wtfpl.net/)


- - -

## JSON.ahk (class)
Works on both AutoHotkey _v1.1_ and _v2.0a_

### Installation
Use `#Include JSON.ahk` or copy into a [function library folder](http://ahkscript.org/docs/Functions.htm#lib) and use `#Include <JSON>`.

- - -

#### .Load()
Parses a JSON string into an AHK value

#### Syntax:

    value := JSON.Load( text [, reviver ] )


#### Return Value:
An AutoHotkey value _(object, string, number)_

#### Parameter(s):
 * **text** [in] - JSON formatted string
 * **reviver** [in, opt] - function object, prescribes how the value originally produced by parsing is transformed, before being returned. Similar to JavaScript's `JSON.parse()` _reviver_ parameter.

- - -

#### .Dump()
Converts an AHK value into a JSON string

#### Syntax:

    str := JSON.Dump( value, [, replacer, space ] )


#### Return Value:
A JSON formatted string

#### Parameter(s):
 * **value** [in] - AutoHotkey value _(object, string, number)_
 * **replacer** [in, opt] - function object, alters the behavior of the stringification process. Similar to JavaScript's `JSON.stringify()` _replacer_ parameter.
 * **space** [in, opt] -if _space_ is a non-negative integer or string, then JSON array elements and object members will be pretty-printed with that indent level. Blank( ``""`` ) _(the default)_ or ``0`` selects the most compact representation. Using a positive integer _space_ indents that many spaces per level, this number is capped at 10 if it's larger than that. If _space_ is a string (such as ``"`t"``), the string _(or the first 10 characters of the string, if it's longer than that)_ is used to indent each level.

- - -
 
## Jxon.ahk (function)
Similar to the JSON class above just implemented as a function. ~~Unlike JSON (class) above, this implementation provides _reading from_ and _writing to_ file~~(Removed `Jxon_Read` and `Jxon_Write`). Works on both AutoHotkey _v1.1_ and _v2.0a_

### Installation
Use `#Include Jxon.ahk` or `#Include <Jxon>`. Must be copied into a [function library folder](http://ahkscript.org/docs/Functions.htm#lib) for the latter.

- - -

### Jxon_Load()
Deserialize _src_ (a JSON formatted string) to an AutoHotkey object

#### Syntax:

    obj := Jxon_Load( ByRef src [ , object_base := "", array_base := "" ] )


#### Parameter(s):
 * **src** [in, ByRef] - JSON formatted string or path to the file containing JSON formatted string.
 * **object_base** [in, opt] - an object to use as prototype for objects( ``{}`` ) created during parsing.
 * **array_base** [in, opt] - an object to use as prototype for arrays( ``[]`` ) created during parsing.

- - -

### Jxon_Dump()
Serialize _obj_ to a JSON formatted string

#### Syntax:

    str := Jxon_Dump( obj [ , indent := "" ] )


#### Return Value:
A JSON formatted string.

#### Parameter(s):
 * **obj** [in] - this argument has the same meaning as in _JSON.Dump()_
 * **indent** [in, opt] - this argument has the same meaning as in _JSON.Dump()_
*/

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
			
			; For numerical values, numerify integers and keep floats as is.
			; I'm not yet sure if I should numerify floats in v2.0-a ...
				static number := "number", integer := "integer"
				if val is %number%
				{
					if val is %integer%
						val += 0
				}
			; in v1.1, true,false,A_PtrSize,A_IsUnicode,A_Index,A_EventInfo,
			; SOMETIMES return strings due to certain optimizations. Since it
			; is just 'SOMETIMES', numerify to be consistent w/ v2.0-a
				else if (val == "true" || val == "false")
					val := %value% + 0
			; AHK_H has built-in null, can't do 'val := %value%' where value == "null"
			; as it would raise an exception in AHK_H(overriding built-in var)
				else if (val == "null")
					val := ""
			; any other values are invalid, continue to trigger error
				else if (pos--, next := "#")
					continue
				
				pos += i-1
			}
			
			is_array? ObjPush(obj, val) : obj[key] := val
			next := obj==tree ? "" : is_array ? ",]" : ",}"
		}
	}

	return tree[1]
}

Jxon_Dump(obj, indent:="", lvl:=1)
{
	static q := Chr(34)

	if IsObject(obj)
	{
		static Type := Func("Type")
		if Type ? (Type.Call(obj) != "Object") : (ObjGetCapacity(obj) == "")
			throw Exception("Object type not supported.", -1, Format("<Object at 0x{:p}>", &obj))

		is_array := 0
		for k in obj
			is_array := k == A_Index
		until !is_array

		static integer := "integer"
		if indent is %integer%
		{
			if (indent < 0)
				throw Exception("Indent parameter must be a postive integer.", -1, indent)
			spaces := indent, indent := ""
			Loop % spaces
				indent .= " "
		}
		indt := ""
		Loop, % indent ? lvl : 0
			indt .= indent

		lvl += 1, out := "" ; Make #Warn happy
		for k, v in obj
		{
			if IsObject(k) || (k == "")
				throw Exception("Invalid object key.", -1, k ? Format("<Object at 0x{:p}>", &obj) : "<blank>")
			
			if !is_array
				out .= ( ObjGetCapacity([k], 1) ? Jxon_Dump(k) : q . k . q ) ;// key
				    .  ( indent ? ": " : ":" ) ; token + padding
			out .= Jxon_Dump(v, indent, lvl) ; value
			    .  ( indent ? ",`n" . indt : "," ) ; token + indent
		}

		if (out != "")
		{
			out := Trim(out, ",`n" . indent)
			if (indent != "")
				out := "`n" . indt . out . "`n" . SubStr(indt, StrLen(indent)+1)
		}
		
		return is_array ? "[" . out . "]" : "{" . out . "}"
	}

	; Number
	else if (ObjGetCapacity([obj], 1) == "")
		return obj

	; String (null -> not supported by AHK)
	if (obj != "")
	{
		  obj := StrReplace(obj,  "\",    "\\")
		, obj := StrReplace(obj,  "/",    "\/")
		, obj := StrReplace(obj,    q, "\" . q)
		, obj := StrReplace(obj, "`b",    "\b")
		, obj := StrReplace(obj, "`f",    "\f")
		, obj := StrReplace(obj, "`n",    "\n")
		, obj := StrReplace(obj, "`r",    "\r")
		, obj := StrReplace(obj, "`t",    "\t")

		static needle := (A_AhkVersion<"2" ? "O)" : "") . "[^\x20-\x7e]"
		while RegExMatch(obj, needle, m)
			obj := StrReplace(obj, m[0], Format("\u{:04X}", Ord(m[0])))
	}
	
	return q . obj . q
}