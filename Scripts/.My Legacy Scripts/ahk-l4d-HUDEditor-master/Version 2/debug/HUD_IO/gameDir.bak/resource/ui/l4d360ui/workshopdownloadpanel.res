"Resource/UI/WorkshopDownloadPanel.res"
{
	"WorkshopDownloadPanel"
	{
		"ControlName"			"Frame"
		"fieldName"				"WorkshopDownloadPanel"
		"xpos"					"c90" [$WIN32 && !$WIN32WIDE]
		"xpos"					"c200" [$WIN32 && $WIN32WIDE]
		"ypos"					"0"	[$WIN32]
		"wide"					"200"
		"tall"					"80"	[$WIN32]
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"zpos"					"100"
	}
	
	"DownloadLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"DownloadLabel"
		"xpos"				"0"
		"ypos"				"25"
		"wide"				"200"
		"tall"				"15"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			""
		"font"				"Default"
		"dulltext"			"1"
		"brighttext"		"0"
		"textAlignment" "center"
	}

	"DownloadFileLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"DownloadFileLabel"
		"xpos"				"0"
		"ypos"				"38"
		"wide"				"200"
		"tall"				"15"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			""
		"font"				"Default"
		"dulltext"			"1"
		"brighttext"		"0"
		"textAlignment" "center"
	}

	"DownloadProgress"
	{
		"ControlName"			"ContinuousProgressBar"
		"fieldName"				"DownloadProgress"
		"xpos"					"25" [$WIN32]
		"ypos"					"55"
		"wide"					"150" [$WIN32]
		"tall"					"10" [$WIN32]
		"zpos"					"5"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
	}
}