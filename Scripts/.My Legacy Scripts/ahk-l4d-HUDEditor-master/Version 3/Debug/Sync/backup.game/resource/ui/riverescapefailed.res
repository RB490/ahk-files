"resource/ui/riverescapefailed.res"
{
	"info_window"
	{
		"ControlName"			"Frame"
		"fieldName"				"info_window"
		"xpos"					"c-200"
		"ypos"					"c-90"
		"wide"					"400"
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
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineGrey"
		"zpos"			"-2"
		
		"src_corner_height"		"16"				// pixels inside the image
		"src_corner_width"		"16"
			
		"draw_corner_width"		"8"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"8"	
	}

	"title"
	{
		"ControlName"		"Label"
		"fieldName"			"title"
		"xpos"				"13"
		"ypos"				"11"
		"wide"				"300"
		"tall"				"24"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"labelText"			"#L4D_DL3_Finale_Failed_Title"
		"textAlignment"		"north-center"
		"dulltext"			"0"
		"brighttext"		"0"
		"font"				"MenuTitle"
	}

	"text"
	{
		"ControlName"		"Label"
		"fieldName"			"text"
		"xpos"				"20"
		"ypos"				"36"
		"wide"				"370"
		"tall"				"60"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"#L4D_DL3_Escape_Failed_Msg"
		"textAlignment"		"center"
		"dulltext"			"0"
		"brighttext"		"0"
		"Font"				"MenuTitle"
		"wrap"				"1"
		"fgcolor_override"	"255 32 0 255"
	}

}
