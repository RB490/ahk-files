"Resource/UI/DropDownMission.res"
{
	"PnlBackground"
	{
		"ControlName"			"Panel"
		"fieldName"				"PnlBackground"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"-1"
		"wide"					"156"
		"tall"					"105" [$X360]
		"tall"					"125" [$WIN32]
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnCampaign1"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaign1"
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
		"navUp"					"BtnCampaign5" [$X360]
		"navUp"					"BtnCampaignCustom" [$WIN32]
		"navDown"				"BtnCampaign2"
		"labelText"				"TEXT"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_addoncampaign"
	}	
}