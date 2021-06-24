"Resource/UI/TransitionStatsSurvivor.res"
{
	"transition_stats"
	{
		"ControlName"	"CTransitionStatsPanel"
		"fieldName"		"transition_stats"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"f0"
		"tall"			"480"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"		
		
		"statpanel_y_in_vsmode"		"225"
	}

	"HeaderBackground"
	{
		"ControlName"	"Panel"
		"fieldName"		"HeaderBackground"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"f0"
		"tall"			"60"	[$WIN32]
		"tall"			"80"	[$X360]
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"bgcolor_override"	"DarkerGray"
		"zpos"			"-2"
		"paintbackground"	"1"
	}
	
	"HeaderBorder"
	{
		"ControlName"		"Panel"
		"fieldName"		"HeaderBorder"
		"xpos"		"0"
		"ypos"		"60"	[$WIN32]
		"ypos"		"80"	[$X360]
		"wide"		"f0"
		"tall"		"2"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"bgcolor_override"	"DarkGray"
		"paintbackground"	"1"
	}

	"ClockIcon"
	{
		"ControlName"	"CIconPanel"
		"fieldName"		"ClockIcon"
		"icon"			"clock_1"
		"xpos"			"10"
		"ypos"			"15"
		"wide"			"24"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"scaleimage"	"1"
		"PaintBackgroundType"	"0"
		"usetitlesafe"	"1"
	}
	
	"WorkingAnim"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"WorkingAnim"
		"xpos"					"r45"
		"ypos"					"5"
		"zpos"					"5"
		"wide"					"40"
		"tall"					"40"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"usetitlesafe"			"1"
		"scaleImage"			"1"
		"image"					"common/l4d_spinner"
		"frame"					"0"
	}
	
	"LoadingText"
	{
		"ControlName"			"Label"
		"fieldName"				"LoadingText"
		"xpos"					"r250"
		"ypos"					"15"
		"zpos"					"5"
		"wide"					"200"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"Font"					"DefaultLarge"
		"labelText"				"#L4D360UI_Loading"
		"textAlignment"			"east"
		"usetitlesafe"			"1"
	}

	"CheckpointCleared"
	{
		"ControlName"	"Label"
		"fieldName"		"CheckpointCleared"
		"xpos"		"45"
		"ypos"		"15"
		"wide"		"300" [$ENGLISH]
		"wide"		"500" [$!ENGLISH]
		"tall"		"24"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_ReportScreen_Title_Safe"
		"textAlignment"		"north-west"
		"dulltext"		"0"
		"brighttext"		"0"
		"fgcolor_override"	"White"
		"font"		"TransitionTitle"
		"usetitlesafe"	"1"
	}

	"NextMap"
	{
		"ControlName"		"Label"
		"fieldName"		"NextMap"
		"xpos"		"45"
		"ypos"		"40"
		"wide"		"300" [$ENGLISH]
		"wide"		"500" [$!ENGLISH]
		"tall"		"15"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"		"south-west"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"fgcolor_override"	"MediumGray"
		"font"		"Default"
		"usetitlesafe"	"1"
	}

	"SurvivorHighlightStatsPanel"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"			"SurvivorHighlightStatsPanel"
		"xpos"				"c-207" [$ENGLISH]
		"xpos"				"c-270" [$!ENGLISH]
		"ypos"				"160"
		"wide"				"425" [$ENGLISH]
		"wide"				"540" [$!ENGLISH]
		"tall"				"140"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"paintbackground"	"0"
	}
	
	"CVersusModeScoreboard" [$WIN32]
	{
		"ControlName"	"CVersusModeScoreboard"
		"fieldName"		"VersusModeScoreboard"
		"xpos"			"c-177" [$ENGLISH]
		"xpos"			"c-182" [$!ENGLISH]
		"ypos"			"85"
		"wide"			"354" [$ENGLISH]
		"wide"			"364" [$!ENGLISH]
		"tall"			"120"
		"visible"		"1"
		"enabled"		"1"
	}

	"CVersusModeScoreboard" [$X360]
	{
		"ControlName"	"CVersusModeScoreboard"
		"fieldName"		"VersusModeScoreboard"
		"xpos"			"c-177"
		"ypos"			"95"
		"wide"			"354"
		"tall"			"120"
		"visible"		"1"
		"enabled"		"1"
	}

	"FooterBackground"
	{
		"ControlName"		"Panel"
		"fieldName"			"FooterBackground"
		"xpos"				"0"
		"ypos"				"r95"	[$WIN32]
		"ypos"				"r118"	[$X360]
		"wide"				"f0"
		"tall"				"f0"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"bgcolor_override"	"DarkerGray"
		"zpos"				"-2"
	}
	
	"FooterBorder"
	{
		"ControlName"		"Panel"
		"fieldName"			"FooterBorder"
		"xpos"				"0"
		"ypos"				"r97"	[$WIN32]
		"ypos"				"r119"	[$X360]
		"wide"				"f0"
		"tall"				"2"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"bgcolor_override"	"DarkGray"
		"paintbackground"	"1"
	}

	"Survivor1"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"			"Survivor1"
		"xpos"				"10"
		"ypos"				"r112"
		"wide"				"140"
		"tall"				"70"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"zpos"				"55"
		"usetitlesafe"		"1"
	}

	"Survivor2"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"			"Survivor2"
		"xpos"				"150"
		"ypos"				"r112"
		"wide"				"140"
		"tall"				"70"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"zpos"				"55"
		"usetitlesafe"		"1"
	}

	"Survivor3"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"			"Survivor3"
		"xpos"				"290"
		"ypos"				"r112"
		"wide"				"140"
		"tall"				"70"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"zpos"				"55"
		"usetitlesafe"		"1"
	}

	"Survivor4"
	{
		"ControlName"		"DontAutoCreate"
		"fieldName"			"Survivor4"
		"xpos"				"440"
		"ypos"				"r112"
		"wide"				"140"
		"tall"				"70"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"zpos"				"55"
		"usetitlesafe"		"1"
	}

	"TipPanel"
	{
		"fieldName"			"TipPanel"
		"xpos"				"4"
		"ypos"				"r50"
		"wide"				"500" [$WIN32]
		"wide"				"400" [$X360]
		"tall"				"100"
		"visible"			"1"
		"enabled"			"1"
		"autoResize"		"1"
		"scaleimage"		"1"
		"zpos"				"50"
		"usetitlesafe"		"1"
	}
}
