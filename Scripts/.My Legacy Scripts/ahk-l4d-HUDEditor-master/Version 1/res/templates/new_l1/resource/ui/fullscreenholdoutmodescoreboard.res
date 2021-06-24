"Resource/UI/FullscreenHoldoutModeScoreboard.res"
{
	"fullscreen_holdout_scoreboard"
	{
		"ControlName"		"CFullscreenHoldoutModeScoreboard"
		"fieldName"			"fullscreen_holdout_scoreboard"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"f0"
		"tall"				"480"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"PaintBackgroundType"	"2"
	}
	
	"ImgBackground"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgBackground"
		"xpos"					"0"
		"ypos"					"115"
		"zpos"					"-1"
		"wide"					"f0"
		"tall"					"180"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"fillColor"				"0 0 0 230"
	} 

	"CHoldoutModeScoreboard"
	{
		"ControlName"	"CHoldoutModeScoreboard"
		"fieldName"		"HoldoutModeScoreboard"
		"xpos"			"c-250"
		"ypos"			"115"	[$WIN32]
		"ypos"			"120"	[$X360]
		"wide"			"500"
		"tall"			"260"
		"visible"		"1"
		"enabled"		"1"
		
		"if_split_screen_active"
 		{
			"ypos"		"180"
  		}
  		
  		"if_split_screen_vertical"
  		{
  			"ypos"			"260"
  		}
	}
}
