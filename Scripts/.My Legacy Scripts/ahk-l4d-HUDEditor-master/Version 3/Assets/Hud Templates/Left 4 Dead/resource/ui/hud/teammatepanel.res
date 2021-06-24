// Survivor teammate panel
"Resource/UI/HUD/TeammatePanel.res"
{

	BackgroundImage
	{
		"fieldname"    "BackgroundImage"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "0"
		"ypos"         "0"
		"zpos"         "-1"
		"wide"         "256"
		"tall"         "128"
		"image"        "hud/healthbar_bg_1"
		"scaleImage"   "1"
	}

	Dead
	{
		"fieldname"    "Dead"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "12"
		"ypos"         "9"
		"zpos"         "2"
		"wide"         "96"
		"tall"         "96"
		"scaleImage"   "1"
	}

	Head
	{
		"fieldname"    "Head"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "13"
		"ypos"         "38"
		"wide"         "23"
		"tall"         "23"
		"scaleImage"   "1"
	}

	Health
	{
		"fieldname"    "Health"
		"controlName"  "HealthPanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "37"
		"ypos"         "52"
		"zpos"         "1"
		"wide"         "96"
		"tall"         "7"
	}

	Incapacitated
	{
		"fieldname"    "Incapacitated"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "10"
		"ypos"         "4"
		"zpos"         "2"
		"wide"         "96"
		"tall"         "96"
		"scaleImage"   "1"
	}

	Items
	{
		"fieldname"      "Items"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "39"
		"ypos"           "36"
		"zpos"           "2"
		"wide"           "50"
		"tall"           "14"
		"font"           "L4D_Icons_medium"
		"labelText"      ""
		"textAlignment"  "west"
	}

	Name
	{
		"fieldname"         "Name"
		"controlName"       "Label"
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "13"
		"ypos"              "60"
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
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "64"
		"ypos"              "38"
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
		"controlName"  "Panel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "10"
		"ypos"         "15"
		"zpos"         "3"
		"wide"         "16"
		"tall"         "16"
	}
}
