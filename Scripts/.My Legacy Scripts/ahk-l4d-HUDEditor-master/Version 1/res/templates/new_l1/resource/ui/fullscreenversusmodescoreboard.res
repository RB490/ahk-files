"Resource/UI/FullscreenVersusModeScoreboard.res"
{
	"fullscreen_vs_scoreboard"
	{
		"ControlName"		"CFullscreenVersusModeScoreboard"
		"fieldName"			"fullscreen_vs_scoreboard"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"f0"
		"tall"				"480"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"PaintBackgroundType"	"2"
	}
	
	"CVersusModeScoreboard"
	{
		"ControlName"	"CVersusModeScoreboard"
		"fieldName"		"VersusModeScoreboard"
		"xpos"			"c-177" [$ENGLISH]
		"xpos"			"c-182" [$!ENGLISH]
		"ypos"			"260"
		"wide"			"354" [$ENGLISH]
		"wide"			"364" [$!ENGLISH]
		"tall"			"120"
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
