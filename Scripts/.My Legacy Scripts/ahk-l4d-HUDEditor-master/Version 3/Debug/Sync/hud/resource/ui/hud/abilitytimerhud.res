"Resource/UI/HUD/AbilityTimerHud.res"
{
	"BackgroundImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"	"BackgroundImage"
		"xpos"		"0"
		"ypos"		"0"
		"wide"		"0"
		"tall"		"0"
		"visible"	"0"
		"enabled"	"0"
		"scaleImage"	"0"
		"zpos"		"0"
	}
	"AbilityImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"	"AbilityImage"
		"xpos"		"6"
		"ypos"		"2"
		"wide"		"60"
		"tall"		"60"
		"visible"	"1"
		"enabled"	"1"
		"scaleImage"	"1"
		"zpos"		"1"
	}
	"Progress"
	{
		"ControlName"	"CircularProgressBar"
		"fieldName"	"Progress"
		"xpos"		"6"
		"ypos"		"2"
		"wide"		"60"
		"tall"		"60"
		"visible"	"1"
		"enabled"	"1"
		"zpos"		"2"
		"fg_image"	"HUD/pz_charge_meter"
		"variable"	"abilityProgress"
		"bgcolor_override"	"0 0 0 0"
	}
}