
"Resource/UI/BaseChat.res"
{
	"HudChat"
	{
		"ControlName"			"EditablePanel"
		"fieldName" 			"HudChat"
		"visible" 				"1"
		"enabled" 				"1"
		"xpos"					"5"
		"ypos"                  "r315"  [$WIN32]
		"wide"	 				"250"	[$WIN32]
		"tall"	 				"110"
		"usetitlesafe"			"1"
		"bgcolor_override"	"0 0 0 255"
	}
	"HudChatHistory"
	{
		"ControlName"		"RichText"
		"fieldName"			"HudChatHistory"
		"xpos"				"0"	[$WIN32]
		"ypos"				"9"		[$WIN32]
		"wide"	 			"250"	[$WIN32]
		"tall"				"75"	[$WIN32]
		"wrap"				"1"
		"autoResize"		"1"
		"pinCorner"			"1"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"south-west"
		"font"				"ChatFont"
		"maxchars"			"-1"
	}
	ChatInputLine
	{
		"ControlName"			"EditablePanel"
		"fieldName" 			"ChatInputLine"
		"visible" 				"1"
		"enabled" 				"1"
		"xpos"					"1"	[$WIN32]
		"xpos"					"42"	[$X360]
		"ypos"					"395"
		"wide"	 				"249"
		"tall"	 				"2"
	}
	KeyStateLabel
	{
		"ControlName"		"Label"
		"fieldname"			"KeyStateLabel"
		"visible" 			"0"
		"enabled" 			"0"
		"xpos"				"1000"	[$WIN32]
		"xpos"				"42"	[$X360]
		"ypos"				"2"
		"wide"	 			"300"
		"tall"				"12"
		"textAlignment"		"north-west"
	}
	"ChatFiltersButton"
	{
		"ControlName"		"Button"
		"fieldName"			"ChatFiltersButton"
		"xpos"				"225"
		"ypos"				"2"
		"wide"				"45"
		"tall"				"15"
		"autoResize"		"1"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"0"
		"tabPosition"		"0"
		"labelText"			"#chat_filterbutton"
		"textAlignment"		"center"
		"dulltext"			"0"
		"brighttext"		"0"
		"Default"			"0"
	}
}