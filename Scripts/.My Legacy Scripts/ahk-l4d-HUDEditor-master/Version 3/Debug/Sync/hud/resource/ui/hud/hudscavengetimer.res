
"Resource/UI/HUD/HudScavengeTimer.res"
{
	"CurrentTimeBackground"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"CurrentTimeBackground"
		"xpos"			"40"
		"ypos"			"20"
		"wide"			"150"
		"tall"			"30"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack50_outlineGrey"
		"drawcolor"		"255 255 255 255"
		"src_corner_height"		"16"
		"src_corner_width"		"16"
		"draw_corner_width"		"3"
		"draw_corner_height" 	"3"
	}
	"CurrentTimeBackgroundFill"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"CurrentTimeBackgroundFill"
		"xpos"			"72"
		"ypos"			"20"
		"wide"			"118"
		"tall"			"30"
		"scaleImage"		"1"
		"visible"			"0"
		"enabled"			"1"
		"fillcolor" 		"0 0 0 220"
		"zpos"				"-2"
	}
	"CurrentTimeBackgroundOverlay"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"CurrentTimeBackgroundOverlay"
		"xpos"			"165"
		"ypos"			"0"
		"zpos"			"1"
		"wide"			"110"
		"tall"			"27"
		"visible"		"1"
		"enabled"		"1"
		"alpha"			"0"
		"bgcolor_override"	"255 0 0 255"
		"zpos"			"10"
	}
	"CurrentScavengeTimeDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"CurrentScavengeTimeDigits"
		"xpos"			"154"
		"ypos"			"0"
		"zpos"			"1"
		"wide"			"250"
		"tall"			"30"
		"visible"		"1"
		"labelText"		"07:89.00"
		"textAlignment"	"west"
		"font"			"ink_shadow_40"
	}
	"CurrentScoreBackground"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"CurrentScoreBackground"
		"xpos"			"190"
		"ypos"			"15"
		"wide"			"60"
		"tall"			"43"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack50_outlineGrey"
		"drawcolor"		"255 255 255 255"
		"src_corner_height"		"16"
		"src_corner_width"		"16"
		"draw_corner_width"		"3"
		"draw_corner_height" 	"3"
	}
	"CurrentScoreBackgroundFill"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"CurrentScoreBackgroundFill"
		"xpos"			"190"
		"ypos"			"20"
		"wide"			"60"
		"tall"			"30"
		"scaleImage"		"1"
		"visible"			"0"
		"enabled"			"1"
		"fillcolor" 		"0 0 0 220"
		"zpos"				"-2"
	}
	"CurrentScoreLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"CurrentScoreLabel"
		"xpos"			"190"
		"ypos"			"15"
		"zpos"			"1"
		"wide"			"60"
		"tall"			"28"
		"visible"		"0"
		"labelText"		"#L4D_Scoreboard_PZScore"
		"textAlignment"	"center"
		"font"			"PlayerDisplayHealth"
	}
	"CurrentScoreDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"CurrentScoreDigits"
		"xpos"			"163"
		"ypos"			"23"
		"zpos"			"1"
		"wide"			"40"
		"tall"			"32"
		"visible"		"1"
		"labelText"		"0"
		"textAlignment"	"east"
				"font"			"ink_shadow_30"
	}
	"Slash"
	{
		"ControlName"	"Label"
		"fieldName"		"Slash"
		"xpos"			"204"
		"ypos"			"22"
		"wide"			"32"
		"tall"			"28"
		"visible"		"1"
		"labelText"		"/"
		"textAlignment"	"south-west"
				"font"			"HudAmmoLargeShadow10"
	}
	"ItemsRemainingDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"ItemsRemainingDigits"
		"xpos"			"208"
		"ypos"			"22"
		"wide"			"32"
		"tall"			"28"
		"visible"		"1"
		"labelText"		"16"
		"textAlignment"	"south-west"
				"font"			"HudAmmoLargeShadow10"
	}
	"ScavengeTimeToBeatBackgroundImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"ScavengeTimeToBeatBackgroundImage"
		"xpos"			"250"
		"ypos"			"20"
		"wide"			"150"
		"tall"			"30"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack50_outlineGrey"
		"drawcolor"		"255 255 255 255"
		"src_corner_height"		"16"
		"src_corner_width"		"16"
		"draw_corner_width"		"3"
		"draw_corner_height" 	"3"
	}
	"ScavengeTimeToBeatBackgroundFill"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"ScavengeTimeToBeatBackgroundFill"
		"xpos"			"12"
		"ypos"			"375"
		"wide"			"37"
		"tall"			"25"
		"scaleImage"		"1"
		"visible"			"0"
		"enabled"			"1"
		"fillcolor" 		"0 0 50 200"
		"zpos"				"-2"
	}
	"ScoreToBeatLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"ScoreToBeatLabel"
		"xpos"			"12"
		"ypos"			"384"
		"wide"			"150"
		"tall"			"24"
		"visible"		"0"
		"labelText"		"#L4D_VSScoreboard_EnemyTeam"
		"textAlignment"	"west"
				"font"			"DefaultMoreSmall"
	}
	"ScoreToBeatDigits"
	{
		"ControlName"	"Label"
		"fieldName"		"ScoreToBeatDigits"
		"xpos"			"215"
		"ypos"			"26"
		"wide"			"60"
		"tall"			"26"
		"visible"		"1"
		"labelText"		"0"
		"textAlignment"	"center"
		"font"			"ink_shadow_30"
		}
	"SplatterTopLeft"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"SplatterTopLeft"
		"xpos"				"30"
		"ypos"				"3"
		"wide"				"130"
		"tall"				"40"
		"scaleImage"		"1"
		"visible"			"1"
		"enabled"			"1"
		"image"				"../vgui/hud/splatter1"
		"drawColor"			"64 64 64 228"
		"zpos"				"-3"
	}
	"SplatterTop"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"SplatterTop"
		"xpos"				"188"
		"ypos"				"-20"
		"wide"				"80"
		"tall"				"80"
		"scaleImage"		"1"
		"visible"			"1"
		"enabled"			"1"
		"image"				"../vgui/hud/splatter_corner_upper_right"
		"drawColor"			"64 64 64 228"
		"zpos"				"-3"
	}
	"SplatterTopRight"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"SplatterTopRight"
		"xpos"				"345"
		"ypos"				"-5"
		"wide"				"80"
		"tall"				"80"
		"scaleImage"		"1"
		"visible"			"1"
		"enabled"			"1"
		"image"				"../vgui/hud/splatter2"
		"drawColor"			"64 64 64 228"
		"zpos"				"-3"
	}
	"SplatterBottom"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"SplatterBottom"
		"xpos"				"115"
		"ypos"				"50"
		"wide"				"200"
		"tall"				"20"
		"scaleImage"		"1"
		"visible"			"1"
		"enabled"			"1"
		"image"				"../vgui/hud/splatter_horizontal_bottom"
		"drawColor"			"64 64 64 228"
		"zpos"				"-3"
	}
}