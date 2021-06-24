"Resource/UI/SpawnSmokerMenu.res"
{
	"spawn_smoker"
	{
		"ControlName"	"Frame"
		"fieldName"		"spawn_smoker"
		"xpos"				"c-150"
		"ypos"				"c-90"
		"wide"				"300"
		"tall"				"205"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"padding"			"2"
		
		"if_split_screen_bottom"
		{
			"ypos"		"c-110"
		}
	}
	"Background"
	{
		"ControlName"			"Panel"
		"fieldName"				"Background"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"0"
		"wide"					"300"
		"tall"					"205"
		"visible"				"1"
		"enabled"				"1"
		"PaintBackgroundType"	"2"
		"bgcolor_override"		"0 0 0 245"
	}		
	"InfectedClass"
	{
		"ControlName"	"Label"
		"fieldName"		"InfectedClass"
		"xpos"			"10"
		"ypos"			"5"
		"zpos"			"1"
		"wide"			"170"
		"tall"			"20"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_spawn_select_mode_class_SMOKER"
		"textAlignment"	"north-west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"FrameTitle"
	}
	"ActionPrimaryLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"ActionPrimaryLabel"
		"xpos"			"10"
		"ypos"			"28"
		"zpos"			"2"
		"wide"			"130"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"#L4D_spawn_select_mode_smoker_1_title" [$WIN32]
		"labelText"		"#L4D_spawn_select_mode_smoker_2_title" [$X360]
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"0"
		"Font"			"default"
		"wrap"			"0"
	}
	"ActionSecondaryLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"ActionSecondaryLabel"
		"xpos"			"160"
		"ypos"			"28"
		"zpos"			"2"
		"wide"			"130"
		"tall"			"12"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"#L4D_spawn_select_mode_smoker_2_title" [$WIN32]
		"labelText"		"#L4D_spawn_select_mode_smoker_1_title" [$X360]
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"0"
		"Font"			"default"
		"wrap"			"0"
	}
	"PrimaryFrame"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"PrimaryFrame"
		"xpos"			"25"
		"ypos"			"40"
		"zpos"			"1"
		"wide"			"100"
		"tall"			"100"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineGrey"
		
		"src_corner_height"		"8"				// pixels inside the image
		"src_corner_width"		"8"
			
		"draw_corner_width"		"4"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"4"	
	}
	"PrimaryIcon"
	{
		"ControlName"		"CIconPanel"
		"fieldName"			"PrimaryIcon"
		"icon"				"tip_smoker_pull" [$WIN32]
		"icon"				"tip_smoker_swipe" [$X360]
		"xpos"				"30"
		"ypos"				"45"
		"zpos"				"2"
		"wide"				"90"
		"tall"				"90"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleimage"		"1"
		"iconcolor"			"255 255 255 255"
	}
	"MeleeFrame"
	{
		"ControlName"	"ScalableImagePanel"
		"fieldName"		"MeleeFrame"
		"xpos"			"175"
		"ypos"			"40"
		"zpos"			"1"
		"wide"			"100"
		"tall"			"100"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"image"			"../vgui/hud/ScalablePanel_bgBlack_outlineGrey"
		
		"src_corner_height"		"8"				// pixels inside the image
		"src_corner_width"		"8"
			
		"draw_corner_width"		"4"				// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 	"4"	
	}
	"MeleeIcon"
	{
		"ControlName"		"CIconPanel"
		"fieldName"			"MeleeIcon"
		"icon"				"tip_smoker_swipe" [$WIN32]
		"icon"				"tip_smoker_pull" [$X360]
		"xpos"				"180"
		"ypos"				"45"
		"zpos"				"2"
		"wide"				"90"
		"tall"				"90"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"scaleimage"		"1"
		"iconcolor"			"255 255 255 255"
	}
	"ActionOneBind"
	{
		"ControlName"			"CBindPanel"
		"fieldName"				"ActionOneBind"
		"xpos"					"10"
		"ypos"					"140"
		"zpos"					"2"
		"visible"				"1"
		"enabled"				"1"
		"fgcolor_override"      "127 127 127 255"
		"scale"                 "1.0"
		"bind"					"+attack" [$WIN32]
		"bind"					"+attack2" [$X360]
	}		
	"ActionOneLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"ActionOneLabel"
		"xpos"			"10"
		"ypos"			"140"
		"zpos"			"1"
		"wide"			"130"
		"tall"			"35"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"#L4D_spawn_select_mode_smoker_1_text" [$WIN32]
		"labelText"		"#L4D_spawn_select_mode_smoker_2_text" [$X360]
		"textAlignment"	"north-west"
		"dulltext"		"0"
		"brighttext"	"0"
		"Font"			"default"
		"wrap"			"1"
	}
	"ActionTwoBind"
	{
		"ControlName"			"CBindPanel"
		"fieldName"				"ActionTwoBind"
		"xpos"					"160"
		"ypos"					"140"
		"zpos"					"2"
		"visible"				"1"
		"enabled"				"1"
		"fgcolor_override"      "127 127 127 255"
		"scale"                 "1.0"
		"bind"					"+attack2" [$WIN32]
		"bind"					"+attack" [$X360]
	}		
	"ActionTwoLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"ActionTwoLabel"
		"xpos"			"160"
		"ypos"			"140"
		"zpos"			"1"
		"wide"			"130"
		"tall"			"35"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"#L4D_spawn_select_mode_smoker_2_text" [$WIN32]
		"labelText"		"#L4D_spawn_select_mode_smoker_1_text" [$X360]
		"textAlignment"	"north-west"
		"dulltext"		"0"
		"brighttext"	"0"
		"Font"			"default"
		"wrap"			"1"
	}	
	"ContinueBind"
	{
		"ControlName"	"CBindPanel"
		"fieldName"		"ContinueBind"
		"xpos"			"10"
		"ypos"			"175"
		"zpos"			"2"
		"visible"		"1"
		"enabled"		"1"
		"bind"			"+attack" 
	}		
	"ContinueLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"ContinueLabel"
		"xpos"				"10"
		"ypos"				"175"
		"zpos"				"2"
		"wide"				"100"
		"tall"				"25"
		"visible"			"1"
		"enabled"			"1"
		"textAlignment"		"west"	
		"labelText"			"#L4D_btn_continue"
		"font"				"DefaultMedium" [$WIN32]
		"font"				"DefaultLarge" [$X360]
		"wrap"				"0"
	}	
}
