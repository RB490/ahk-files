"resource/ui/riverescapefailed.res"
{
	"info_window"
	{
		"ControlName"			"Frame"
		"fieldName"				"info_window"
		"xpos"					"c-424"
		"ypos"					"c-90"
		"wide"					"f0"
		"tall"					"110"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"PaintBackgroundType"	"2"
	}
	"BackgroundImage"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"BackgroundImage"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"400"
		"tall"			"110"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineGrey"
		"zpos"			"-2"
		"src_corner_height"		"16"
		"src_corner_width"		"16"
		"draw_corner_width"		"8"
		"draw_corner_height" 	"8"
	}
	"BackgroundFill1"
	{
		"ControlName"	"Panel"
		"fieldName"		"CUSTOM1"
		"xpos"			"215"
		"ypos"			"10"
		"wide"			"415"
		"tall"			"48"
		"zpos"			"-5"
		"visible"		"0"
		"enabled"		"1"
		"scaleImage"	"1"
		"bgcolor_override"		"0 0 0 220"
	}
	"BackgroundFill2"
	{
		"ControlName"	"Panel"
		"fieldName"		"CUSTOM2"
		"xpos"			"215"
		"ypos"			"34"
		"wide"			"415"
		"tall"			"24"
		"zpos"			"-5"
		"visible"		"0"
		"enabled"		"1"
		"scaleImage"	"1"
		"bgcolor_override"		"0 0 0 220"
	}
	"title"
	{
		"ControlName"		"Label"
		"fieldName"			"title"
		"xpos"				"-5"
		"ypos"				"10"
		"wide"				"f0"
		"tall"				"24"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			"#L4D_DL3_Finale_Failed_Title"
		"textAlignment"		"center"
		"dulltext"			"0"
		"brighttext"		"0"
		"font"				"ink_shadow_25"
	}
	"text"
	{
		"ControlName"		"Label"
		"fieldName"			"text"
		"xpos"				"-5"
		"ypos"				"34"
		"wide"				"f0"
		"tall"				"24"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"#L4D_DL3_Finale_Failed_Msg"
		"textAlignment"		"center"
		"dulltext"			"0"
		"brighttext"		"0"
		"font"				"ink_shadow_20"
		"wrap"				"0"
		"fgcolor_override"	"255 32 0 255"
	}
}