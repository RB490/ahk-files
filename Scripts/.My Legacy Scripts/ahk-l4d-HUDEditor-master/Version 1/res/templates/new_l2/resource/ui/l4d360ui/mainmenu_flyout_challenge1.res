"Resource/UI/SoloFlyout.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"180" [$ENGLISH]
		"wide"					"270" [!$ENGLISH]
		"tall"					"45"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnStartGame"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnStartGame"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnChangeMutation"
		"navDown"				"BtnChangeMutation"
		"labelText"				"#GameUI_StartGame"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"SoloPlay_Challenge"
	}

	"BtnChangeMutation"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnChangeMutation"
		"xpos"					"0"
		"ypos"					"20"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnStartGame"
		"navDown"				"BtnStartGame"
		"labelText"				"#L4D360UI_MainMenu_ChangeMutation"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"ChooseChallengeMode"
	}
}