"Resource/UI/MutationSoloFlyout.res"
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

	"BtnMutation1"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnMutation1"
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
		"navUp"					"BtnMutation17"
		"navDown"				"BtnMutation17"
		"labelText"				"#L4D360UI_Mode_mutation1"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"ChangeMutation_mutation1"
	}

	"BtnMutation17"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnMutation17"
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
		"navUp"					"BtnMutation1"
		"navDown"				"BtnMutation1"
		"labelText"				"#L4D360UI_Mode_mutation17"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"ChangeMutation_mutation17"
	}
}