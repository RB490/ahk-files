
"Resource/UI/ScavengeModeEmbeddedScoreboard.res"
{
	"CenterBackgroundImage"
	{
		"ControlName"	"Panel"
		"fieldName"		"CenterBackgroundImage"
		"xpos"			"0"
		"ypos"			"57"
		"wide"			"263"
		"tall"			"64"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"bgcolor_override"		"0 0 0 220"
	}
	"CenterBackgroundFill"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"CenterBackgroundFill"
		"xpos"				"0"
		"ypos"				"57"
		"wide"				"263"
		"tall"				"20"
		"scaleImage"		"1"
		"visible"			"1"
		"enabled"			"1"
		"fillcolor" 		"0 0 0 150"
		"zpos"				"-2"
	}
	"RoundLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"RoundLabel"
		"xpos"		"25"
		"ypos"		"55"
		"wide"		"200"
		"tall"		"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_Scavenge_Round_Current"
		"textAlignment"		"west"
		"font"		"MenuSubTitle"
		"fgcolor_override"	"MediumGray"
	}
	"RoundLimitLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"RoundLimitLabel"
		"xpos"		"41"
		"ypos"		"55"
		"wide"		"200"
		"tall"		"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_Scavenge_RoundLimit"
		"textAlignment"		"east"
		"font"		"MenuSubTitle"
		"fgcolor_override"	"MediumGray"
	}
	"ScoreBackgroundImage"
	{
		"ControlName"	"Panel"
		"fieldName"		"ScoreBackgroundImage"
		"xpos"			"0"
		"ypos"			"79"
		"wide"			"263"
		"tall"			"43"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"alpha"			"212"
		"bgcolor_override" 		"0 0 0 220"
		"zpos"			"10"
	}
	"YourTeamLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"YourTeamLabel"
		"xpos"		"25"	[$WIN32]
		"ypos"		"82"	[$WIN32]
		"xpos"		"2"		[$X360]
		"ypos"		"0"		[$X360]
		"wide"		"200"
		"tall"		"16"
		"visible"		"1"
		"labelText"		"#L4D_Scavenge_YourTeam"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"White"
		"pin_to_sibling"		"XboxIconYourTeam"		[$X360]
		"pin_corner_to_sibling"	"0"						[$X360]
		"pin_to_sibling_corner"	"1"						[$X360]
	}
	"EnemyTeamLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"EnemyTeamLabel"
		"xpos"		"25"	[$WIN32]
		"ypos"		"102"	[$WIN32]
		"xpos"		"2"		[$X360]
		"ypos"		"0"		[$X360]
		"wide"		"200"
		"tall"		"16"
		"visible"		"1"
		"labelText"		"#L4D_Scavenge_Opponent"
		"textAlignment"		"west"
		"font"		"PlayerDisplayName"
		"fgcolor_override"	"White"
		"pin_to_sibling"		"XboxIconEnemyTeam"		[$X360]
		"pin_corner_to_sibling"	"0"						[$X360]
		"pin_to_sibling_corner"	"1"						[$X360]
	}
	"Round1Panel"
	{
		"ControlName"	"CScavengeRoundPanel"
		"fieldName"		"Round1Panel"
		"xpos"			"100"
		"ypos"			"79"
		"wide"			"24"
		"tall"			"44"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"15"
	}
	"Round2Panel"
	{
		"ControlName"	"CScavengeRoundPanel"
		"fieldName"		"Round2Panel"
		"xpos"			"121"
		"ypos"			"79"
		"wide"			"24"
		"tall"			"44"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"15"
	}
	"Round3Panel"
	{
		"ControlName"	"CScavengeRoundPanel"
		"fieldName"		"Round3Panel"
		"xpos"			"142"
		"ypos"			"79"
		"wide"			"24"
		"tall"			"44"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"15"
	}
	"Round4Panel"
	{
		"ControlName"	"CScavengeRoundPanel"
		"fieldName"		"Round4Panel"
		"xpos"			"163"
		"ypos"			"79"
		"wide"			"24"
		"tall"			"44"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"15"
	}
	"Round5Panel"
	{
		"ControlName"	"CScavengeRoundPanel"
		"fieldName"		"Round5Panel"
		"xpos"			"184"
		"ypos"			"79"
		"wide"			"24"
		"tall"			"44"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"15"
	}
	"FinalScorePanel"
	{
		"ControlName"	"CScavengeRoundPanel"
		"fieldName"		"FinalScorePanel"
		"xpos"			"275"
		"ypos"			"78"
		"wide"			"24"
		"tall"			"44"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"15"
	}
}