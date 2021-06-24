"Resource/UI/DropDownFiltering.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"156"
		"tall"					"125"	[!$OSX]
		"tall"					"105"	[$OSX]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnBilinear"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBilinear"
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
		"navUp"					"BtnAnisotropic16X"		[!$OSX]
		"navUp"					"BtnAnisotropic8X"		[$OSX]
		"navDown"				"BtnTrilinear"
		"labelText"				"#GameUI_Bilinear"
		"tooltiptext"			"#GameUI_Bilinear"
		"disabled_tooltiptext"	"#GameUI_Bilinear"
		"style"					"FlyoutMenuButton"
		"command"				"#GameUI_Bilinear"
		"OnlyActiveUser"		"1"
	}
	
	"BtnTrilinear"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnTrilinear"
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
		"navUp"					"BtnBilinear"
		"navDown"				"BtnAnisotropic2X"
		"labelText"				"#GameUI_Trilinear"
		"tooltiptext"			"#GameUI_Trilinear"
		"disabled_tooltiptext"	"#GameUI_Trilinear"
		"style"					"FlyoutMenuButton"
		"command"				"#GameUI_Trilinear"
		"OnlyActiveUser"		"1"
	}
	
	"BtnAnisotropic2X"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAnisotropic2X"
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
		"navUp"					"BtnTrilinear"
		"navDown"				"BtnAnisotropic4X"
		"labelText"				"#GameUI_Anisotropic2X"
		"tooltiptext"			"#GameUI_Anisotropic2X"
		"disabled_tooltiptext" 	"#GameUI_Anisotropic2X"
		"style"					"FlyoutMenuButton"
		"command"				"#GameUI_Anisotropic2X"
		"OnlyActiveUser"		"1"
	}
	
	"BtnAnisotropic4X"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAnisotropic4X"
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
		"navUp"					"BtnAnisotropic2X"
		"navDown"				"BtnAnisotropic8X"
		"labelText"				"#GameUI_Anisotropic4X"
		"tooltiptext"			"#GameUI_Anisotropic4X"
		"disabled_tooltiptext" 	"#GameUI_Anisotropic4X"
		"style"					"FlyoutMenuButton"
		"command"				"#GameUI_Anisotropic4X"
		"OnlyActiveUser"		"1"
	}
	
	"BtnAnisotropic8X"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAnisotropic8X"
		"xpos"					"0"
		"ypos"					"80"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnAnisotropic4X"
		"navDown"				"BtnAnisotropic16X"		[!$OSX]
		"navDown"				"BtnBilinear"			[$OSX]
		"labelText"				"#GameUI_Anisotropic8X"
		"tooltiptext"			"#GameUI_Anisotropic8X"
		"disabled_tooltiptext" 	"#GameUI_Anisotropic8X"
		"style"					"FlyoutMenuButton"
		"command"				"#GameUI_Anisotropic8X"
		"OnlyActiveUser"		"1"
	}

	"BtnAnisotropic16X"		[!$OSX]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAnisotropic16X"
		"xpos"					"0"
		"ypos"					"100"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnAnisotropic8X"
		"navDown"				"BtnBilinear"
		"labelText"				"#GameUI_Anisotropic16X"
		"tooltiptext"			"#GameUI_Anisotropic16X"
		"disabled_tooltiptext" 	"#GameUI_Anisotropic16X"
		"style"					"FlyoutMenuButton"
		"command"				"#GameUI_Anisotropic16X"
		"OnlyActiveUser"		"1"
	}
}
