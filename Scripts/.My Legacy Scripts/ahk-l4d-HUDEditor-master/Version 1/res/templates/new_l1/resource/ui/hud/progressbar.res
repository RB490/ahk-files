"Resource/UI/HUD/ProgressBar.res"
{
	"BarLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"BarLabel"
		"xpos"			"28"
		"ypos"			"1"
		"wide"			"290"
		"tall"			"20" [$OSX]
		"tall"			"12" [$WINDOWS]
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"MenuTitle_DropShadow"
		"fgcolor_override" "White"
	}

	"Bar"
	{
		"ControlName"	"Panel"
		"fieldName"		"Bar"
		"xpos"			"28"
		"ypos"			"15"
		"wide"			"200"
		"tall"			"8"
		"visible"		"1"
		"enabled"		"1"
		
		"border_color"	"255 255 255 255"
		"fill_color"	"255 255 255 255"
		"empty_color"	"0 0 0 0"
		"shadow_color"	"0 0 0 255"
		"gap"			"1"
		"border_thickness"	"1"
		"shadow_thickness"	"1"
	}

	"AwardIcon"
	{
		"ControlName"	"CIconPanel"
		"fieldName"		"AwardIcon"
		"xpos"			"2"
		"ypos"			"0"
		"wide"			"24"
		"tall"			"24"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"icon"			"icon_healing"
	}

	"Subtext"
	{
		"ControlName"	"Label"
		"fieldName"		"Subtext"
		"xpos"			"2"
		"ypos"			"24"
		"wide"			"300"
		"tall"			"30"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"	"north-west"
		"font"			"PlayerDisplayName"
	}
}