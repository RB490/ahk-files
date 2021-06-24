"Resource/UI/HUD/LocalPlayerPanel.res"
{
	"Head"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"Head"
		"xpos"			"0"
		"ypos"			"54"
		"wide"			"25"
		"tall"			"25"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
	}
	
	"DuckingIcon"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"DuckingIcon"
		"xpos"			"97"
		"ypos"			"32"
		"wide"			"25"
		"tall"			"25"
		"zpos"			"2"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"hud/crouch_survivor"
	}

	"Incapacitated"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"Incapacitated"
		"xpos"			"26"
		"ypos"			"17"
		"wide"			"96"
		"tall"			"96"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"zpos"			"1"
	}
	
	"Health"
	{
		"ControlName"	"HealthPanel"
		"fieldName"		"Health"
		"xpos"			"26"
		"ypos"			"68"
		"wide"			"96"
		"tall"			"10"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"1"
	}
    "HealthbarTextureTop"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HealthbarTextureTop"
		"xpos"			"46"
		"ypos"			"44"
		"wide"			"100"
		"tall"			"25"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/detail_scratches_top_1"
		"zpos"			"-3"
	}
	"HealthbarTextureBottom"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HealthbarTextureBottom"
		"xpos"			"26"
		"ypos"			"78"
		"wide"			"80"
		"tall"			"20"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/detail_scratches_bottom_1"
		"zpos"			"-3"
	}
	"HealthIcon"
	{
		"ControlName"	"Label"
		"fieldName"		"HealthIcon"
		"xpos"			"26"
		"ypos"			"48"
		"wide"			"70"
		"tall"			"26"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		","
		"textAlignment"	"west"
		"font"			"L4D_Icons"
		"zpos"			"2"
	}

	"HealthNumber"
	{
		"ControlName"	"Label"
		"fieldName"		"HealthNumber"
		"xpos"			"39" [$OSX]
		"xpos"			"36" [$WINDOWS]
		"ypos"			"48"
		"wide"			"70"
		"tall"			"26"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%HealthNumber%"
		"textAlignment"	"west"
		"font"			"HUDHealth"
		"zpos"			"2"
	}
}