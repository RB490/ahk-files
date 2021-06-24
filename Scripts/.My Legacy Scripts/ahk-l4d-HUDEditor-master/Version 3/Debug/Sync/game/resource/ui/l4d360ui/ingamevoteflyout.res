"Resource/UI/InGameOptionsFlyout.res"
{
	"PnlBackground"
	{
		"ControlName"		"Panel"
		"fieldName"			"PnlBackground"
		"xpos"				"0"
		"ypos"				"0"
		"zpos"				"-1"
		"wide"				"156"
		"tall"				"125"
		"visible"			"1"
		"enabled"			"1"
		"paintbackground"	"1"
		"paintborder"		"1"
	}

	"BtnReturnToLobby"
	{
		"ControlName"		"L4D360HybridButton"
		"fieldName"			"BtnReturnToLobby"
		"xpos"				"0"
		"ypos"				"0" 
		"wide"				"150"
		"tall"				"20"
		"autoResize"		"1"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"navUp"				"BtnChangeAllTalk"
		"navDown"			"BtnChangeDifficulty"
		"tooltiptext"		"#L4D360UI_ReturnToLobby_Tip"
		"labelText"			"#L4D360UI_ReturnToLobby"
		"style"				"FlyoutMenuButton"
		"command"			"ReturnToLobby"
	}

	"BtnChangeDifficulty"
	{
		"ControlName"		"L4D360HybridButton"
		"fieldName"			"BtnChangeDifficulty"
		"xpos"				"0"
		"ypos"				"20"
		"wide"				"150"
		"tall"				"20"
		"autoResize"		"1"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"navUp"				"BtnReturnToLobby"
		"navDown"			"BtnChangeScenario"
		"tooltiptext"		"#L4D360UI_ChangeDifficulty_Tip"
		"labelText"			"#L4D360UI_ChangeDifficulty"
		"style"				"FlyoutMenuButton"
		"command"			"ChangeDifficulty"
	}
	
	"BtnChangeScenario"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnChangeScenario"
		"xpos"					"0"
		"ypos"					"40"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnChangeDifficulty"
		"navDown"				"BtnRestartScenario"
		"tooltiptext"			"#L4D360UI_ChangeScenario_Tip"
		"labelText"				"#L4D360UI_ChangeScenario"
		"style"					"FlyoutMenuButton"
		"command"				"ChangeScenario"
		"EnableCondition"					"Never" [$DEMO]
	}

	"BtnRestartScenario"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnRestartScenario"
		"xpos"					"0"
		"ypos"					"60"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnChangeScenario"
		"navDown"				"BtnBootPlayer"
		"tooltiptext"			"#L4D360UI_RestartScenario_Tip"
		"labelText"				"#L4D360UI_RestartScenario"
		"style"					"FlyoutMenuButton"
		"command"				"RestartScenario"
		"EnableCondition"					"Never" [$DEMO]
	}
	
	"BtnBootPlayer"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnBootPlayer"
		"xpos"					"0"
		"ypos"					"80"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnRestartScenario"
		"navDown"				"BtnChangeAllTalk"
		"tooltiptext"			"#L4D360UI_BootPlayer_Tip"
		"labelText"				"#L4D360UI_BootPlayer"
		"style"					"FlyoutMenuButton"
		"command"				"BootPlayer"
	}
	
	"BtnChangeAllTalk"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnChangeAllTalk"
		"xpos"					"0"
		"ypos"					"100"
		"wide"					"150"
		"tall"					"20"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"0"
		"tabPosition"			"0"
		"navUp"					"BtnBootPlayer"
		"navDown"				"BtnReturnToLobby"
		"tooltiptext"			"#L4D360UI_ChangeAllTalk_Tip"
		"labelText"				"#L4D360UI_ChangeAllTalk"
		"style"					"FlyoutMenuButton"
		"command"				"ChangeAllTalk"
		"EnableCondition"		"Never" [$DEMO]
	}	
}