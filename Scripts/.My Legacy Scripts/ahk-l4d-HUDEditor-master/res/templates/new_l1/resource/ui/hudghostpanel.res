"Resource/UI/HudGhostPanel.res"
{
	"Background"
	{
		"ControlName"			"Panel"
		"fieldName"				"Background"
		"xpos"					"10"
		"ypos"					"5"
		"zpos"					"0"
		"wide"					"330"
		"tall"					"110"
		"visible"				"1"
		"enabled"				"1"
		"PaintBackgroundType"	"2"
		"bgcolor_override"		"0 0 0 245"
	}		
	"ClassImage"
	{
		"ControlName"		"CIconPanel"
		"fieldName"			"ClassImage"
		"xpos"				"15"
		"ypos"				"10"
		"zpos"				"1"
		"wide"				"85"
		"tall"				"85"
		"visible"			"1"
		"enabled"			"1"
		"scaleImage"		"1"
		"image"				"tip_boomer"
	}
	"ClassName"
	{
		"ControlName"		"Label"
		"fieldName"			"ClassName"
		"xpos"				"95"
		"ypos"				"15"
		"zpos"				"1"
		"wide"				"230"
		"tall"				"18"
		"visible"			"1"
		"enabled"			"1"
		"textAlignment"		"west"	
		"labelText"			"%classname%"
		"font"				"FrameTitle"
		"wrap"				"0"
	}
	"SelectSpawn"
	{
		"ControlName"		"Label"
		"fieldName"			"SelectSpawn"
		"xpos"				"95"
		"ypos"				"35"
		"zpos"				"1"
		"wide"				"230"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"textAlignment"		"west"	
		"labelText"			"#L4D_spawn_select_mode_title"
		"font"				"DefaultMedium" [$WIN32]
		"font"				"DefaultLarge" [$X360]
		"wrap"				"0"
	}
	"Ready"
	{
		"ControlName"		"Label"
		"fieldName"			"Ready"
		"xpos"				"95"
		"ypos"				"52"
		"zpos"				"1"
		"wide"				"240"
		"tall"				"30"
		"visible"			"1"
		"enabled"			"1"
		"textAlignment"		"north-west"	
		"labelText"			"%ready%"
		"font"				"DefaultMedium" [$WIN32]
		"font"				"DefaultLarge" [$X360]
		"wrap"				"1"
	}
	"Info"
	{
		"ControlName"		"Label"
		"fieldName"			"Info"
		"xpos"				"95"
		"ypos"				"70"
		"zpos"				"1"
		"wide"				"230"
		"tall"				"30"
		"visible"			"1"
		"enabled"			"1"
		"textAlignment"		"north-west"	
		"labelText"			"%info%"
		"font"				"DefaultMedium" [$WIN32]
		"font"				"DefaultLarge" [$X360]
		"wrap"				"1"
	}
	"SpawnBind"
	{
		"ControlName"	"CBindPanel"
		"fieldName"		"SpawnBind"
		"xpos"			"105"
		"ypos"			"75"
		"zpos"			"2"
		"visible"		"1"
		"enabled"		"1"
	}		
	"SpawnLabel"
	{
		"ControlName"		"Label"
		"fieldName"			"SpawnLabel"
		"xpos"				"95"
		"ypos"				"75"
		"zpos"				"1"
		"wide"				"230"
		"tall"				"25"
		"visible"			"1"
		"enabled"			"1"
		"textAlignment"		"west"	
		"labelText"			"#L4D_Zombie_UI_Press_Fire_To_Play"
		"font"				"DefaultMedium" [$WIN32]
		"font"				"DefaultLarge" [$X360]
		"wrap"				"1"
	}	
}
