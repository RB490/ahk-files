"Resource/UI/HUD/TeammatePanel.res"
{
	"BackgroundImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"256"
		"tall"			"128"
		"zpos"			"-1"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"hud/healthbar_bg_1"
	}

	"Voice"
	{
		"ControlName"	"Panel"
		"fieldName"		"Voice"
		"xpos"			"10"
		"ypos"			"15"
		"wide"			"16"
		"tall"			"16"
		"visible"		"0"
		"enabled"		"1"
		"zpos"			"3"
	}

	"Head"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"Head"
		"xpos"			"13"
		"ypos"			"38"
		"wide"			"23"
		"tall"			"23"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
	}

	"Incapacitated"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"Incapacitated"
		"xpos"			"10"
		"ypos"			"4"
		"wide"			"96"
		"tall"			"96"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"zpos"			"2"
	}
	
	"Dead"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"Dead"
		"xpos"			"12"
		"ypos"			"9"
		"wide"			"96"
		"tall"			"96"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"zpos"			"2"
	}

	"Health"
	{
		"ControlName"	"HealthPanel"
		"fieldName"		"Health"
		"xpos"			"37"
		"ypos"			"52"
		"wide"			"96"
		"tall"			"7"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"1"
	}

	"Name"
	{
		"ControlName"	"Label"
		"fieldName"		"Name"
		"xpos"			"13"
		"ypos"			"60"
		"wide"			"120"
		"tall"			"12"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"	"west"
		"font"			"PlayerDisplayName"
		"zpos"			"3"
		"fgcolor_override" "White"
	}
	
	"Status"
	{
		"ControlName"	"Label"
		"fieldName"		"Status"
		"xpos"			"64"
		"ypos"			"38"
		"wide"			"70"
		"tall"			"12"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"	"east"
		"font"			"PlayerDisplayName"
		"zpos"			"3"
		"fgcolor_override" "White"
	}

	"Items"
	{
		"ControlName"	"Label"
		"fieldName"		"Items"
		"xpos"			"39"
		"ypos"          "36"
		"wide"			"50"
		"tall"			"14"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"	"west"
		"font"			"L4D_Icons_medium"
		"zpos"			"2"
	}
}