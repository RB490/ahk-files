"Resource/UI/VersusModeScoreboard.res"		//the dialogue you see when you are joining the survivor team
{
	"BackgroundImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"354" [$ENGLISH]
		"wide"			"364" [$!ENGLISH]
		"tall"			"115"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineGrey"
		"zpos"			"-2"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
		
		"if_embedded"
		{
			"visible"	"0"
		}
	}

	"ModeTitle"
	{
		"ControlName"		"Label"
		"fieldName"		"ModeTitle"
		"xpos"		"13"
		"ypos"		"11"
		"wide"		"300" [$ENGLISH]
		"wide"		"344" [$!ENGLISH]
		"tall"		"24"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_Title"
		"textAlignment"		"north-west"
		"dulltext"		"0"
		"brighttext"		"0"
		"font"		"MenuTitle"
		"fgcolor_override"	"White"
		
		"if_embedded"
		{
			"visible"	"0"
		}
	}

	"TeamSurvivor"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamSurvivor"
		"xpos"		"13"
		"ypos"		"55"
		"wide"		"220"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"labelText"		"#Cstrike_TitlesTXT_Terrorist_Forces"
		"textAlignment"		"north-west"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"InstructorTitle"
		"fgcolor_override"	"White"
	}

	"TeamYours"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamYours"
		"xpos"		"25"
		"ypos"		"30"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [$!ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_YourTeam"
		"textAlignment"		"center"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"InstructorTitle_ss"
		"fgcolor_override"	"White"
		
		"if_embedded"
		{
			"xpos"	"20"
		}
	}

	"TeamEnemy"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamEnemy"
		"xpos"		"200" [$ENGLISH]
		"xpos"		"207" [$!ENGLISH]
		"ypos"		"30"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [$!ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_EnemyTeam"
		"textAlignment"		"center"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"InstructorTitle_ss"
		"fgcolor_override"	"White"
		
		"if_embedded"
		{
			"xpos"	"160"
		}
	}

	"TeamYourScoreSurvivors"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamYourScoreSurvivors"
		"xpos"		"25"
		"ypos"		"50"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [$!ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%YourSurvivor%"
		"textAlignment"		"north"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"InstructorTitle"
		
		"if_embedded"
		{
			"xpos"	"20"
		}
	}

	"TeamEnemyScoreSurvivors"
	{
		"ControlName"		"Label"
		"fieldName"		"TeamEnemyScoreSurvivors"
		"xpos"		"200" [$ENGLISH]
		"xpos"		"207" [$!ENGLISH]
		"ypos"		"50"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [$!ENGLISH]
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%EnemySurvivor%"
		"textAlignment"		"north"
		"dulltext"		"1"
		"brighttext"		"0"
		"font"		"InstructorTitle"
		
		"if_embedded"
		{
			"xpos"	"160"
		}
	}

	"DistanceLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"DistanceLabel"
		"xpos"		"13"
		"ypos"		"80"
		"wide"		"220"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_DistanceShort"
		"textAlignment"		"north-west"
		"dulltext"		"1"
		"brighttext"		"0"
		"fgcolor_override"	"White"
		"auto_wide_tocontents"	"1"
	}	
	
	"DistanceAmount"
	{
		"ControlName"		"Label"
		"fieldName"		"DistanceAmount"
		"xpos"		"10" [$ENGLISH]
		"xpos"		"5" [$!ENGLISH]
		"ypos"		"0"
		"wide"		"20"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%distance%"
		"textAlignment"		"north-west"
		"dulltext"		"1"
		"brighttext"		"0"
		"fgcolor_override"	"MediumGray"
		"auto_wide_tocontents"	"1"
		
		"pin_to_sibling"		"DistanceLabel"
		"pin_corner_to_sibling"	"0"
		"pin_to_sibling_corner"	"1"
	}	
	
	"HealthLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"HealthLabel"
		"xpos"		"30" [$ENGLISH]
		"xpos"		"10" [$!ENGLISH]
		"ypos"		"0"
		"wide"		"220"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_Health"
		"textAlignment"		"north-west"
		"dulltext"		"1"
		"brighttext"		"0"
		"fgcolor_override"	"White"
		"auto_wide_tocontents"	"1"
		
		"pin_to_sibling"		"DistanceAmount"
		"pin_corner_to_sibling"	"0"
		"pin_to_sibling_corner"	"1"
	}	
	
	"HealthAmount"
	{
		"ControlName"		"Label"
		"fieldName"		"HealthAmount"
		"xpos"		"10" [$ENGLISH]
		"xpos"		"5" [$!ENGLISH]
		"ypos"		"0"
		"wide"		"220"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%healthbonus%"
		"textAlignment"		"north-west"
		"dulltext"		"1"
		"brighttext"		"0"
		"fgcolor_override"	"MediumGray"
		
		"pin_to_sibling"		"HealthLabel"
		"pin_corner_to_sibling"	"0"
		"pin_to_sibling_corner"	"1"
	}	
	
	"SurvivalMultLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"SurvivalMultLabel"
		"xpos"		"100"
		"ypos"		"95"
		"wide"		"220"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_VSScoreboard_SurvivalMult"
		"textAlignment"		"north-west"
		"dulltext"		"1"
		"brighttext"		"0"
		"fgcolor_override"	"White"
		"auto_wide_tocontents"	"1"
	}	
	
	"SurvivalMultAmount"
	{
		"ControlName"		"Label"
		"fieldName"		"SurvivalMultAmount"
		"xpos"		"10"
		"ypos"		"0"
		"wide"		"220"
		"tall"		"20"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%survivalmult%"
		"textAlignment"		"north-west"
		"dulltext"		"1"
		"brighttext"		"0"
		"fgcolor_override"	"MediumGray"
		
		"pin_to_sibling"		"SurvivalMultLabel"
		"pin_corner_to_sibling"	"0"
		"pin_to_sibling_corner"	"1"
	}	
	
	"YourTeamHighlightImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"YourTeamHighlightImage"
		"xpos"		"25"
		"ypos"		"43"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [$!ENGLISH]
		"tall"		"32"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineRed"
		"zpos"			"-1"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
		
		"if_embedded"
		{
			"xpos"	"20"
		}
	}
	
	"EnemyTeamHighlightImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"EnemyTeamHighlightImage"
		"xpos"		"200" [$ENGLISH]
		"xpos"		"207" [$!ENGLISH]
		"ypos"		"43"
		"wide"		"125" [$ENGLISH]
		"wide"		"132" [$!ENGLISH]
		"tall"		"32"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineRed"
		"zpos"			"-1"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
		
		"if_embedded"
		{
			"xpos"	"160"
		}
	}
	
	"StatBreakdownHighlightImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"StatBreakdownHighlightImage"
		"xpos"		"0"
		"ypos"		"70"
		"wide"			"354" [$ENGLISH]
		"wide"			"364" [$!ENGLISH]
		"tall"		"45"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineRed"
		"zpos"			"-1"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
		
		"if_embedded"
		{
			"wide"		"320" [$ENGLISH]
			"wide"		"345" [$!ENGLISH]
		}
	}
	
	"StatAnimationBreakdownLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"StatAnimationBreakdownLabel"
		"xpos"				"15"
		"ypos"				"77"
		"wide"				"324" [$ENGLISH]
		"wide"				"334" [$!ENGLISH]
		"tall"				"30"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"labelText"			"#L4D_VSScoreboard_Distance"
		"textAlignment"		"center"
		"dulltext"			"1"
		"brighttext"		"0"
		"font"				"InstructorTitle"
		"fgcolor_override"	"MediumGray"
	}	
	
	"TeamWinLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"TeamWinLabel"
		"xpos"				"15"
		"ypos"				"72"
		"wide"				"324" [$ENGLISH]
		"wide"				"334" [$!ENGLISH]
		"tall"				"30"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"labelText"			"#L4D_VSScoreboard_Distance"
		"textAlignment"		"center"
		"dulltext"			"1"
		"brighttext"		"0"
		"font"				"InstructorTitle"
		"fgcolor_override"	"MediumGray"
	}	
	
	"TeamFlipExplanationLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"TeamFlipExplanationLabel"
		"xpos"				"0"
		"ypos"				"86"
		"wide"				"354"
		"tall"				"30"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"labelText"			"You will play Survivors first in the next chapter."
		"textAlignment"		"center"
		"dulltext"			"1"
		"brighttext"		"0"
		"font"				"InstructorTitle_ss"
		"fgcolor_override"	"MediumGray"
	}
}
