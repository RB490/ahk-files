"Resource/UI/Achievements.res"
{
	"Achievements"
	{
		"ControlName"		"Frame"
		"fieldName"		"Achievements"
		
		"xpos"			"0"		[$WIN32]
		"ypos"			"0"		[$WIN32]
		"wide"			"f0"	[$WIN32]
		"tall"			"480"	[$WIN32]
		"xpos"			"c-250" [$X360]
		"ypos"			"c-185" [$X360]
		"wide"			"500"	[$X360]
		"tall"			"400"	[$X360]
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"usetitlesafe"	"1"
	}
	
	"BackgroundImage"	[$WIN32]
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"c-170"
		"zpos"			"0"
		"wide"			"f0"
		"tall"			"345"
		"autoResize"	"1"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"	
		"fillcolor"		"0 0 0 240"
	}
	
	"ProTotalProgress"
	{
		"ControlName"			"ContinuousProgressBar"
		"fieldName"				"ProTotalProgress"
		"xpos"					"10"	[$X360]
		"ypos"					"31"	[$X360]
		"wide"					"480"	[$X360]
		"xpos"					"c-180"	[$WIN32]
		"ypos"					"80"	[$WIN32]
		"wide"					"390"	[$WIN32]
		"zpos"					"1"
		"tall"					"9"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"proportionalToParent"	"1"
	}
	
	"LblComplete"
	{
		"ControlName"		"Label"
		"fieldName"		"LblComplete"
		"xpos"			"15"	[$X360]
		"ypos"			"39"	[$X360]
		"xpos"			"c-180"	[$WIN32]
		"ypos"			"85"	[$WIN32]
		"wide"			"150"
		"zpos"					"1"
		"tall"			"24" [$WIN32]
		"autoResize"		"1"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"proportionalToParent"	"1"
		"textAlignment"		"west"
	}

	"LblGamerscore"
	{
		"ControlName"		"Label"
		"fieldName"		"LblGamerscore"
		"xpos"			"r270"
		"ypos"			"39"
		"wide"			"250"
		"zpos"					"1"
		"autoResize"		"1"
		"pinCorner"		"0"
		"visible"		"1" [$X360]
		"visible"		"0" [$WIN32]
		"enabled"		"1"
		"tabPosition"		"0"
		"proportionalToParent"	"1"
		"textAlignment"		"east"
	}
	
	"Divider1"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"Divider1"
		"xpos"					"c-238"	
		"ypos"					"110"	
		"zpos"					"2"
		"wide"					"450"
		"tall"					"2"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"divider_gradient"
		"scaleImage"			"1"
	}

	"GplAchievements"
	{
		"ControlName"		"GenericPanelList"
		"fieldName"		"GplAchievements"
		"xpos"			"c-226"	
		"ypos"			"110"	
		"wide"			"450"	
		"tall"			"270"	
		"zpos"					"1"
		"autoResize"		"1"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"1"
		"proportionalToParent"	"1"
	}
	
	"Divider2"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"Divider2"
		"xpos"					"c-238"	
		"ypos"					"378"	
		"zpos"					"2"
		"wide"					"450"
		"tall"					"2"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"divider_gradient"
		"scaleImage"			"1"
	}

	"PnlLowerGarnish"
	{
		"ControlName"		"Panel"
		"fieldName"		"PnlLowerGarnish"
		"xpos"			"0"
		"ypos"			"r45"
		"zpos"			"-1"
		"wide"			"f0"
		"tall"			"45"
		"autoResize"		"1"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"proportionalToParent"	"1"
	}

	"BtnCancel" [$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCancel"
		"xpos"					"c-180"
		"ypos"					"390"
		"zpos"					"1"
		"wide"					"250"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_Done"
		"tooltiptext"			"#L4D360UI_Tooltip_Back"
		"style"					"MainMenuButton"
		"command"				"Back"
		"proportionalToParent"	"1"
		"usetitlesafe" 			"0"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"allcaps"				"1"
	}
}
