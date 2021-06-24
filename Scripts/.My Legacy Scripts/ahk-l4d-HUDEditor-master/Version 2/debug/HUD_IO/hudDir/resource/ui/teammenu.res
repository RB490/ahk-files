
"Resource/UI/TeamMenu.res"
{
	"team"
	{
		"ControlName"		"CTeamMenu"
		"fieldName"		"team"
		"xpos"			"c-163"
		"ypos"			"c-40"
		"wide"			"430"
		"tall"			"230"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"PaintBackgroundType"	"2"
	}
	"BackgroundFill_1"
	{
		"ControlName"		"Panel"
		"fieldName"			"BackgroundFill_1"
		"xpos"				"85"
		"ypos"				"69"
		"wide"				"152"
		"tall"				"75"
		"visible"			"1"
		"enabled"			"1"
		"bgcolor_override" 		"0 0 0 220"
		"zpos"				"-5"
	}
	"BackgroundFill_2"
	{
		"ControlName"		"Panel"
		"fieldName"			"BackgroundFill_2"
		"xpos"				"85"
		"ypos"				"87"
		"wide"				"152"
		"tall"				"57"
		"visible"			"1"
		"enabled"			"1"
		"bgcolor_override" 		"0 0 0 220"
		"zpos"				"-5"
	}
	"FullTitle"
	{
		"ControlName"	"Label"
		"fieldName"		"FullTitle"
		"xpos"			"3389"
		"ypos"			"50"
		"wide"			"420"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_spectator_select_side"
		"textAlignment"	"north-west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"FrameTitle"
	}
	"NoSwitchTitle"
	{
		"ControlName"	"Label"
		"fieldName"		"NoSwitchTitle"
		"xpos"			"84"
		"ypos"			"67"
		"wide"			"153"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_spectator_cant_change_teams"
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"HudAmmoLargeShadow16"
	}
	"NoSwitchLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"NoSwitchLabel"
		"xpos"			"89"
		"ypos"			"55"
		"wide"			"152"
		"tall"			"100"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"wrap"			"1"
		"labelText"		"#L4D_spectator_select_side"
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"DefaultMedium"
		"wrap"			"1"
	}
	"SurvivorBackground"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"SurvivorBackground"
		"xpos"			"85"
		"ypos"			"69"
		"zpos"			"1"
		"wide"			"75"
		"tall"			"75"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"autoResize"	"0"
		"pinCorner"		"0"
		"image"			"select_survivors"
		"zpos"			"-1"
	}
	"SurvivorFullBackground"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"SurvivorFullBackground"
		"xpos"			"85"
		"ypos"			"69"
		"zpos"			"1"
		"wide"			"75"
		"tall"			"75"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"autoResize"	"0"
		"pinCorner"		"0"
		"image"			"select_survivors"
		"drawcolor"		"100 100 100 255"
		"zpos"			"-1"
	}
	"SurvivorButton"
	{
		"ControlName"		"Button"
		"fieldName"		"SurvivorButton"
		"xpos"			"85"
		"ypos"			"69"
		"zpos"			"2"
		"wide"			"75"
		"tall"			"75"
		"autoResize"	"1"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"2"
		"labelText"		""
		"dulltext"		"0"
		"brighttext"	"0"
		"wrap"			"0"
		"Command"		"survivor"
		"Default"		"0"
		"selected"		"0"
		"defaultBgColor_override"	"0 0 0 165"
		"armedBgColor_override"		"0 0 0 0"
		"depressedBgColor_override"	"0 0 0 0"
	}
	"SurvivorFullLabel"
	{
		"ControlName"	"Label"
		"fieldName"		"SurvivorFullLabel"
		"xpos"			"84"
		"ypos"			"67"
		"wide"			"153"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_team_menu_full"
		"textAlignment"	"center"
		"font"			"HudAmmoLargeShadow16"
	}
	"InfectedBackground"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"InfectedBackground"
		"xpos"			"162"
		"ypos"			"69"
		"zpos"			"1"
		"wide"			"75"
		"tall"			"75"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"autoResize"	"0"
		"pinCorner"		"0"
		"image"			"select_PZ"
		"zpos"			"-1"
	}
	"InfectedFullBackground"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"InfectedFullBackground"
		"xpos"			"162"
		"ypos"			"69"
		"zpos"			"1"
		"wide"			"75"
		"tall"			"75"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"
		"autoResize"	"0"
		"pinCorner"		"0"
		"image"			"select_PZ"
		"drawcolor"		"120 120 120 255"
	}
	"InfectedButton"
	{
		"ControlName"	"Button"
		"fieldName"		"InfectedButton"
		"xpos"			"162"
		"ypos"			"69"
		"zpos"			"2"
		"wide"			"75"
		"tall"			"75"
		"autoResize"	"1"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"2"
		"labelText"		""
		"dulltext"		"0"
		"brighttext"	"0"
		"wrap"			"0"
		"Command"		"infected"
		"Default"		"0"
		"selected"		"0"
		"defaultBgColor_override"	"0 0 0 165"
		"armedBgColor_override"		"0 0 0 0"
 		"depressedBgColor_override"	"0 0 0 0"
	}
	"InfectedFullLabel"
	{
		"ControlName"		"Label"
		"fieldName"		"InfectedFullLabel"
		"xpos"			"89"
		"ypos"			"55"
		"wide"			"152"
		"tall"			"100"
		"zpos"			"3"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#L4D_team_menu_full"
		"textAlignment"	"center"
		"font"			"DefaultMedium"
		"wrap"			"1"
	}
	"Cancel"
	{
		"ControlName"		"Button"
		"fieldName"		"Cancel"
		"xpos"		"192"
		"ypos"		"143"
		"wide"		"39"
		"tall"		"13"
		"autoResize"		"1"
		"pinCorner"		"3"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"1"
		"labelText"		"#L4D_btn_cancel"
		"textAlignment"		"center"
		"dulltext"		"0"
		"brighttext"		"0"
		"wrap"		"0"
		"Command"		"close"
		"Default"		"1"
		"selected"		"1"
	}
}