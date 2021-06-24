// Local player health hud
"Resource/UI/HUD/LocalPlayerPanel.res"
{

	BackgroundImage
	{
		"fieldname"    "BackgroundImage"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "0"
		"ypos"         "25"
		"zpos"         "-1"
		"wide"         "220"
		"tall"         "55"
		"drawColor"    "80 76 82 255"
		"image"        "hud/healthbar_bg_player"
		"scaleImage"   "1"
	}

	Dead
	{
		"fieldname"    "Dead"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "20"
		"ypos"         "28"
		"zpos"         "3"
		"wide"         "256"
		"tall"         "128"
		"image"        "hud/overlay_dead"
		"scaleImage"   "1"
	}

	DuckingIcon
	{
		"fieldname"    "DuckingIcon"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "129"
		"ypos"         "29"
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
		"xpos"         "7"
		"ypos"         "36"
		"wide"         "36"
		"tall"         "35"
		"scaleImage"   "1"
	}

	Health
	{
		"fieldname"                     "Health"
		"controlName"                   "HealthPanel"
		"visible"                       "1"
		"enabled"                       "1"
		"xpos"                          "44"
		"ypos"                          "56"
		"zpos"                          "1"
		"wide"                          "111"
		"tall"                          "17"
		"healthbar_image_grey"          "vgui/hud/healthbar_withglow_white"
		"healthbar_image_grey_ticks"    "vgui/hud/healthbar_ticks_withglow_white"
		"healthbar_image_high"          "vgui/hud/healthbar_withglow_green"
		"healthbar_image_high_ticks"    "vgui/hud/healthbar_ticks_withglow_green"
		"healthbar_image_low"           "vgui/hud/healthbar_withglow_red"
		"healthbar_image_low_ticks"     "vgui/hud/healthbar_ticks_withglow_red"
		"healthbar_image_medium"        "vgui/hud/healthbar_withglow_orange"
		"healthbar_image_medium_ticks"  "vgui/hud/healthbar_ticks_withglow_orange"
		"new_material_style"            "1"
	}

	HealthIcon
	{
		"fieldname"      "HealthIcon"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "46"
		"ypos"           "31"
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
		"xpos"           "60"
		"ypos"           "32"
		"zpos"           "2"
		"wide"           "70"
		"tall"           "26"
		"font"           "HUDHealth"
		"labelText"      "%HealthNumber%"
		"textAlignment"  "west"
	}

	Voice
	{
		"fieldname"    "Voice"
		"controlName"  "TeamDisplayVoicePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "28"
		"ypos"         "12"
		"zpos"         "3"
		"wide"         "50"
		"tall"         "50"
		"voice_icon"   "voice_self"
	}
}
