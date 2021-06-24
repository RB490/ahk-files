// Local player health hud
"Resource/UI/HUD/LocalPlayerPanel.res"
{

	DuckingIcon
	{
		"fieldname"    "DuckingIcon"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "97"
		"ypos"         "32"
		"zpos"         "2"
		"wide"         "25"
		"tall"         "25"
		"image"        "hud/crouch_survivor"
		"scaleImage"   "1"
	}

	Head
	{
		"fieldname"    "Head"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "0"
		"ypos"         "54"
		"wide"         "25"
		"tall"         "25"
		"scaleImage"   "1"
	}

	Health
	{
		"fieldname"    "Health"
		"controlName"  "HealthPanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "26"
		"ypos"         "68"
		"zpos"         "1"
		"wide"         "96"
		"tall"         "10"
	}

	HealthbarTextureBottom
	{
		"fieldname"    "HealthbarTextureBottom"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "26"
		"ypos"         "78"
		"zpos"         "-3"
		"wide"         "80"
		"tall"         "20"
		"image"        "../vgui/hud/detail_scratches_bottom_1"
		"scaleImage"   "1"
	}

	HealthbarTextureTop
	{
		"fieldname"    "HealthbarTextureTop"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "46"
		"ypos"         "44"
		"zpos"         "-3"
		"wide"         "100"
		"tall"         "25"
		"image"        "../vgui/hud/detail_scratches_top_1"
		"scaleImage"   "1"
	}

	HealthIcon
	{
		"fieldname"      "HealthIcon"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "26"
		"ypos"           "48"
		"zpos"           "2"
		"wide"           "70"
		"tall"           "26"
		"font"           "L4D_Icons"
		"labelText"      ","
		"textAlignment"  "west"
	}

	HealthNumber
	{
		"fieldname"      "HealthNumber"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "36"
		"ypos"           "48"
		"zpos"           "2"
		"wide"           "70"
		"tall"           "26"
		"font"           "HUDHealth"
		"labelText"      "%HealthNumber%"
		"textAlignment"  "west"
	}

	Incapacitated
	{
		"fieldname"    "Incapacitated"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "26"
		"ypos"         "17"
		"zpos"         "1"
		"wide"         "96"
		"tall"         "96"
		"scaleImage"   "1"
	}
}
