"Resource/UI/DropDownColorBlind.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"156"
		"tall"					"65"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}
	
	"BtnOn"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnOn"
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
		"navUp"					"BtnOff"
		"navDown"				"BtnCrosshair"
		"labelText"				"#L4D360UI_Enabled"
		"tooltiptext"			"#L4D360UI_Multiplayer_ColorBlind_Tooltip"
		"disabled_tooltiptext" 	"#L4D360UI_Multiplayer_ColorBlind_Tooltip"
		"style"					"FlyoutMenuButton"
		"command"				"ColorBlind2"
		"OnlyActiveUser"		"1"
	}
	
	"BtnCrosshair"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCrosshair"
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
		"navUp"					"BtnOn"
		"navDown"				"BtnOff"
		"labelText"				"#L4D360UI_Multiplayer_ColorBlind_Crosshair"
		"tooltiptext"			"#L4D360UI_Multiplayer_ColorBlind_Crosshair_Tooltip"
		"disabled_tooltiptext" 	"#L4D360UI_Multiplayer_ColorBlind_Crosshair_Tooltip"
		"style"					"FlyoutMenuButton"
		"command"				"ColorBlind1"
		"OnlyActiveUser"		"1"
	}
	
	"BtnOff"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnOff"
		"xpos"					"0"
		"ypos"					"40"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCrosshair"
		"navDown"				"BtnOn"
		"labelText"				"#L4D360UI_Disabled"
		"tooltiptext"			"#L4D360UI_Disabled"
		"disabled_tooltiptext"	"#L4D360UI_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"ColorBlind0"
		"OnlyActiveUser"		"1"
	}
}
