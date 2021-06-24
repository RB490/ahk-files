"Resource/UI/ZombiePanel.res"
{
	"TooFarFromSurvivors"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"TooFarFromSurvivors"
		"xpos"			"10"
		"ypos"			"5"
		"zpos"			"1"
		"wide"			"300"
		"tall"			"95" [$WIN32]
		"tall"			"110" [$X360]
		"visible"		"0"
		"enabled"		"1"
		
		"TooFarTitle"
		{
			"ControlName"	"Label"
			"fieldName"		"TooFarTitle"
			"xpos"			"90"
			"ypos"			"9"
			"zpos"			"1"
			"wide"			"200"
			"tall"			"35" [$WIN32]
			"tall"			"42" [$X360]
			"visible"		"1"
			"enabled"		"1"
			"textAlignment"	"west"	
			"labelText"		"#L4D_Zombie_UI_Too_Far"
			"font"				"FrameTitle"
			"fgcolor_override"	"192 192 192 255"
			"wrap"			"1"
		}
		"TooFarText"
		{
			"ControlName"	"Label"
			"fieldName"		"TooFarText"
			"zpos"			"1"
			"ypos"			"44" [$WIN32]
			"tall"			"40" [$WIN32]
			"ypos"			"59" [$X360]
			"tall"			"40" [$X360]
			"visible"		"1"
			"enabled"		"1"
			"textAlignment"	"west"	
			"labelText"		"#L4D_Zombie_UI_To_Be_Moved"
			"font"				"DefaultMedium" [$WIN32]
			"font"				"DefaultLarge" [$X360]
			"fgcolor_override"	"192 192 192 255"
			"wrap"			"1"
		}	
		"SurvivorsImage"
		{
			"ControlName"	"CIconPanel"
			"fieldName"		"SurvivorsImage"
			"xpos"			"0"
			"ypos"			"5"
			"zpos"			"1"
			"wide"			"85"
			"tall"			"85"
			"visible"		"1"
			"enabled"		"1"
			"scaleImage"	"1"
			"image"			"tip_crouch"
		}
		"UseBind"
		{
			"ControlName"	"CBindPanel"
			"fieldName"		"UseBind"
			"xpos"			"87"
			"ypos"			"53" [$WIN32]
			"ypos"			"65" [$X360]
			"zpos"			"1"
			"visible"		"1"
			"enabled"		"1"
		}
		"Background"
		{
			"ControlName"	"Panel"
			"fieldName"		"Background"
			"xpos"			"0"
			"ypos"			"0"
			"zpos"			"0"
			"wide"			"300"
			"tall"			"95" [$WIN32]
			"tall"			"110" [$X360]
			"visible"		"1"
			"enabled"		"1"
			"PaintBackgroundType"	"2"
			"bgcolor_override"	"0 0 0 245"
		}
	}
	
	"TankTakeover"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"TankTakeover"
		"xpos"			"10"
		"ypos"			"5"
		"zpos"			"1"
		"wide"			"300"
		"tall"			"98" [$WIN32]
		"tall"			"105" [$X360]
		"visible"		"0"
		"enabled"		"1"
		
		"Title"
		{
			"ControlName"	"Label"
			"fieldName"		"Title"
			"xpos"			"90"
			"ypos"			"9"
			"zpos"			"1"
			"wide"			"200"
			"tall"			"35" [$WIN32]
			"tall"			"42" [$X360]
			"visible"		"1"
			"enabled"		"1"
			"textAlignment"	"west"	
			"labelText"		"%tanktitle%"
			"font"				"FrameTitle"
			"fgcolor_override"	"192 192 192 255"
			"wrap"			"1"
		}
		"Text"
		{
			"ControlName"	"Label"
			"fieldName"		"Text"
			"xpos"			"95"
			"ypos"			"44" [$WIN32]
			"ypos"			"55" [$X360]
			"zpos"			"1"
			"wide"			"150"
			"tall"			"40" [$WIN32]
			"tall"			"40" [$X360]
			"visible"		"1"
			"enabled"		"1"
			"textAlignment"	"west"	
			"labelText"		"%tanktext%"
			"font"				"DefaultMedium" [$WIN32]
			"font"				"DefaultLarge" [$X360]
			"fgcolor_override"	"192 192 192 255"
			"wrap"			"1"
		}	
		"TankImage"
		{
			"ControlName"	"CIconPanel"
			"fieldName"		"TankImage"
			"xpos"			"5"
			"ypos"			"5"
			"zpos"			"1"
			"wide"			"85"
			"tall"			"85"
			"visible"		"1"
			"enabled"		"1"
			"scaleImage"	"1"
			"image"			"tip_tank_incap"
		}
		"Background"
		{
			"ControlName"	"Panel"
			"fieldName"		"Background"
			"xpos"			"0"
			"ypos"			"0"
			"zpos"			"0"
			"wide"			"300"
			"tall"			"98" [$WIN32]
			"tall"			"105" [$X360]
			"visible"		"1"
			"enabled"		"1"
			"PaintBackgroundType"	"2"
			"bgcolor_override"	"0 0 0 245"
		}
	}
}