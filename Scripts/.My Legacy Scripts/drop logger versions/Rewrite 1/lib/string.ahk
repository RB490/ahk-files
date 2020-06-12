/*
Func: string_getDuplicates
	Compares list and returns strings which exist in specified strings

Parameters:
	input_List1		-	string
	input_List2		-	string

Returns:
	Strings which exist both in specified lists

Examples:
	> 	string1=
		(
		line1
		line3
		line4
		line5
		)
		string2=
		(
		line1
		line2
		line3
		line4
		line55
		)

	> string_getDuplicates(string1, string2)
	=	line1
		line3
		line4
*/
string_getDuplicates(string1, string2) {
	
	loop, parse, string1, `n ; list1
	{
		LoopField := A_LoopField
		
		loop, parse, string2, `n
			If (A_LoopField = LoopField)
				output .= A_LoopField "`n"
	}
	return OutPut
}

/*
Func: string_removeDuplicates
	Removes duplicates from string

Parameters:
	input		-	string

Returns:
	String without duplicates

Examples:
	> mystring=
	(
	thisString1
	thisString1
	thisString2
	)
	
	> string_removeDuplicates(mystring)
	=
		thisString1
		thisString2
*/
string_removeDuplicates(input) {

	OutPut := Input

	Sort, OutPut, U

	return OutPut
}

/*
Func: string_splitTabSpace
	Returns first word from string, split by tab or space

Parameters:
	input		-	string

Returns:
	First word from string, split by tab or space

Examples:
	> string_splitTabSpace("this	text")
	= this
*/
string_splitTabSpace(input) {
	loop, parse, input, `n
	{
		LoopField := A_LoopField
		
		loop, parse, LoopField, %A_Tab%%A_Space%
		{
			OutPut .= A_LoopField "`n"
			break
		}
	}
	return OutPut
}


/*
Func: string_cleanUp
	Removes space, tabs and enters from a string

Parameters:
	input		-	string

Returns:
	Clean string without spaces, tabs or enters

Examples:
	>	myString := " test `n"
		myString := string_cleanUp(myString)
	= test
*/
string_cleanUp(input) {

	StringReplace, Output, input, `r`n`r`n, `r`n, UseErrorLevel
	
	Output := Trim(Output)
	
	return Output
}