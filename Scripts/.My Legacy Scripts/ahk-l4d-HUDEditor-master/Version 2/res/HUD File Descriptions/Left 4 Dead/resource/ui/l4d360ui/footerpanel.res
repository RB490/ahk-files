"Resource/UI/FooterPanel.res"
{
	"FooterPanel"
	{
		"ControlName"			"Frame"
		"fieldName"				"FooterPanel"
		"xpos"					"0"
		"ypos"					"r100"	[$X360]
		"ypos"					"r50"	[$WIN32]
		"wide"					"f0"
		"tall"					"70"	[$X360]
		"tall"					"40"	[$WIN32]
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
	}
	
	"LblHelpText"
	{
		"ControlName"			"Label"
		"fieldName"				"LblHelpText"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"500"
		"tall"					"30"
		"wrap"					"1"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				""
		"textAlignment"			"north"
		"Font"					"DefaultMedium"
		"fgcolor_override"		"255 255 255 255"	[$X360]
		"fgcolor_override"		"128 128 128 255"	[$WIN32]
	}
	
	"ImageCloud"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"ImageCloud"
		"xpos"				"c-180"
		"ypos"				"25"
		"wide"				"32"
		"tall"				"32"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleImage"		"1"
		"image"				"resource/icon_cloud"
		"barCount"			"19"
		"barSpacing"		"8"
	}
	
	"UsesCloudLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"UsesCloudLabel"
		"xpos"				"c-150"
		"ypos"				"25"
		"wide"				"400"
		"tall"				"15"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"#L4D360UI_Cloud_Enabled_Tip3"
		"font"				"DefaultVerySmall"
		"dulltext"			"1"
		"brighttext"		"0"
		"fgcolor_override"	"128 128 128 255"
	}
}