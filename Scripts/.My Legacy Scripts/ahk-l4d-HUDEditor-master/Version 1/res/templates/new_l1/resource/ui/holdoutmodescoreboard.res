"Resource/UI/HoldoutModeScoreboard.res"		//the dialogue you see at the end of a holdout round
{
	"TitleBackgroundImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"TitleBackgroundImage"
		"xpos"			"0"
		"ypos"			"-4"
		"wide"			"320"
		"tall"			"40"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"alpha"			"132"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineRed"
		"zpos"			"-2"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
	}
	
	"FinalTimeLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"FinalTimeLabel"
		"xpos"		"20"
		"ypos"		"5"
		"wide"		"200"
		"tall"		"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_HoldoutScoreboard_FinalTime"
		"textAlignment"		"west"
		"font"		"MenuTitle"
		"fgcolor_override"	"White"
	}
	
	"FinalTimeDigits"
	{
		"ControlName"		"Label"
		"fieldName"		"FinalTimeDigits"
		"xpos"		"150"
		"ypos"		"5"
		"wide"		"150"
		"tall"		"30"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"3:20.00"
		"textAlignment"		"east"
		"font"		"HudNumbers"
		"fgcolor_override"	"White"
	}

	"PlayersColumnLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"PlayersColumnLabel"
		"xpos"		"25"
		"ypos"		"30"
		"wide"		"200"
		"tall"		"30"
		"visible"		"1"
		"labelText"		"#L4D_HoldoutScoreboard_Players"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"MediumGray"
	}	

	"TimeColumnLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"TimeColumnLabel"
		"xpos"		"160"
		"ypos"		"30"
		"wide"		"125"
		"tall"		"30"
		"visible"		"1"
		"labelText"		"#L4D_HoldoutScoreboard_BestTime"
		"textAlignment"		"east"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"MediumGray"
	}	

	"Survivor1Entry"
	{
		"ControlName"		"CScoreboardEntry"
		"fieldName"		"Survivor1Entry"
		"xpos"		"5"
		"ypos"		"58"
		"wide"		"315"
		"tall"		"20"
		"visible"		"1"
	}	

	"Survivor2Entry"
	{
		"ControlName"		"CScoreboardEntry"
		"fieldName"		"Survivor2Entry"
		"xpos"		"5"
		"ypos"		"81"
		"wide"		"315"
		"tall"		"20"
		"visible"		"1"
	}	

	"Survivor3Entry"
	{
		"ControlName"		"CScoreboardEntry"
		"fieldName"		"Survivor3Entry"
		"xpos"		"5"
		"ypos"		"104"
		"wide"		"315"
		"tall"		"20"
		"visible"		"1"
	}	

	"Survivor4Entry"
	{
		"ControlName"		"CScoreboardEntry"
		"fieldName"		"Survivor4Entry"
		"xpos"		"5"
		"ypos"		"127"
		"wide"		"315"
		"tall"		"20"
		"visible"		"1"
	}	


//-----------------------------------------------------
// Infected Kills 
//-----------------------------------------------------

	"KillsHeader"
	{
		"ControlName"		"Label"
		"fieldName"		"KillsHeader"
		"xpos"		"340"
		"ypos"		"5"
		"wide"		"150"
		"tall"		"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"Infected Killed"
		"textAlignment"		"west"
		"font"		"MenuTitle"
		"fgcolor_override"	"White"
	}

	"CommonKillsLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"CommonKillsLabel"
		"xpos"		"340"
		"ypos"		"25"
		"wide"		"150"
		"tall"		"20"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_HoldoutScoreboard_Common"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"MediumGray"
	}
	
	"CommonKillsDigits"
	{
		"ControlName"		"Label"
		"fieldName"		"CommonKillsDigits"
		"xpos"		"450"
		"ypos"		"25"
		"wide"		"110"
		"tall"		"20"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"245"
		"textAlignment"		"west"
		"font"		"OuttroStatsCrawl"
	}

	"HunterKillsLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"HunterKillsLabel"
		"xpos"		"340"
		"ypos"		"43"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"Hunters"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"MediumGray"
	}	

	"HunterKillsDigits"
	{
		"ControlName"		"Label"
		"fieldName"		"HunterKillsDigits"
		"xpos"		"450"
		"ypos"		"43"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"17"
		"textAlignment"		"west"
		"font"		"OuttroStatsCrawl"
	}	

	"SmokerKillsLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"SmokerKillsLabel"
		"xpos"		"340"
		"ypos"		"61"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"Smokers:"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"MediumGray"
	}	

	"SmokerKillsDigits"
	{
		"ControlName"		"Label"
		"fieldName"		"SmokerKillsDigits"
		"xpos"		"450"
		"ypos"		"61"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"19"
		"textAlignment"		"west"
		"font"		"OuttroStatsCrawl"
	}	

	"BoomerKillsLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"BoomerKillsLabel"
		"xpos"		"340"
		"ypos"		"79"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"Boomers:"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"MediumGray"
	}	

	"BoomerKillsDigits"
	{
		"ControlName"		"Label"
		"fieldName"		"BoomerKillsDigits"
		"xpos"		"450"
		"ypos"		"79"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"6"
		"textAlignment"		"west"
		"font"		"OuttroStatsCrawl"
	}	

	"TankKillsLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"TankKillsLabel"
		"xpos"		"340"
		"ypos"		"97"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"Tanks:"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"MediumGray"
	}	

	"TankKillsDigits"
	{
		"ControlName"		"Label"
		"fieldName"		"TankKillsDigits"
		"xpos"		"450"
		"ypos"		"97"
		"wide"		"125"
		"tall"		"20"
		"visible"		"1"
		"labelText"		"3"
		"textAlignment"		"west"
		"font"		"OuttroStatsCrawl"
	}	


//-----------------------------------------------------
// Xbox 360
//-----------------------------------------------------
	"GamerCardButton"	[$X360]
	{
		"ControlName"	"Label"
		"fieldName"		"GamerCardButton"
		"xpos"			"15"
		"ypos"			"155"
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
		"xpos"			"40"
		"ypos"			"155"
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
}
