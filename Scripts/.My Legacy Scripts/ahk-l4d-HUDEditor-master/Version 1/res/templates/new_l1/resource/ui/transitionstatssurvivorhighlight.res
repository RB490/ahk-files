"Resource/UI/TransitionStatsSurvivorHighlight.res"
{
	"BackgroundImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"410" [$ENGLISH]
		"wide"			"540" [$!ENGLISH]
		"tall"			"135"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"image"			"../vgui/hud/ScalablePanel_bgMidGrey"
		"src_corner_height"		"16"			// pixels inside the image
		"src_corner_width"		"16"
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
	}

	"HeroPortrait"
	{
		"ControlName"		"CIconPanel"
		"fieldName"			"HeroPortrait"
		"icon"				"zoey"
		"xpos"				"8"
		"ypos"				"8"
		"wide"				"120"
		"tall"				"120"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleimage"		"1"
	}

	"HighlightTitleBackground"
	{
		"ControlName"		"Panel"
		"fieldName"			"HighlightTitleBackground"
		"xpos"				"130"
		"ypos"				"8"
		"wide"				"272" [$ENGLISH]
		"wide"				"402" [$!ENGLISH]
		"tall"				"38"    [$X360]
		"tall"				"30"    [$WIN32]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"bgcolor_override"	"Blue"
		"paintbackground"	"1"
		"paintbackgroundtype" "0"
	}

	"HighlightTitle"
	{
		"ControlName"		"Label"
		"fieldName"			"HighlightTitle"
		"xpos"				"136"
		"ypos"				"7"
		"wide"				"260" [$ENGLISH]
		"wide"				"380" [$!ENGLISH]
		"tall"				"20"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"west"    [$WIN32]
		"textAlignment"		"north-west"    [$X360]
		"dulltext"			"0"
		"brighttext"		"0"
		"fgcolor_override"	"DarkerGray"
		"wrap"				"0"
		"font"				"FrameTitle"
	}

	"PlayerAwardDescription"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayerAwardDescription"
		"xpos"				"136"
		"ypos"				"24"    [$WIN32]
		"ypos"				"25"    [$X360]
		"wide"				"260" [$ENGLISH]
		"wide"				"380" [$!ENGLISH]
		"tall"				"12"
		"wrap"				"0"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"west"    [$WIN32]
		"textAlignment"		"north-west"    [$X360]
		"dulltext"			"0"
		"brighttext"		"1"
		"fgcolor_override"	"DarkerGray"
		"font"				"BodyText_small"    [$WIN32]
		"font"				"DefaultLarge"    [$X360]
	}

	"Player1Name"
	{
		"ControlName"		"Label"
		"fieldName"			"Player1Name"
		"xpos"				"135"
		"ypos"				"50"
		"wide"				"300"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"west"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player1Score"
	{
		"ControlName"		"Label"
		"fieldName"			"Player1Score"
		"xpos"				"330" [$ENGLISH]
		"xpos"				"460" [$!ENGLISH]
		"ypos"				"50"
		"wide"				"50"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"east"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player1Background"
	{
		"ControlName"		"Panel"
		"fieldName"			"Player1Background"
		"xpos"				"130"
		"ypos"				"51"
		"wide"				"272" [$ENGLISH]
		"wide"				"402" [$!ENGLISH]
		"tall"				"13"    [$WIN32]
		"tall"				"18"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"bgcolor_override"	"DarkGray"
		"paintbackground"	"1"
		"paintbackgroundtype" "0"
	}
	"Player2Name"
	{
		"ControlName"		"Label"
		"fieldName"			"Player2Name"
		"xpos"				"135"
		"ypos"				"65"    [$WIN32]
		"ypos"				"70"    [$X360]
		"wide"				"300"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"west"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player2Score"
	{
		"ControlName"		"Label"
		"fieldName"			"Player2Score"
		"xpos"				"330" [$ENGLISH]
		"xpos"				"460" [$!ENGLISH]
		"ypos"				"65"    [$WIN32]
		"ypos"				"70"    [$X360]
		"wide"				"50"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"east"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player2Background"
	{
		"ControlName"		"Panel"
		"fieldName"			"Player2Background"
		"xpos"				"130"
		"ypos"				"66"    [$WIN32]
		"ypos"				"71"    [$X360]
		"wide"				"272" [$ENGLISH]
		"wide"				"402" [$!ENGLISH]
		"tall"				"13"    [$WIN32]
		"tall"				"18"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"bgcolor_override"	"DarkGray"
		"paintbackground"	"1"
		"paintbackgroundtype" "0"
	}
	"Player3Name"
	{
		"ControlName"		"Label"
		"fieldName"			"Player3Name"
		"xpos"				"135"
		"ypos"				"80"    [$WIN32]
		"ypos"				"90"    [$X360]
		"wide"				"300"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"west"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player3Score"
	{
		"ControlName"		"Label"
		"fieldName"			"Player3Score"
		"xpos"				"330" [$ENGLISH]
		"xpos"				"460" [$!ENGLISH]
		"ypos"				"80"    [$WIN32]
		"ypos"				"90"    [$X360]
		"wide"				"50"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"east"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player3Background"
	{
		"ControlName"		"Panel"
		"fieldName"			"Player3Background"
		"xpos"				"130"
		"ypos"				"81"    [$WIN32]
		"ypos"				"91"    [$X360]
		"wide"				"272" [$ENGLISH]
		"wide"				"402" [$!ENGLISH]
		"tall"				"13"    [$WIN32]
		"tall"				"18"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"bgcolor_override"	"DarkGray"
		"paintbackground"	"1"
		"paintbackgroundtype" "0"
	}
	"Player4Name"
	{
		"ControlName"		"Label"
		"fieldName"			"Player4Name"
		"xpos"				"135"
		"ypos"				"95"    [$WIN32]
		"ypos"				"110"    [$X360]
		"wide"				"300"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"west"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player4Score"
	{
		"ControlName"		"Label"
		"fieldName"			"Player4Score"
		"xpos"				"330" [$ENGLISH]
		"xpos"				"460" [$!ENGLISH]
		"ypos"				"95"    [$WIN32]
		"ypos"				"110"    [$X360]
		"wide"				"50"
		"tall"				"15"    [$WIN32]
		"tall"				"20"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			""
		"textAlignment"		"east"
		"dulltext"			"0"
		"brighttext"		"0"
		"zpos"				"10"
		"fgcolor_override"	"Blue"
		"wrap"				"0"
		"font"				"MenuSubTitle"  [$WIN32]
		"font"				"DefaultLarge"       [$X360]
		"noshortcutsyntax"		"1"
	}
	"Player4Background"
	{
		"ControlName"		"Panel"
		"fieldName"			"Player4Background"
		"xpos"				"130"
		"ypos"				"96"    [$WIN32]
		"ypos"				"111"    [$X360]
		"wide"				"272" [$ENGLISH]
		"wide"				"402" [$!ENGLISH]
		"tall"				"13"    [$WIN32]
		"tall"				"18"    [$X360]
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"0"
		"enabled"			"1"
		"tabPosition"		"0"
		"autoresize"		"0"
		"bgcolor_override"	"DarkGray"
		"paintbackground"	"1"
		"paintbackgroundtype" "0"
	}
}
