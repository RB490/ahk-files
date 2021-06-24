"Resource/UI/InGameKickPlayerList.res"
{
	"InGameKickPlayerList"
	{
		"ControlName"			"Frame"
		"fieldName"				"InGameKickPlayerList"
		"xpos"					"c-200" [$ENGLISH]
		"xpos"					"c-225" [!$ENGLISH]
		"ypos"					"c-69"
		"wide"					"400" [$ENGLISH]
		"wide"					"450" [!$ENGLISH]
		"tall"					"137"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"usetitlesafe"			"1"
	}
	
	"Title"
	{
		"ControlName"				"Label"
		"fieldName"					"Title"
		"xpos"						"10"
		"ypos"						"8"
		"wide"						"300" [$ENGLISH]
		"wide"						"430" [!$ENGLISH]
		"tall"						"25"
		"wrap"						"1"
		"autoResize"				"1"
		"pinCorner"					"0"
		"visible"					"1"
		"enabled"					"1"
		"tabPosition"				"0"
		"usetitlesafe"				"0"
		"Font"						"FrameTitle"
		"LabelText"					"#L4D360UI_KickPlayerList_Title"
	}

	"LblDescription"
	{
		"ControlName"				"Label"
		"fieldName"					"LblDescription"
		"xpos"						"15"
		"ypos"						"31"
		"wide"						"f0"
		"tall"						"50"
		"wrap"						"1"
		"autoResize"				"1"
		"pinCorner"					"0"
		"visible"					"1"
		"enabled"					"1"
		"tabPosition"				"0"
		"proportionalToParent"		"1"
		"usetitlesafe"				"0"
		"Font"						"Default"
		"fgcolor_override"          "MediumGray"
		"LabelText"					"#L4D360UI_KickPlayerList_Description"
	}
	
	"LblNoPlayers"
	{
		"ControlName"				"Label"
		"fieldName"					"LblNoPlayers"
		"xpos"						"15"
		"ypos"						"31"
		"wide"						"300" [$ENGLISH]
		"wide"						"420" [!$ENGLISH]
		"tall"						"50"
		"wrap"						"1"
		"autoResize"				"1"
		"pinCorner"					"0"
		"visible"					"0"
		"enabled"					"1"
		"tabPosition"				"0"
		"proportionalToParent"		"1"
		"usetitlesafe"				"0"
		"Font"						"Default"
		"fgcolor_override"          "MediumGray"
		"LabelText"					"#L4D360UI_KickPlayerList_No_eligible_players"
	}

	"BtnPlayer1"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayer1"
		"ypos"					"55"
		"xpos"					"15"
		"wide"					"230"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"1"
		"wrap"					"1"
		"navUp"					"BtnCancel"
		"navDown"				"BtnPlayer2"
		"labelText"				""
		"tooltiptext"			""
		"style"					"MainMenuSmallButton"
		"command"				"KickPlayer1"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"1"
	}
	
	"BtnPlayer2"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayer2"
		"ypos"					"70"
		"xpos"					"15"
		"wide"					"230"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnPlayer1"
		"navDown"				"BtnPlayer3"
		"labelText"				""
		"tooltiptext"			""
		"style"					"MainMenuSmallButton"
		"command"				"KickPlayer2"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"1"
	}
	
	"BtnPlayer3"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnPlayer3"
		"ypos"					"85"
		"xpos"					"15"
		"wide"					"230"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnPlayer2"
		"navDown"				"BtnCancel"
		"labelText"				""
		"tooltiptext"			""
		"style"					"MainMenuSmallButton"
		"command"				"KickPlayer3"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"1"
	}
	
	"BtnCancel"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCancel"
		"ypos"					"110"
		"xpos"					"15"
		"wide"					"230"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnPlayer3"
		"navDown"				"BtnPlayer1"
		"labelText"				"#L4D360UI_Cancel"
		"tooltiptext"			""
		"style"					"MainMenuSmallButton"
		"command"				"Cancel"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"1"
	}
}