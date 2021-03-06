
"Resource/UI/HUD/HudSurvivalTimer.res"
{
	"SurvivalTimerBackgroundImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"SurvivalTimerBackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"440"
		"tall"			"100"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"image"			"hud/SurvivalTimerBackground"
		"zpos"			"-2"
	}
	"CurrentTimeBackground"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"CurrentTimeBackground"
		"xpos"			"2"
		"ypos"			"29"
		"wide"			"180"
		"tall"			"42"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgMidGrey_glow"
		"zpos"			"-1"
		"src_corner_height"		"16"
		"src_corner_width"		"16"
		"draw_corner_width"		"8"
		"draw_corner_height" 	"8"
	}
	"SurvivalTargetTimeBackgroundImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"SurvivalTargetTimeBackgroundImage"
		"xpos"			"180"
		"ypos"			"29"
		"wide"			"257"
		"tall"			"42"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgMidGrey_glow"
		"zpos"			"-1"
		"src_corner_height"		"16"
		"src_corner_width"		"16"
		"draw_corner_width"		"8"
		"draw_corner_height" 	"8"
	}
	"CurrentTimeDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"CurrentTimeDigits"
		"xpos"			"154"
		"ypos"			"32"
		"wide"			"250"
		"tall"			"50"
		"visible"		"1"
		"labelText"		"07:89.00"
		"textAlignment"	"west"
		"font"			"ink_shadow_40"
	}
	"Timer"
	{
		"ControlName"	"CircularProgressBar"
		"fieldName"		"Timer"
		"xpos"			"194"
		"ypos"			"69"
		"wide"			"11"
		"tall"			"11"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"bg_image"			"hud\survivalTimerClock"
		"fg_image"			"hud\survivalTimerClockFace"
	}
	"GoalImage"
	{
		"ControlName"	"CIconPanel"
		"fieldName"		"GoalImage"
		"xpos"			"530"
		"ypos"			"52"	[$WIN32]
		"wide"			"16"
		"tall"			"16"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"icon"			"icon_bronze_medal_small"
	}
	"TargetTimeDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"TargetTimeDigits"
		"xpos"			"44"
		"ypos"			"60"
		"zpos"			"1"
		"wide"			"150"
		"tall"			"28"
		"visible"		"1"
		"labelText"		"00:00.00"
		"textAlignment"	"east"
		"font"			"ink_shadow_10"
	}
	"TargetTransition"
	{
		"ControlName"	"Label"
		"fieldName"		"TargetTransition"
		"xpos"			"250"
		"ypos"			"35"
		"wide"			"160"
		"tall"			"12"
		"visible"		"0"
		"alpha"			"0"
		"labelText"		"00:00.00"
		"textAlignment"	"west"
		"font"			"ink_shadow_15"
	}
	"NextGoalDescriptor"
	{
		"ControlName"	"Label"
		"fieldName"		"NextGoalDescriptor"
		"xpos"			"205"
		"ypos"			"68"
		"wide"			"86"
		"tall"			"12"
		"visible"		"1"
		"labelText"		"WWWWWWWWWWWWWWW's Migliore"
		"textAlignment"	"west"
		"font"			"ink_shadow_10"
	}
	"AwesomeLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"AwesomeLabel"
		"xpos"			"99999"
		"ypos"			"62"
		"wide"			"200"
		"tall"			"12"
		"alpha"			"0"
		"visible"		"0"
		"labelText"		"#L4D_SurvivalTimer_Description_KeepGoing"
		"textAlignment"	"center"
		"font"			"ink_shadow_15"
	}
}