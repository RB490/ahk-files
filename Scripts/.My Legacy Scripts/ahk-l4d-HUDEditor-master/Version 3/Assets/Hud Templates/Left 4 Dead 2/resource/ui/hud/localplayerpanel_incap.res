"Resource/UI/HUD/LocalPlayerPanel_Incap.res"
{

	BackgroundImage
	{
		"fieldname"    "BackgroundImage"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "-2"
		"ypos"         "16"
		"zpos"         "-1"
		"wide"         "150"
		"tall"         "75"
		"scaleImage"   "1"
	}

	Dead
	{
		"fieldname"    "Dead"
		"controlName"  "ImagePanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "20"
		"ypos"         "28"
		"zpos"         "3"
		"wide"         "256"
		"tall"         "128"
		"image"        "hud/overlay_dead"
		"scaleImage"   "1"
	}

	Head
	{
		"fieldname"    "Head"
		"controlName"  "ImagePanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "7"
		"ypos"         "36"
		"wide"         "35"
		"tall"         "35"
		"scaleImage"   "1"
	}

	Health
	{
		"fieldname"                     "Health"
		"controlName"                   "HealthPanel"
		"visible"                       "1"
		"enabled"                       "1"
		"xpos"                          "11"
		"ypos"                          "54"
		"zpos"                          "1"
		"wide"                          "113"
		"tall"                          "12"
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
		"xpos"           "12"
		"ypos"           "60"
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
		"xpos"           "23"
		"ypos"           "60"
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
		"xpos"         "30"
		"ypos"         "0"
		"zpos"         "3"
		"wide"         "50"
		"tall"         "50"
		"voice_icon"   "voice_self"
	}
}
