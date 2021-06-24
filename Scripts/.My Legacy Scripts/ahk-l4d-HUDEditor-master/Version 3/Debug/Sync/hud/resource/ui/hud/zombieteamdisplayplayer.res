"Resource/UI/HUD/ZombieTeamDisplayPlayer.res"
{
	"BackgroundImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"	"BackgroundImage"
		"xpos"		"4"
		"ypos"		"3"
		"wide"		"149"
		"tall"		"76"
		"zpos"		"-1"
		"visible"	"1"
		"enabled"	"1"
		"scaleImage"	"1"
		"image"		"hud/pz_healthbar_250"
	}
	"ZombieTeamDisplayPlayer"
	{
		"ControlName"	"Panel"
		"fieldName"	"ZombieTeamDisplayPlayer"
		"wide"		"150"
		"tall"		"100"
		"visible"	"1"
		"enabled"	"1"
	}
	"NameLabel"
	{
		"ControlName"	"Label"
		"fieldName"	"NameLabel"
		"xpos"		"37"
		"ypos"		"63"
		"wide"		"84"
		"tall"		"12"
		"visible"	"1"
		"enabled"	"1"
		"textAlignment"	"west"
		"font"		"ink_11"
		"zpos"		"3"
		"fgcolor_override" "255 255 255 255"
	}
	"SpawnTimeLabel"
	{
		"ControlName"	"Label"
		"fieldName"	"SpawnTimeLabel"
		"xpos"		"63"
		"ypos"		"23"
		"wide"		"30"
		"tall"		"12"
		"zpos"		"1"
		"visible"	"1"
		"enabled"	"1"
		"textAlignment"	"center"
		"font"		"ink_20"
		"zpos"		"3"
		"fgcolor_override" "255 255 255 255"
	}
	"HealthPanel"
	{
		"ControlName"	"HealthPanel"
		"fieldName"	"HealthPanel"
		"xpos"		"35"
		"ypos"		"52"
		"wide"		"88"
		"tall"		"13"
		"visible"	"1"
		"enabled"	"1"
		"zpos"		"1"
	}
	"Dead"
	{
		"ControlName"	"ImagePanel"
		"fieldName"	"Dead"
		"xpos"		"5"
		"ypos"		"28"
		"wide"		"256"
		"tall"		"0"
		"zpos"		"3"
		"visible"	"1"
		"enabled"	"1"
		"scaleImage"	"1"
		"image"		"hud/overlay_dead"
	}
	"SkullIconPlacement"
	{
		"ControlName"	"Panel"
		"fieldName"	"SkullIconPlacement"
		"xpos"		"64"
		"ypos"		"15"
		"wide"		"28"
		"tall"		"28"
		"visible"	"1"
		"enabled"	"1"
	}
	"PlayerImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"	"PlayerImage"
		"xpos"		"65"
		"ypos"		"13"
		"wide"		"28"
		"tall"		"29"
		"visible"	"1"
		"enabled"	"1"
		"zpos"		"3"
		"fgcolor_override" "255 255 255 255"
	}
	"Voice"
	{
		"ControlName"	"Panel"
		"fieldName"	"Voice"
		"xpos"		"33"
		"ypos"		"33"
		"wide"		"16"
		"tall"		"16"
		"visible"	"0"
		"enabled"	"1"
		"zpos"		"3"
		"voice_icon"	"voice_player"
	}
	"AbilityProgress"
	{
		"ControlName"	"CircularProgressBar"
		"fieldName"	"AbilityProgress"
		"xpos"		"58"
		"ypos"		"7"
		"wide"		"42"
		"tall"		"43"
		"visible"	"1"
		"enabled"	"1"
		"zpos"		"2"
		"fg_image"	"HUD/PZ_charge_meter"
		"bgcolor_override"	"0 0 0 0"
		"progress"	"0.75"
	}
}