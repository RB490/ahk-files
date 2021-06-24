// Survivor teammate panel
"Resource/UI/HUD/TeammatePanel.res"
{

	BackgroundImage
	{
		"fieldname"    "BackgroundImage"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "-2"
		"ypos"         "11"
		"zpos"         "-1"
		"wide"         "140"
		"tall"         "68"
		"drawColor"    "80 76 82 255"
		"image"        "hud/healthbar_bg_1"
		"scaleImage"   "1"
	}

	Dead
	{
		"fieldname"    "Dead"
		"controlName"  "ImagePanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "0"
		"ypos"         "18"
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
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "3"
		"ypos"         "18"
		"wide"         "34"
		"tall"         "34"
		"scaleImage"   "1"
	}

	Health
	{
		"fieldname"                     "Health"
		"controlName"                   "HealthPanel"
		"visible"                       "1"
		"enabled"                       "1"
		"xpos"                          "39"
		"ypos"                          "41"
		"zpos"                          "1"
		"wide"                          "93"
		"tall"                          "13"
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

	IconForSlot_First_Aid
	{
		"fieldname"    "IconForSlot_First_Aid"
		"controlName"  "CIconPanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "98"
		"ypos"         "24"
		"zpos"         "2"
		"wide"         "14"
		"tall"         "14"
		"icon"         "icon_equip_medkit_small"
		"scaleImage"   "1"
	}

	IconForSlot_Grenade
	{
		"fieldname"    "IconForSlot_Grenade"
		"controlName"  "CIconPanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "84"
		"ypos"         "24"
		"zpos"         "2"
		"wide"         "14"
		"tall"         "14"
		"icon"         "icon_equip_pipebomb_small"
		"scaleImage"   "1"
	}

	IconForSlot_Pills
	{
		"fieldname"    "IconForSlot_Pills"
		"controlName"  "CIconPanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "112"
		"ypos"         "24"
		"zpos"         "2"
		"wide"         "14"
		"tall"         "14"
		"icon"         "icon_equip_pills_small"
		"scaleImage"   "1"
	}

	Name
	{
		"fieldname"         "Name"
		"controlName"       "Label"
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "13"
		"ypos"              "55"
		"zpos"              "3"
		"wide"              "120"
		"tall"              "12"
		"fgcolor_override"  "White"
		"font"              "PlayerDisplayName"
		"labelText"         ""
		"textAlignment"     "west"
	}

	Status
	{
		"fieldname"         "Status"
		"controlName"       "Label"
		"visible"           "0"
		"enabled"           "1"
		"xpos"              "64"
		"ypos"              "55"
		"zpos"              "3"
		"wide"              "70"
		"tall"              "12"
		"fgcolor_override"  "White"
		"font"              "PlayerDisplayName"
		"labelText"         ""
		"textAlignment"     "east"
	}

	Voice
	{
		"fieldname"    "Voice"
		"controlName"  "TeamDisplayVoicePanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "26"
		"ypos"         "3"
		"zpos"         "3"
		"wide"         "16"
		"tall"         "16"
		"voice_icon"   "voice_player"
	}
}
