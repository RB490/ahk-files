"Resource/UI/HUD/TeammatePanel_Incap.res"
{

	BackgroundImage
	{
		"fieldname"    "BackgroundImage"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "-2"
		"ypos"         "2"
		"zpos"         "-1"
		"wide"         "160"
		"tall"         "80"
		"scaleImage"   "1"
	}

	Health
	{
		"fieldname"                     "Health"
		"controlName"                   "HealthPanel"
		"visible"                       "1"
		"enabled"                       "1"
		"xpos"                          "11"
		"ypos"                          "42"
		"zpos"                          "1"
		"wide"                          "121"
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
		"textAlignment"                 "east"
	}

	Name
	{
		"fieldname"         "Name"
		"controlName"       "Label"
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "11"
		"ypos"              "56"
		"zpos"              "3"
		"wide"              "122"
		"tall"              "12"
		"fgcolor_override"  "White"
		"font"              "PlayerDisplayName"
		"labelText"         ""
		"textAlignment"     "west"
	}

	Voice
	{
		"fieldname"    "Voice"
		"controlName"  "TeamDisplayVoicePanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "21"
		"ypos"         "0"
		"zpos"         "3"
		"wide"         "16"
		"tall"         "16"
		"voice_icon"   "voice_player"
	}
}
