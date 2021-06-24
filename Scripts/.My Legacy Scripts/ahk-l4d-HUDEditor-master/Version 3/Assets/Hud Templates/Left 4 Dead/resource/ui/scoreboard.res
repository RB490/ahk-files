// Tab scoreboard
"Resource/UI/ScoreBoard.res"
{

	BackgroundImage
	{
		"fieldname"         "BackgroundImage"
		"controlName"       "Panel"
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "0"
		"ypos"              "0"
		"zpos"              "0"
		"wide"              "375"
		"tall"              "480"
		"bgcolor_override"  "0 0 0 230"
	}

	CurrentMap
	{
		"fieldname"            "CurrentMap"
		"controlName"          "Label"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "368"
		"ypos"                 "c-136"
		"wide"                 "90"
		"tall"                 "12"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"brighttext"           "1"
		"centerwrap"           "1"
		"dulltext"             "0"
		"font"                 "DefaultDropShadow"
		"labelText"            "#L4D_Scoreboard_Current_Map"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "center"
	}

	CurrentMapArrow
	{
		"fieldname"            "CurrentMapArrow"
		"controlName"          "Label"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "368"
		"ypos"                 "114"
		"wide"                 "60"
		"tall"                 "12"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"fgcolor_override"     "White"
		"font"                 "GameUIButtons"
		"labelText"            "t"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "south"
	}

	CVersusModeScoreboard
	{
		"fieldname"     "VersusModeScoreboard"
		"controlName"   "CVersusModeScoreboard"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "15"
		"ypos"          "c-208"
		"wide"          "354"
		"tall"          "120"
		"usetitlesafe"  "1"
	}

	GamerCardButton
	{
		"fieldname"            "GamerCardButton"
		"controlName"          "Label"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "65"
		"ypos"                 "r60"
		"wide"                 "24"
		"tall"                 "24"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"brighttext"           "1"
		"dulltext"             "0"
		"font"                 "GameUIButtons"
		"labelText"            "#GameUI_Icons_A_3DButton"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "center"
	}

	GamerCardLabel
	{
		"fieldname"      "GamerCardLabel"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "90"
		"ypos"           "r60"
		"wide"           "300"
		"tall"           "24"
		"autoResize"     "0"
		"brighttext"     "0"
		"dulltext"       "0"
		"font"           "DefaultLarge"
		"labelText"      "#L4D_Scoreboard_View_GamerCard"
		"pinCorner"      "0"
		"textAlignment"  "west"
	}

	ImgBronzeMedal
	{
		"fieldname"    "ImgBronzeMedal"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "20"
		"ypos"         "120"
		"zpos"         "2"
		"wide"         "20"
		"tall"         "20"
		"image"        "hud/holdout_medal_bronze"
		"pinCorner"    "0"
		"scaleImage"   "1"
		"tabPosition"  "0"
	}

	ImgGoldMedal
	{
		"fieldname"    "ImgGoldMedal"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "20"
		"ypos"         "90"
		"zpos"         "2"
		"wide"         "20"
		"tall"         "20"
		"image"        "hud/holdout_medal_gold"
		"pinCorner"    "0"
		"scaleImage"   "1"
		"tabPosition"  "0"
	}

	ImgSilverMedal
	{
		"fieldname"    "ImgSilverMedal"
		"controlName"  "ImagePanel"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "20"
		"ypos"         "105"
		"zpos"         "2"
		"wide"         "20"
		"tall"         "20"
		"image"        "hud/holdout_medal_silver"
		"pinCorner"    "0"
		"scaleImage"   "1"
		"tabPosition"  "0"
	}

	Infected1
	{
		"fieldname"     "Infected1"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c33"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "50"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	Infected2
	{
		"fieldname"     "Infected2"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c53"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "50"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	Infected3
	{
		"fieldname"     "Infected3"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c73"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "50"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	Infected4
	{
		"fieldname"     "Infected4"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c93"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "50"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	Infected5
	{
		"fieldname"     "Infected5"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c113"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "50"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	LblBronzeMedalTime
	{
		"fieldname"      "LblBronzeMedalTime"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "46"
		"ypos"           "120"
		"zpos"           "2"
		"wide"           "50"
		"tall"           "20"
		"autoResize"     "0"
		"Font"           "Default"
		"labelText"      "0:00"
		"pinCorner"      "0"
		"tabPosition"    "0"
		"textAlignment"  "west"
	}

	LblGoldMedalTime
	{
		"fieldname"      "LblGoldMedalTime"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "46"
		"ypos"           "90"
		"zpos"           "2"
		"wide"           "50"
		"tall"           "20"
		"autoResize"     "0"
		"Font"           "Default"
		"labelText"      "0:00"
		"pinCorner"      "0"
		"tabPosition"    "0"
		"textAlignment"  "west"
	}

	LblSilverMedalTime
	{
		"fieldname"      "LblSilverMedalTime"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "46"
		"ypos"           "105"
		"zpos"           "2"
		"wide"           "50"
		"tall"           "20"
		"autoResize"     "0"
		"Font"           "Default"
		"labelText"      "0:00"
		"pinCorner"      "0"
		"tabPosition"    "0"
		"textAlignment"  "west"
	}

	Map1
	{
		"fieldname"            "Map1"
		"controlName"          "ImagePanel"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "20"
		"ypos"                 "c-120"
		"wide"                 "60"
		"tall"                 "30"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"fillcolor_override"   "DarkGray"
		"pinCorner"            "0"
		"tabPosition"          "0"
	}

	Map2
	{
		"fieldname"            "Map2"
		"controlName"          "ImagePanel"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "82"
		"ypos"                 "c-120"
		"wide"                 "60"
		"tall"                 "30"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"fillcolor_override"   "DarkGray"
		"pinCorner"            "0"
		"tabPosition"          "0"
	}

	Map3
	{
		"fieldname"            "Map3"
		"controlName"          "ImagePanel"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "144"
		"ypos"                 "c-120"
		"wide"                 "60"
		"tall"                 "30"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"fillcolor_override"   "DarkGray"
		"pinCorner"            "0"
		"tabPosition"          "0"
	}

	Map4
	{
		"fieldname"            "Map4"
		"controlName"          "ImagePanel"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "206"
		"ypos"                 "c-120"
		"wide"                 "60"
		"tall"                 "30"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"fillcolor_override"   "DarkGray"
		"pinCorner"            "0"
		"tabPosition"          "0"
	}

	Map5
	{
		"fieldname"            "Map5"
		"controlName"          "ImagePanel"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "268"
		"ypos"                 "c-120"
		"wide"                 "60"
		"tall"                 "30"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"fillcolor_override"   "DarkGray"
		"pinCorner"            "0"
		"tabPosition"          "0"
	}

	MissionObjective
	{
		"fieldname"         "MissionObjective"
		"controlName"       "Label"
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "20"
		"ypos"              "58"
		"wide"              "330"
		"tall"              "24"
		"usetitlesafe"      "1"
		"autoResize"        "0"
		"brighttext"        "1"
		"dulltext"          "0"
		"fgcolor_override"  "MediumGray"
		"font"              "Default"
		"labelText"         ""
		"pinCorner"         "0"
		"textAlignment"     "north-west"
		"wrap"              "1"
	}

	MissionTitle
	{
		"fieldname"         "MissionTitle"
		"controlName"       "Label"
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "20"
		"ypos"              "13"
		"wide"              "440"
		"tall"              "24"
		"autoResize"        "0"
		"brighttext"        "1"
		"dulltext"          "0"
		"fgcolor_override"  "White"
		"font"              "FrameTitle"
		"labelText"         ""
		"pinCorner"         "0"
		"textAlignment"     "north-west"
		"wrap"              "1"
	}

	MoveSelectionButton
	{
		"fieldname"            "MoveSelectionButton"
		"controlName"          "Label"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "65"
		"ypos"                 "r100"
		"wide"                 "24"
		"tall"                 "24"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"brighttext"           "1"
		"dulltext"             "0"
		"font"                 "GameUIButtons"
		"labelText"            "C"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "center"
	}

	MoveSelectionLabel
	{
		"fieldname"      "MoveSelectionLabel"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "90"
		"ypos"           "r100"
		"wide"           "300"
		"tall"           "24"
		"autoResize"     "0"
		"brighttext"     "0"
		"dulltext"       "0"
		"font"           "DefaultLarge"
		"labelText"      "#L4D_Scoreboard_Select_Player"
		"pinCorner"      "0"
		"textAlignment"  "west"
	}

	OpponentMap
	{
		"fieldname"            "OpponentMap"
		"controlName"          "Label"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "368"
		"ypos"                 "90"
		"wide"                 "60"
		"tall"                 "0"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"brighttext"           "1"
		"centerwrap"           "1"
		"dulltext"             "0"
		"font"                 "DefaultDropShadow"
		"labelText"            "#L4D_Scoreboard_Opponent_Map"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "center"
	}

	RescueMap
	{
		"fieldname"            "RescueMap"
		"controlName"          "Label"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "368"
		"ypos"                 "150"
		"wide"                 "80"
		"tall"                 "12"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"brighttext"           "1"
		"dulltext"             "0"
		"font"                 "DefaultDropShadow"
		"labelText"            "#L4D_Scoreboard_Rescue_Map"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "center"
	}

	RescueMapArrow
	{
		"fieldname"            "RescueMapArrow"
		"controlName"          "Label"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "368"
		"ypos"                 "143"
		"wide"                 "60"
		"tall"                 "12"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"brighttext"           "1"
		"dulltext"             "0"
		"fgcolor_override"     "White"
		"font"                 "GameUIButtons"
		"labelText"            "r"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "center"
	}

	scores
	{
		"fieldname"              "scores"
		"controlName"            "CClientScoreBoardDialog"
		"visible"                "0"
		"enabled"                "1"
		"xpos"                   "0"
		"ypos"                   "42"
		"wide"                   "f0"
		"tall"                   "480"
		"autoResize"             "0"
		"infected_avatar_size"   "24"
		"infected_death_width"   "30"
		"infected_name_width"    "110"
		"infected_ping_width"    "30"
		"infected_score_width"   "30"
		"infected_status_width"  "30"
		"pinCorner"              "0"
		"scoreboard_position"    "north-west"
		"tabPosition"            "0"
	}

	ServerName
	{
		"fieldname"         "ServerName"
		"controlName"       "Label"
		"visible"           "0"
		"enabled"           "1"
		"xpos"              "20"
		"ypos"              "10"
		"wide"              "330"
		"tall"              "24"
		"autoResize"        "0"
		"brighttext"        "1"
		"dulltext"          "0"
		"fgcolor_override"  "White"
		"font"              "FrameTitle"
		"labelText"         ""
		"pinCorner"         "0"
		"textAlignment"     "north-west"
	}

	Spectators
	{
		"fieldname"         "Spectators"
		"controlName"       "Label"
		"visible"           "1"
		"enabled"           "1"
		"xpos"              "20"
		"ypos"              "c130"
		"zpos"              "1"
		"wide"              "0"
		"tall"              "20"
		"usetitlesafe"      "1"
		"autoResize"        "0"
		"font"              "ScoreboardVerySmall"
		"labelText"         "%spectators%"
		"noshortcutsyntax"  "1"
		"pinCorner"         "0"
		"textAlignment"     "west"
	}

	Survivor1
	{
		"fieldname"     "Survivor1"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c-95"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "80"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	Survivor2
	{
		"fieldname"     "Survivor2"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c-65"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "80"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	Survivor3
	{
		"fieldname"     "Survivor3"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c-35"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "80"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	Survivor4
	{
		"fieldname"     "Survivor4"
		"controlName"   "DontAutoCreate"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "20"
		"ypos"          "c-5"
		"zpos"          "1"
		"wide"          "300"
		"tall"          "80"
		"usetitlesafe"  "1"
		"autoResize"    "0"
		"pinCorner"     "0"
		"tabPosition"   "0"
	}

	ThirdPartyServerPanel
	{
		"fieldname"    "ThirdPartyServerPanel"
		"controlName"  "CThirdPartyServerPanel"
		"visible"      "0"
		"enabled"      "1"
		"xpos"         "r300"
		"ypos"         "15"
		"wide"         "300"
		"tall"         "130"
	}

	VoteKickButton
	{
		"fieldname"            "VoteKickButton"
		"controlName"          "Label"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "65"
		"ypos"                 "r80"
		"wide"                 "24"
		"tall"                 "24"
		"PaintBackgroundType"  "0"
		"autoResize"           "0"
		"brighttext"           "1"
		"dulltext"             "0"
		"font"                 "GameUIButtons"
		"labelText"            "#GameUI_Icons_X_3DButton"
		"pinCorner"            "0"
		"tabPosition"          "0"
		"textAlignment"        "center"
	}

	VoteKickLabel
	{
		"fieldname"      "VoteKickLabel"
		"controlName"    "Label"
		"visible"        "1"
		"enabled"        "1"
		"xpos"           "90"
		"ypos"           "r80"
		"wide"           "300"
		"tall"           "24"
		"autoResize"     "0"
		"brighttext"     "0"
		"dulltext"       "0"
		"font"           "DefaultLarge"
		"labelText"      "#L4D_Scoreboard_Vote_Kick"
		"pinCorner"      "0"
		"textAlignment"  "west"
	}
}
