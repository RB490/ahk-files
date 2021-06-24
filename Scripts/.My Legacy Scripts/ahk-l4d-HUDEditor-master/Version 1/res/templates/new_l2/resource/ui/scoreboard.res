"Resource/UI/ScoreBoard.res"		//the screen that comes up when you press TAB
{
	"scores"
	{
		"ControlName"		"CClientScoreBoardDialog"
		"fieldName"		"scores"
		"xpos"		"0"
		"ypos"		"42"
		"wide"		"f0"
		"tall"		"480"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"		"0"
		"scoreboard_position"	"north-west"

		// Sizes for Infected sectioned list panel
		infected_avatar_size		"24"
		infected_name_width			"110"
		infected_status_width		"30"
		infected_score_width		"30"
		infected_death_width		"30"
		infected_ping_width			"30"
	}

	"BackgroundImage" [$X360]
	{
		"ControlName"	"Panel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"0"
		"wide"			"400" [$ENGLISH]
		"wide"			"515" [!$ENGLISH]
		"tall"			"480"
		"visible"		"1"
		"enabled"		"1"
		"bgcolor_override"	"0 0 0 230"
	}
	
	"BackgroundImage" [$WIN32]
	{
		"ControlName"	"Panel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"0"
		"wide"			"340" [$ENGLISH]
		"wide"			"375" [!$ENGLISH]
		"tall"			"480"
		"visible"		"1"
		"enabled"		"1"
		"bgcolor_override"	"0 0 0 230"
	}


	"ServerName"
	{
		"ControlName"		"Label"
		"fieldName"		"ServerName"
		"xpos"		"20"
		"ypos"		"10"
		"wide"		"330"
		"tall"		"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"		"north-west"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"		"FrameTitle"
		"fgcolor_override" "White"
	}
	
	"MissionTitle"
	{
		"ControlName"		"Label"
		"fieldName"		"MissionTitle"
		"xpos"		"20" [$WIN32]
		"ypos"		"13" [$WIN32]
		"xpos"		"60" [$X360]
		"ypos"		"23" [$X360]
		"wide"		"330" [$ENGLISH]
		"wide"		"440" [!$ENGLISH]
		"tall"		"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"		"north-west"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"		"FrameTitle"
		"fgcolor_override" "White"
		"wrap"		"1"
	}
	
	"MissionObjective"
	{
		"ControlName"		"Label"
		"fieldName"		"MissionObjective"
		"xpos"		"20"	[$WIN32]
		"ypos"		"27"    [$WIN32]
		"xpos"		"60"	[$X360]
		"ypos"		"58"    [$X360]
		"wide"		"330"
		"tall"		"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"		"north-west"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"		"Default"
		"fgcolor_override" "MediumGray"
		"wrap"			"1"
		"usetitlesafe"	"1" [$WIN32]
	}

	"ImgGoldMedal"
	{
		"ControlName"					"ImagePanel"
		"fieldName"						"ImgGoldMedal"
		"xpos"							"60"	[$X360]
		"xpos"							"25"	[$WIN32]
		"ypos"							"85"	[$X360]
		"ypos"							"70"	[$WIN32]
		"zpos"							"2"
		"wide"							"20"
		"tall"							"20"
		"pinCorner"						"0"
		"visible"						"1"
		"enabled"						"1"
		"tabPosition"					"0"
		"image"							"hud/survival_medal_gold"
		"scaleImage"					"1"
	}
	
	"LblGoldMedalTime"
	{
		"ControlName"					"Label"
		"fieldName"						"LblGoldMedalTime"
		"xpos"							"46"	[$WIN32]
		"xpos"							"95"	[$X360]
		"ypos"							"85"	[$X360]
		"ypos"							"70"	[$WIN32]
		"wide"							"50"
		"tall"							"20"
		"zpos"							"2"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"1" 
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						"0:00"
		"textAlignment"					"west"
		"Font"							"Default"
	}
	
	"ImgSilverMedal"
	{
		"ControlName"					"ImagePanel"
		"fieldName"						"ImgSilverMedal"
		"xpos"							"60"	[$X360]
		"xpos"							"25"	[$WIN32]
		"ypos"							"100"	[$X360]
		"ypos"							"85"	[$WIN32]
		"zpos"							"2"
		"wide"							"20"
		"tall"							"20"
		"pinCorner"						"0"
		"visible"						"1"
		"enabled"						"1"
		"tabPosition"					"0"
		"image"							"hud/survival_medal_silver"
		"scaleImage"					"1"
	}
	
	"LblSilverMedalTime"
	{
		"ControlName"					"Label"
		"fieldName"						"LblSilverMedalTime"
		"xpos"							"46"	[$WIN32]
		"xpos"							"95"	[$X360]
		"ypos"							"100"	[$X360]
		"ypos"							"85"	[$WIN32]
		"wide"							"50"
		"tall"							"20"
		"zpos"							"2"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"1" 
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						"0:00"
		"textAlignment"					"west"
		"Font"							"Default"
	}
	
	"ImgBronzeMedal"
	{
		"ControlName"					"ImagePanel"
		"fieldName"						"ImgBronzeMedal"
		"xpos"							"60"	[$X360]
		"xpos"							"25"	[$WIN32]
		"ypos"							"115"	[$X360]
		"ypos"							"100"	[$WIN32]
		"zpos"							"2"
		"wide"							"20"
		"tall"							"20"
		"pinCorner"						"0"
		"visible"						"1"
		"enabled"						"1"
		"tabPosition"					"0"
		"image"							"hud/survival_medal_bronze"
		"scaleImage"					"1"
	}
	
	"LblBronzeMedalTime"
	{
		"ControlName"					"Label"
		"fieldName"						"LblBronzeMedalTime"
		"xpos"							"46"	[$WIN32]
		"xpos"							"95"	[$X360]
		"ypos"							"115"	[$X360]
		"ypos"							"100"	[$WIN32]
		"wide"							"50"
		"tall"							"20"
		"zpos"							"2"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"1" 
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						"0:00"
		"textAlignment"					"west"
		"Font"							"Default"
	}

	"ImgLevelLargeImage"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgLevelLargeImage"
		"xpos"					"95"			[$WIN32]
		"ypos"					"54"			[$WIN32]
		"wide"					"163"			[$WIN32]
		"tall"					"82"			[$WIN32]
		"xpos"					"152"			[$X360]
		"ypos"					"70"			[$X360]
		"wide"					"150"			[$X360]
		"tall"					"75"			[$X360]
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"maps/any"
		"scaleImage"			"1"
	}
	
	"ImgLevelLargeImageFrame"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgLevelLargeImageFrame"
		"xpos"					"90"           [$WIN32]
		"ypos"					"48"           [$WIN32]
		"wide"					"202"           [$WIN32]
		"tall"					"98"            [$WIN32]
		"xpos"					"145"           [$X360]
		"ypos"					"62"            [$X360]
		"wide"					"184"           [$X360]
		"tall"					"90"           [$X360]
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"campaignFrame"
		"scaleImage"			"1"
	}		

	"Map1"
	{
		"ControlName"		"ImagePanel"
		"fieldName"		"Map1"
		"xpos"			"20" [$WIN32]
		"xpos"			"65" [$X360]
		"ypos"			"c-150" [$WIN32]
		"ypos"			"90" [$X360]
		"wide"			"60"
		"tall"			"30"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"fillcolor_override"	"DarkGray"
		"usetitlesafe"	"1" [$WIN32]
	}
	"Map2"
	{
		"ControlName"		"ImagePanel"
		"fieldName"		"Map2"
		"xpos"			"82" [$WIN32]
		"xpos"			"127" [$X360]
		"ypos"			"c-150" [$WIN32]
		"ypos"			"90" [$X360]
		"wide"			"60"
		"tall"			"30"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"fillcolor_override"	"DarkGray"
		"usetitlesafe"	"1" [$WIN32]
	}
	"Map3"
	{
		"ControlName"		"ImagePanel"
		"fieldName"		"Map3"
		"xpos"			"144" [$WIN32]
		"xpos"			"189" [$X360]
		"ypos"			"c-150" [$WIN32]
		"ypos"			"90" [$X360]
		"wide"			"60"
		"tall"			"30"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"fillcolor_override"	"DarkGray"
		"usetitlesafe"	"1" [$WIN32]
	}
	"Map4"
	{
		"ControlName"		"ImagePanel"
		"fieldName"		"Map4"
		"xpos"			"206" [$WIN32]
		"xpos"			"251" [$X360]
		"ypos"			"c-150" [$WIN32]
		"ypos"			"90" [$X360]
		"wide"			"60"
		"tall"			"30"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"fillcolor_override"	"DarkGray"
		"usetitlesafe"	"1" [$WIN32]
	}
	"Map5"
	{
		"ControlName"		"ImagePanel"
		"fieldName"		"Map5"
		"xpos"			"268" [$WIN32]
		"xpos"			"313" [$X360]
		"ypos"			"c-150" [$WIN32]
		"ypos"			"90" [$X360]
		"wide"			"60"
		"tall"			"30"
		"autoResize"	"0"
		"pinCorner"		"0"	
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"fillcolor_override"	"DarkGray"
		"usetitlesafe"	"1" [$WIN32]
	}

	"CurrentMap"
	{
		"ControlName"		"Label"
		"fieldName"		"CurrentMap"
		"xpos"			"368"	// code sets this to the xpos of the correct MapN control
		"ypos"			"120"
		"wide"			"90"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"			"DefaultDropShadow"
		"labelText"		"#L4D_Scoreboard_Current_Map"
		"centerwrap"	"1"
	}
	
	"CurrentMapArrow"
	{
		"ControlName"		"Label"
		"fieldName"		"CurrentMapArrow"
		"xpos"			"368"	// code sets this to the xpos of the correct MapN control
		"ypos"			"113"
		"wide"			"60"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"		"GameUIButtons"
		"labelText"		"r"
	}

	"OpponentMap"
	{
		"ControlName"		"Label"
		"fieldName"		"OpponentMap"
		"xpos"			"368"	// code sets this to the xpos of the correct MapN control
		"ypos"			"60"
		"wide"			"60"
		"tall"			"0"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"		"DefaultDropShadow"
		"labelText"		"#L4D_Scoreboard_Opponent_Map"
		"centerwrap"	"1"
	}
	
	"RescueMap"
	{
		"ControlName"		"Label"
		"fieldName"		"RescueMap"
		"xpos"			"368"	// code sets this to the xpos of the correct MapN control
		"ypos"			"120"
		"wide"			"80"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"		"DefaultDropShadow"
		"labelText"		"#L4D_Scoreboard_Rescue_Map"
	}
	"RescueMapArrow"
	{
		"ControlName"		"Label"
		"fieldName"		"RescueMapArrow"
		"xpos"			"368"	// code sets this to the xpos of the correct MapN control
		"ypos"			"113"
		"wide"			"60"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"		"GameUIButtons"
		"labelText"		"r"
		"fgcolor_override" "White"
	}

	"SurvivorBackground"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"SurvivorBackground"
		"xpos"		"15"
		"ypos"		"c-85"
		"wide"		"311"
		"tall"		"129"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgBlack"
		"zpos"			"-2"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
		
		"usetitlesafe"		"1"
	}	

	"Survivor1"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Survivor1"
 		"xpos"		"20"
 		"ypos"		"c-102"
 		"zpos"		"1"
 		"wide"		"300"
 		"tall"		"80"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Survivor2"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Survivor2"
		"xpos"		"20"
		"ypos"		"c-72"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"80"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Survivor3"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Survivor3"
		"xpos"		"20"
		"ypos"		"c-42"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"80"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Survivor4"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Survivor4"
		"xpos"		"20"
		"ypos"		"c-12"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"80"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}
	
	"InfectedBackground"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"InfectedBackground"
		"xpos"		"15"
		"ypos"		"c42"
		"wide"		"311"
		"tall"		"90"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgBlack"
		"zpos"			"-2"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
		
		"usetitlesafe"		"1"
	}

	"Infected1"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Infected1"
		"xpos"		"20"
		"ypos"		"c33"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"50"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Infected2"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Infected2"
		"xpos"		"20"
		"ypos"		"c53"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"50"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Infected3"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Infected3"
		"xpos"		"20"
		"ypos"		"c73"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"50"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Infected4"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Infected4"
		"xpos"		"20"
		"ypos"		"c93"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"50"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Infected5"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"		"Infected5"
		"xpos"		"20"
		"ypos"		"c113"
		"zpos"		"1"
		"wide"		"300"
		"tall"		"50"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"autoresize"	"0"
		"usetitlesafe"	"1"
	}

	"Spectators"
	{
		"ControlName"		"Label"
		"fieldName"		"Spectators"
		"font"			"ScoreboardVerySmall"
		"labelText"		"%spectators%"
		"textAlignment"		"west"
		"xpos"			"20"
		"ypos"			"c130"
		"zpos"			"1"
		"wide"			"424"	[$WIN32]
		"wide"			"0"		[$X360]		// DISABLED
		"tall"			"20"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"usetitlesafe"	"1"
		"noshortcutsyntax" "1"
	}	
		
	"MoveSelectionButton"	[$X360]
	{
		"ControlName"	"Label"
		"fieldName"		"MoveSelectionButton"
		"xpos"			"65"
		"ypos"			"r100"
		"wide"			"24"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"			"GameUIButtons"
		"labelText"		"C"
	}	
	
	"MoveSelectionLabel"	[$X360]
	{
		"ControlName"	"Label"
		"fieldName"		"MoveSelectionLabel"
		"xpos"			"90"
		"ypos"			"r100"
		"wide"			"300"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_Scoreboard_Select_Player"
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"DefaultLarge"
	}
	
	"VoteKickButton"	[$X360]
	{
		"ControlName"	"Label"
		"fieldName"		"VoteKickButton"
		"xpos"			"65"
		"ypos"			"r80"
		"wide"			"24"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"			"GameUIButtons"
		"labelText"		"#GameUI_Icons_X_3DButton"
	}	
	
	"VoteKickLabel"	[$X360]
	{
		"ControlName"	"Label"
		"fieldName"		"VoteKickLabel"
		"xpos"			"90"
		"ypos"			"r80"
		"wide"			"300"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_Scoreboard_Vote_Kick"
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"DefaultLarge"
	}
	
	"GamerCardButton"	[$X360]
	{
		"ControlName"	"Label"
		"fieldName"		"GamerCardButton"
		"xpos"			"65"
		"ypos"			"r60"
		"wide"			"24"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"font"			"GameUIButtons"
		"labelText"		"#GameUI_Icons_A_3DButton"
	}	
	
	"GamerCardLabel"	[$X360]
	{
		"ControlName"	"Label"
		"fieldName"		"GamerCardLabel"
		"xpos"			"90"
		"ypos"			"r60"
		"wide"			"300"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_Scoreboard_View_GamerCard"
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"DefaultLarge"
	}
	
	"CVersusModeEmbeddedScoreboard"
	{
		"ControlName"	"CVersusModeEmbeddedScoreboard"
		"fieldName"		"VersusModeScoreboard"
		"xpos"			"15" [$WIN32]
		"xpos"			"13" [$X360]
		"ypos"			"c-228"    [$WIN32]
		"ypos"			"c-220"    [$X360]
		"wide"			"354"
		"tall"			"140"
		"visible"		"1"
		"enabled"		"1"
		"usetitlesafe"	"1"
	}
	
	"CScavengeModeEmbeddedScoreboard"
	{
		"ControlName"	"CScavengeModeEmbeddedScoreboard"
		"fieldName"		"ScavengeModeScoreboard"
		"xpos"			"15" [$WIN32]
		"xpos"			"18" [$X360]
		"ypos"			"c-215"    [$WIN32]
		"ypos"			"c-215"    [$X360]
		"wide"			"354"
		"tall"			"140"
		"visible"		"1"
		"enabled"		"1"
		"usetitlesafe"	"1"
	}

	"ThirdPartyServerPanel"
	{
		"ControlName"	"CThirdPartyServerPanel"
		"fieldName"		"ThirdPartyServerPanel"
		"xpos"			"r300"
		"ypos"			"15"
		"wide"			"300"
		"tall"			"130"
		"visible"		"0"		[$WIN32]
		"visible"		"0"	    [$X360]
		"enabled"		"0"
	}
}
