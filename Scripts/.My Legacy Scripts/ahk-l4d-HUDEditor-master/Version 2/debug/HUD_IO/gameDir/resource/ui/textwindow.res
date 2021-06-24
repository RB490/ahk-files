"Resource/UI/TextWindow.res"
{
	"info"
	{
		"ControlName"		"CTextWindow"
		"fieldName"		"TextWindow"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"f0"
		"tall"			"480"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"PaintBackgroundType"	"0"
		"settitlebarvisible" "0"
		"bgcolor_override"	"0 0 0 192"
		"infocus_bgcolor_override" "0 0 0 192"
		"outoffocus_bgcolor_override" "0 0 0 192"
	}

	"MessageTitle"
	{
		"ControlName"		"Label"
		"fieldName"			"MessageTitle"
		"xpos"				"c-240"
		"ypos"				"120"
		"wide"				"480"
		"tall"				"30"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			"Message Title"
		"textAlignment"		"west"
		"dulltext"			"0"
		"brighttext"		"0"
		"font"				"MainBold"
		"fgcolor_override"	"255 255 255 255"
	}
		
	"HTMLMessage"
	{
		"ControlName"	"HTML"
		"fieldName"		"HTMLMessage"
		"xpos"			"c-240"
		"ypos"			"150"
		"wide"			"480"
		"tall"			"240"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
	}
	
	// This just hides the old text message, because we're replacing it with our fancier TerrorTextMessage below.
	"TextMessage"
	{
		"ControlName"	"TextEntry"
		"fieldName"		"TextMessage"
		"visible"		"0"
		"enabled"		"0"
	}
	
	"TerrorTextMessage"
	{
		"ControlName"	"CTerrorRichText"
		"fieldName"		"TerrorTextMessage"
		"xpos"			"c-240"
		"ypos"			"150"
		"wide"			"480"
		"tall"			"240"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"northwest"
		"textHidden"	"0"
		"editable"		"0"
		"maxchars"		"-1"
	}
	
	"ok"
	{
		"ControlName"	"Button"
		"fieldName"		"ok"
		"xpos"			"c240"
		"ypos"			"400"
		"wide"			"128"
		"tall"			"20"
		"autoResize"	"0"
		"pinCorner"		"2"
		"visible"		"0"
		"enabled"		"0"
		"labelText"		"#PropertyDialog_OK"
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"0"
		"command"		"okay"
		"default"		"0"
	}
	
	"L4Dok"
	{
		"ControlName"	"L4DButton"
		"fieldName"		"L4Dok"
		"xpos"			"c-246"
		"ypos"			"420"
		"wide"			"128"
		"tall"			"20"
		"autoResize"	"0"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#PropertyDialog_OK"
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"command"		"okay"
		"default"		"1"
		"paintborder"	"0"
	}
	
	"JoinSteamGroup"
	{
		"ControlName"	"L4DButton"
		"fieldName"		"JoinSteamGroup"
		"xpos"			"c-100"
		"ypos"			"420"
		"wide"			"340"
		"tall"			"20"
		"autoResize"	"0"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_JoinSteamGroup"
		"textAlignment"	"east"
		"dulltext"		"0"
		"brighttext"	"0"
		"command"		"joinsteamgroup"
		"default"		"0"
		"paintborder"	"0"
	}
	
	"NewsKeyBind"
	{
		"ControlName"	"KeybindLabel"
		"fieldName"		"NewsKeyBind"
		"xpos"			"c-240"
		"ypos"			"400"
		"wide"			"240" [$ENGLISH]
		"wide"			"300" [!$ENGLISH]
		"tall"			"20"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		""
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"DefaultBold"
		"textcolor"		"145 145 145 255"
		"keycolor"		"255 255 255 255"
	}
	
	"ThirdPartyServerPanel"
	{
		"ControlName"	"CThirdPartyServerPanel"
		"fieldName"		"ThirdPartyServerPanel"
		"xpos"			"c-253"
		"ypos"			"0"
		"wide"			"300"
		"tall"			"120"
		"visible"		"1"		[$WIN32]
		"visible"		"0"	    [$X360]
		"enabled"		"1"
		"embedded"		"1"
	}
}
