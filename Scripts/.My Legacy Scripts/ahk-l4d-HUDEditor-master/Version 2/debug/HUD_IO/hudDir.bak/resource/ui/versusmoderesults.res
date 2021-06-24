
"Resource/UI/VersusModeResults.res"
{
	"BackgroundImage"
	{
		"ControlName"	"Panel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"30"
		"wide"			"327" [$ENGLISH]
		"wide"			"327" [!$ENGLISH]
		"tall"			"86"
		"visible"		"0"
		"enabled"		"1"
		"scaleImage"	"1"
		"bgcolor_override"	"0 0 255 220"
		"zpos"			"-2"
	}
	"BackgroundImage_3"
	{
		"ControlName"	"Panel"
		"fieldName"		"BackgroundImage_3"
		"xpos"			"33"
		"ypos"			"4"
		"wide"			"290" [$ENGLISH]
		"wide"			"290" [!$ENGLISH]
		"tall"			"70"
		"visible"		"1"
		"enabled"		"1"
		"bgcolor_override"	"0 0 0 220"
	}
	"BackgroundImage_4"
	{
		"ControlName"	"Panel"
		"fieldName"		"BackgroundImage_4"
		"xpos"			"33"
		"ypos"			"90"
		"wide"			"290" [$ENGLISH]
		"wide"			"290" [!$ENGLISH]
		"tall"			"45"
		"visible"		"0"
		"enabled"		"1"
		"bgcolor_override"	"0 0 0 220"
	}
	"BackgroundImage_1"
	{
		"ControlName"	"Panel"
		"fieldName"		"BackgroundImage_1"
		"xpos"			"33"
		"ypos"			"32"
		"wide"			"290" [$ENGLISH]
		"wide"			"290" [!$ENGLISH]
		"tall"			"20"
		"visible"		"1"
		"enabled"		"1"
		"bgcolor_override"	"0 0 0 220"
	}
	"BackgroundImage_2"
	{
		"ControlName"	"Panel"
		"fieldName"		"BackgroundImage_2"
		"xpos"			"33"
		"ypos"			"54"
		"wide"			"290" [$ENGLISH]
		"wide"			"290" [!$ENGLISH]
		"tall"			"20"
		"visible"		"1"
		"enabled"		"1"
		"bgcolor_override"	"0 0 0 220"
	}
	"StatBreakdownHighlightImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"StatBreakdownHighlightImage"
		"xpos"		"99999"
		"ypos"		"70"
		"wide"			"354" [$ENGLISH]
		"wide"			"364" [!$ENGLISH]
		"tall"		"45"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineRed"
		"zpos"			"-1"
		"src_corner_height"		"19"
		"src_corner_width"		"19"
		"draw_corner_width"		"4"
		"draw_corner_height" 	"4"
	}
	"ModeTitle"
	{
		"ControlName"		"Label"
		"fieldName"		"ModeTitle"
		"xpos"		"13"
		"ypos"		"11"
		"wide"		"300" [$ENGLISH]
		"wide"		"344" [!$ENGLISH]
		"tall"		"24"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_Title"
		"textAlignment"		"north-west"
		"dulltext"		"0"
		"brighttext"		"0"
		"font"		"MenuTitle"
		"fgcolor_override"	"White"
	}
	"TeamYours"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamYours"
		"xpos"		"25"
		"ypos"		"32"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [!$ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_YourTeam"
		"textAlignment"		"center"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"MenuTitle"
		"fgcolor_override"	"Gray"
	}
	"TeamEnemy"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamEnemy"
		"xpos"		"200" [$ENGLISH]
		"xpos"		"207" [!$ENGLISH]
		"ypos"		"32"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [!$ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_EnemyTeam"
		"textAlignment"		"center"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"MenuTitle"
		"fgcolor_override"	"Gray"
	}
	"TeamYourScoreSurvivors"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamYourScoreSurvivors"
		"xpos"		"25"
		"ypos"		"54"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [!$ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%YourSurvivor%"
		"textAlignment"		"north"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"MenuTitle"
		"fgcolor_override"	"MediumGray"
	}
	"TeamEnemyScoreSurvivors"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamEnemyScoreSurvivors"
		"xpos"		"200" [$ENGLISH]
		"xpos"		"207" [!$ENGLISH]
		"ypos"		"54"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [!$ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%EnemySurvivor%"
		"textAlignment"		"north"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"MenuTitle"
		"fgcolor_override"	"MediumGray"
	}
	"YourTeamHighlightImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"YourTeamHighlightImage"
		"xpos"		"99999"
		"ypos"		"43"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [!$ENGLISH]
		"tall"		"32"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineRed"
		"zpos"			"-1"
		"src_corner_height"		"19"
		"src_corner_width"		"19"
		"draw_corner_width"		"4"
		"draw_corner_height" 	"4"
	}
	"EnemyTeamHighlightImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"EnemyTeamHighlightImage"
		"xpos"		"99999" [$ENGLISH]
		"xpos"		"207" [!$ENGLISH]
		"ypos"		"43"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [!$ENGLISH]
		"tall"		"32"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineRed"
		"zpos"			"-1"
		"src_corner_height"		"19"
		"src_corner_width"		"19"
		"draw_corner_width"		"4"
		"draw_corner_height" 	"4"
	}
	"TeamWinLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"TeamWinLabel"
		"xpos"				"15"
		"ypos"				"3"
		"wide"				"327" [$ENGLISH]
		"wide"				"327" [!$ENGLISH]
		"tall"				"30"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			"#L4D_VSScoreboard_Distance"
		"textAlignment"		"center"
		"dulltext"			"1"
		"brighttext"		"0"
		"font"				"HudAmmoLarge30"
		"fgcolor_override"	"MediumGray"
	}
	"TeamFlipExplanationLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"TeamFlipExplanationLabel"
		"xpos"			"-2"
		"ypos"			"75"
		"wide"			"360" [$ENGLISH]
		"wide"			"360" [!$ENGLISH]
		"tall"			"20"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			"You will play Survivors first in the next chapter."
		"textAlignment"		"center"
		"dulltext"			"1"
		"brighttext"		"0"
		"font"				"HudAmmoLargeShadow20"
		"fgcolor_override"	"MediumGray"
	}
}