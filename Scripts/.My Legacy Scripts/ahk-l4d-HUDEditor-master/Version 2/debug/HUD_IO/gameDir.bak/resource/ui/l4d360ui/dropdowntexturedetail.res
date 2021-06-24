"Resource/UI/DropDownTextureDetail.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"156"
		"tall"					"85"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}
	
	"BtnVeryHigh"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnVeryHigh"
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
		"navUp"					"BtnLow"
		"navDown"				"BtnHigh"
		"labelText"				"#GameUI_ultra"
		"tooltiptext"			"#GameUI_ultra"
		"disabled_tooltiptext"	"#GameUI_ultra"
		"style"					"FlyoutMenuButton"
		"command"				"TextureDetailVeryHigh"
		"OnlyActiveUser"		"1"
	}

	"BtnHigh"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnHigh"
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
		"navUp"					"BtnVeryHigh"
		"navDown"				"BtnMedium"
		"labelText"				"#GameUI_High"
		"tooltiptext"			"#GameUI_High"
		"disabled_tooltiptext"	"#GameUI_High"
		"style"					"FlyoutMenuButton"
		"command"				"TextureDetailHigh"
		"OnlyActiveUser"		"1"
	}
	
	"BtnMedium"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnMedium"
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
		"navUp"					"BtnHigh"
		"navDown"				"BtnLow"
		"labelText"				"#GameUI_Medium"
		"tooltiptext"			"#GameUI_Medium"
		"disabled_tooltiptext"	"#GameUI_Medium"
		"style"					"FlyoutMenuButton"
		"command"				"TextureDetailMedium"
		"OnlyActiveUser"		"1"
	}
	
	"BtnLow"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnLow"
		"xpos"					"0"
		"ypos"					"60"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnMedium"
		"navDown"				"BtnVeryHigh"
		"labelText"				"#GameUI_Low"
		"tooltiptext"			"#GameUI_Low"
		"disabled_tooltiptext" 	"#GameUI_Low"
		"style"					"FlyoutMenuButton"
		"command"				"TextureDetailLow"
		"OnlyActiveUser"		"1"
	}
}
