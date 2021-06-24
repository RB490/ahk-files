"Resource/UI/SurvivorListItem.res"
{
	"SurvivorListItem"
	{
		"ControlName"			"EditablePanel"
		"fieldName"				"SurvivorListItem"
		"wide"					"f0"
		"tall"					"28"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
	}

	"ImgReady"
	{
		"ControlName"			"ImagePanel"
		"fieldName"             "ImgReady"
		"xpos"                  "2"
		"ypos"                  "8"
		"zpos"                  "1"
		"wide"                  "12"
		"tall"                  "12"
		"autoResize"            "0"
		"pinCorner"             "0"
		"visible"               "1"
		"enabled"               "1"
		"tabPosition"           "0"
		"scaleImage"			"1"
	}

	"ImgPlayerPortrait"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgPlayerPortrait"
		"xpos"					"40"	[$WIN32]
		"xpos"					"60"	[$X360]
		"ypos"					"0"
		"wide"					"28"
		"tall"					"28"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"scaleImage"			"1"
	}

	"PnlGamerPic" [$WIN32]
	{
		"ControlName"						"ImagePanel"
		"fieldName"						"PnlGamerPic"
		"xpos"							"72"
		"ypos"							"11"
		"wide"							"16"
		"tall"							"16"
		"visible"						"1"
		"bgcolor_override"					"255 255 255 255"
		"scaleImage"						"1"
	}
		
	"LblPlayerVoiceStatus"
	{
		"ControlName"			"Label"
		"fieldName"				"LblPlayerVoiceStatus"
		"xpos"					"20"	[$WIN32]
		"xpos"					"40"	[$X360]
		"ypos"					"10"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"#GameUI_Icons_VOICE_IDLE"
		"font"					"GameUIButtonsTiny"
	}

	"DrpPlayer"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"			"DrpPlayer"
		"xpos"				"91"
		"ypos" 				"12"
		"wide"				"180"	[$WIN32]
		"wide"				"150"	[$X360]
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"			"0"

		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"			"BtnDropButton"
			"xpos"				"0"
			"ypos" 				"0"
			"tall"				"15"
			"wide"				"180"	[$WIN32]
			"wide"				"150"	[$X360]
			"visible"			"0"
			"enabled"			"1"
			"tabPosition"		"0"
			"tooltiptext"		"#L4D_Lobby_PlayerDropDown"
			"style"				"MainMenuSmallButton"
			"command"			"PlayerDropDown"
			"ShowDropDownIndicator"	"1"
		}
	}
	
	"LblEmptySlotAd"
	{
		"ControlName"			"Label"
		"fieldName"				"LblEmptySlotAd"
		"xpos"				"91"
		"ypos" 				"12"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"#L4D360UI_Lobby_EmptySlotAd"
	}
}