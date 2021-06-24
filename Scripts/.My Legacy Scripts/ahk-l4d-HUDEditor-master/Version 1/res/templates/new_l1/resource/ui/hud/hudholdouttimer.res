"Resource/UI/HUD/HudHoldoutTimer.res"
{	
	"HoldoutTimerBackgroundImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HoldoutTimerBackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"440"
		"tall"			"100"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"hud/HoldoutTimerBackground"
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
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgMidGrey_glow"
		"zpos"			"-1"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
	}

	"CurrentTimeDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"CurrentTimeDigits"
		"xpos"			"25"
		"ypos"			"34" [$OSX]
		"ypos"			"36" [$WINDOWS]
		"zpos"			"1"
		"wide"			"150"
		"tall"			"44" [$OSX]
		"tall"			"28" [$WINDOWS]
		"visible"		"1"
		"labelText"		"07:89.00"
		"textAlignment"	"west"
		"font"			"HoldoutNumbers"
	}

	"Timer"
	{
		"ControlName"	"CircularProgressBar"
		"fieldName"		"Timer"
		"xpos"			"172"
		"ypos"			"20"
		"wide"			"58"
		"tall"			"58"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"bg_image"			"hud\holdoutTimerClock"
		"fg_image"			"hud\holdoutTimerClockFace"
	}

	"HoldoutTargetTimeBackgroundImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"HoldoutTargetTimeBackgroundImage"
		"xpos"			"180"
		"ypos"			"29"
		"wide"			"257"
		"tall"			"42"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgMidGrey_glow"
		"zpos"			"-1"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
	}

	"GoalImage"
	{
		"ControlName"	"CIconPanel"
		"fieldName"		"GoalImage"
		"xpos"			"224"
		"ypos"			"52"	[$WIN32]
		"ypos"			"51"	[$X360]
		"wide"			"16"
		"tall"			"16"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"icon"			"icon_bronze_medal_small"
	}
	
	"TargetTimeDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"TargetTimeDigits"
		"xpos"			"225"
		"ypos"			"33"	[$WIN32]
		"ypos"			"33"	[$X360]
		"wide"			"150"
		"tall"			"40" [$OSX]
		"tall"			"24" [$WINDOWS]
		"visible"		"1"
		"labelText"		"00:00.00"
		"textAlignment"	"west"
		"font"			"HudNumbers"
	}

	"TargetTransition"
	{
		"ControlName"	"Label"
		"fieldName"		"TargetTransition"
		"xpos"			"250"
		"ypos"			"35"
		"wide"			"60"
		"tall"			"12"
		"visible"		"1"
		"alpha"			"0"
		"labelText"		"00:00.00"
		"textAlignment"	"west"
		"font"			"HudNumbers"
	}
	
	"NextGoalDescriptor"
	{
		"ControlName"	"Label"
		"fieldName"		"NextGoalDescriptor"
		"xpos"			"241"
		"ypos"			"54"
		"wide"			"200"
		"tall"			"12"
		"visible"		"1"
		"labelText"		"WWWWWWWWWWWWWWW's Migliore"
//		"labelText"		"Gold Standard"
		"textAlignment"	"west"
		"font"			"PlayerDisplayName"
	}

	"AwesomeLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"AwesomeLabel"
		"xpos"			"120"
		"ypos"			"62"
		"wide"			"200"
		"tall"			"12"
		"alpha"			"0"
		"visible"		"1"
		"labelText"		"#L4D_HoldoutTimer_Description_KeepGoing"
		"textAlignment"	"center"
		"font"			"PlayerDisplayHealth"
	}
}
