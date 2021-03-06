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
		"tall"					"45"
		"visible"				"1"
		"enabled"				"1"
		"paintbackground"		"1"
		"paintborder"			"1"
	}

	"BtnAny"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnAny"
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
		"navUp"					"BtnCampaignCustom"
		"navDown"				"BtnCampaignCustom"
		"labelText"				"#L4D360UI_Campaign_Any"
		"tooltiptext"			"#L4D360UI_Campaign_Tooltip_Any"
		"disabled_tooltiptext"	"#L4D360UI_Campaign_Tooltip_Any_Disabled"
		"style"					"FlyoutMenuButton"
		"command"				"cmd_campaign_"
	}

	"BtnCampaignCustom"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCampaignCustom"
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
		"navUp"					"BtnAny"
		"navDown"				"BtnAny"
		"labelText"				"#L4D360UI_Campaign_Select"
		"tooltiptext"			""
		"disabled_tooltiptext"	""
		"style"					"FlyoutMenuButton"
		"command"				"cmd_addoncampaign"
	}
}