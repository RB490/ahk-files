/*
Func: StringBetween
    Retrieves string between two characters, or from first found character until end of line

Parameters:
	String			-	String to retrieve substring from
	NeedleStart		-	First character
	NeedleEnd		-	Second character

Returns:
	String between NeedleStart and NeedleEnd, or until end of line if NeedleEnd is not specified

Examples:
	> myString := "The quick brown -fox jumps over- the lazy dog"
    > msgbox % StringBetween( myString, "-", "-" )
	=	fox jumps over
*/
StringBetween( String, NeedleStart, NeedleEnd="" ) {

    StringGetPos, pos, String, % NeedleStart

    If ( ErrorLevel )

         Return ""

    StringTrimLeft, String, String, pos + StrLen( NeedleStart )

    If ( NeedleEnd = "" )

        Return String

    StringGetPos, pos, String, % NeedleEnd

    If ( ErrorLevel )

        Return ""

    StringLeft, String, String, pos

    Return String

}