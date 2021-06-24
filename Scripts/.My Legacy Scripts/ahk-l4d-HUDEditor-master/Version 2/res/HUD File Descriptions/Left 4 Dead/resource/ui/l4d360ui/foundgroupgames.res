"Resource/UI/FoundGroupGames.res"
{
	"FoundGroupGames"
	{
		"ControlName"					"Frame"
		"fieldName"						"FoundGroupGames"
		"xpos"							"0"
		"ypos"							"0"
		"wide"							"f0"
		"tall"							"f0"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"1"
		"enabled"						"1"
		"tabPosition"					"0"
	}
	
	"ImgBackground"
	{
		"ControlName"			"L4DMenuBackground"
		"fieldName"				"ImgBackground"
		"xpos"					"0"
		"ypos"					"119"
		"zpos"					"-1"
		"wide"					"f0"
		"tall"					"250"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"fillColor"				"0 0 0 240"
	}
	
	"ImgAvatarBG"
	{
		"ControlName"			"Panel"
		"fieldName"				"ImgAvatarBG"
		"xpos"					"c105"
		"ypos"					"149"
		"zpos"					"0"
		"wide"					"18"
		"tall"					"18"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"bgcolor_override"		"80 80 80 255"
	}
	
	"ImgSelectedAvatar"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgSelectedAvatar"
		"xpos"					"c106"
		"ypos"					"150"
		"zpos"					"1"
		"wide"					"16"
		"tall"					"16"
		"visible"				"1"
		"bgcolor_override"		"255 255 255 255"
		"scaleImage"			"1"
	}
		
	
	"DrpSelectedPlayerName"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"				"DrpSelectedPlayerName"
		"xpos"					"c125"
		"ypos"					"150"
		"zpos"					"2"
		"wide"					"250"
		"tall"					"16"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"

		"BtnSelectedPlayerName"
		{
			"ControlName"		"L4D360HybridButton"
			"fieldName"			"BtnSelectedPlayerName"
			"xpos"				"0"
			"ypos" 				"0"
			"tall"				"15"
			"wide"				"250"
			"visible"			"1"
			"enabled"			"1"
			"tabPosition"		"0"
			"style"				"MainMenuButton"
			"command"			"PlayerDropDown"
			"labelText"			""
		}
	}
	
	"FlmPlayerFlyout"
	{
		"ControlName"		"FlyoutMenu"
		"fieldName"			"FlmPlayerFlyout"
		"visible"			"0"
		"wide"				"0"
		"tall"				"0"
		"zpos"				"3"
		"InitialFocus"		"BtnSendMessage"
		"ResourceFile"		"resource/UI/L4D360UI/DropDownFoundGamesPlayer.res"
	}
	
	"FlmPlayerFlyout_NotFriend"
	{
		"ControlName"		"FlyoutMenu"
		"fieldName"			"FlmPlayerFlyout_NotFriend"
		"visible"			"0"
		"wide"				"0"
		"tall"				"0"
		"zpos"				"3"
		"InitialFocus"		"BtnViewSteamID"
		"ResourceFile"		"resource/UI/L4D360UI/DropDownFoundGamesPlayer_SteamGroup.res"
	}
					
	"ImgLevelBack"
	{
		"ControlName"			"Panel"
		"fieldName"				"ImgLevelBack"
		"xpos"					"c105"
		"ypos"					"171"
		"zpos"					"1"
		"wide"					"139"
		"tall"					"71"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"bgcolor_override"		"80 80 80 255"
	}
	
	"ImgLevelImage"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgLevelImage"
		"xpos"					"c106"
		"ypos"					"172"
		"zpos"					"2"
		"wide"					"137"
		"tall"					"69"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"maps/l4d_hospital01_apartment"
		"scaleImage"			"1"
	}	
	
	"LblCampaign"
	{
		"ControlName"					"Label"
		"fieldName"						"LblCampaign"
		"xpos"							"c105"
		"ypos"							"246"
		"zpos"							"2"
		"wide"							"200"
		"tall"							"12"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"1"
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""
		"textAlignment"					"north-west"
		"Font"							"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}
	
	"LblChapter"
	{
		"ControlName"					"Label"
		"fieldName"						"LblChapter"
		"xpos"							"c105"
		"ypos"							"257"
		"zpos"							"2"
		"wide"							"200"
		"tall"							"12"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"0"
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""
		"textAlignment"					"north-west"
		"Font"							"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}

	"LblAuthor"
	{
		"ControlName"					"Label"
		"fieldName"					"LblAuthor"
		"xpos"						"c105"
		"zpos"						"2"
		"ypos"						"268"
		"wide"						"200"
		"tall"						"12"
		"autoResize"					"0"
		"pinCorner"					"0"
		"visible"					"0"
		"enabled"					"1"
		"tabPosition"					"0"
		"labelText"					""
		"textAlignment"					"north-west"
		"Font"						"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}
	
	"LblGameStatus"
	{
		"ControlName"					"Label"
		"fieldName"						"LblGameStatus"
		"xpos"							"c105"
		"ypos"						"279"
		"zpos"							"2"
		"wide"							"200"
		"tall"							"12"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"0"
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""
		"textAlignment"					"north-west"
		"Font"							"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}
	
	"LblPlayerAccess"
	{
		"ControlName"					"Label"
		"fieldName"						"LblPlayerAccess"
		"xpos"							"c105"
		"ypos"						"290"
		"zpos"							"2"
		"wide"							"200"
		"tall"							"12"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"0"
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""
		"textAlignment"					"north-west"
		"Font"							"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}
	
	"LblGameDifficulty"
	{
		"ControlName"					"Label"
		"fieldName"						"LblGameDifficulty"
		"xpos"							"c105"
		"ypos"							"301"
		"zpos"							"2"
		"wide"							"200"
		"tall"							"12"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"0"
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""
		"textAlignment"					"north-west"
		"Font"							"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}
	
	"LblNumPlayers"
	{
		"ControlName"					"Label"
		"fieldName"						"LblNumPlayers"
		"xpos"							"c105"
		"ypos"							"312"
		"zpos"							"2"
		"wide"							"200"
		"tall"							"12"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"0"
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""
		"textAlignment"					"north-west"
		"Font"						"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}
	
	"LblNewVersion"
	{
		"ControlName"					"Label"
		"fieldName"					"LblNewVersion"
		"xpos"						"c105"
		"ypos"						"322"
		"zpos"						"2"
		"wide"						"200"
		"tall"						"12"
		"autoResize"					"0"
		"pinCorner"					"0"
		"visible"					"0"
		"enabled"					"1"
		"tabPosition"					"0"
		"labelText"					"#L4D360UI_FoundGames_DownloadNewVersion"
		"textAlignment"					"north-west"
		"Font"						"DefaultMedium"
		"fgcolor_override"				"Label.DisabledFgColor1"
	}
	
	"BtnWebsite"
	{
		"ControlName"					"L4D360HybridButton"
		"fieldName"					"BtnWebsite"
		"xpos"						"c105"
		"ypos"						"333"
		"zpos"						"2"
		"wide"						"200"
		"tall"						"15"
		"autoResize"					"0"
		"pinCorner"					"0"
		"visible"					"0"
		"enabled"					"1"
		"tabPosition"					"0"
		"command"					"Website"
		"labelText"					""
		"textAlignment"					"north-west"
		"style"						"MediumButton"
	}
	
	"BtnJoinSelected" [$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnJoinSelected"
		"xpos"					"c105"
		"ypos"					"345"
		"zpos"					"2"
		"wide"					"140"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_FoundGames_JoinGame"
		"tooltiptext"			"#L4D360UI_JoinGame"
		"style"					"RedMainButton"
		"command"				"JoinSelected"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"navLeft"				"DrpCreateGame"
		"navUp"					"GplGames"
	}
		
	"BtnDownloadSelected" [$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnDownloadSelected"
		"xpos"					"c105"
		"ypos"					"345"
		"zpos"					"2"
		"wide"					"140"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"0"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_FoundGames_DownloadAddon"
		"tooltiptext"			"#L4D360UI_FoundGames_Join_Download"
		"style"					"RedMainButton"
		"command"				"DownloadSelected"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"navLeft"				"DrpCreateGame"
		"navUp"					"GplGames"
	}
		
	"SearchingIcon"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"SearchingIcon"
		"xpos"					"c214"
		"ypos"					"25"
		"zpos"					"2"
		"wide"					"32"
		"tall"					"32"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"scaleImage"			"1"
		"image"					"common/l4d_spinner"
	}
			
	"LblNoGamesFound"
	{
		"ControlName"					"Label"
		"fieldName"						"LblNoGamesFound"
		"xpos"							"c-180"
		"ypos"							"125"
		"wide"							"380"
		"tall"							"20"
		"zpos"							"2"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"1" 
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""	//"No Campaign Games Found"
		"textAlignment"					"west"
		"Font"							"DefaultBold"
	}

	"LblSearching"
	{
		"ControlName"					"Label"
		"fieldName"						"LblSearching"
		"xpos"							"c-180"
		"ypos"							"130"
		"zpos"							"0"
		"wide"							"370"
		"tall"							"15"
		"zpos"							"2"
		"autoResize"					"0"
		"pinCorner"						"0"
		"visible"						"0" 
		"enabled"						"1"
		"tabPosition"					"0"
		"labelText"						""
		"Font"							"DefaultMedium"
	}
	
	"Divider1"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"Divider1"
		"xpos"					"c-305"
		"ypos"					"149"
		"zpos"					"1"
		"wide"					"370"
		"tall"					"2"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"divider_gradient"
		"scaleImage"			"1"
	}
	
	"Divider2"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"Divider2"
		"xpos"					"c-305"
		"ypos"					"317"
		"zpos"					"1"
		"wide"					"370"
		"tall"					"2"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"divider_gradient"
		"scaleImage"			"1"
	}
	
	
	"GplGames"
	{
		"ControlName"					"GenericPanelList"
		"fieldName"						"GplGames"
		"xpos"							"c-285"		[$X360]
		"xpos"							"c-223"		[$WIN32]
		"ypos"							"149"
		"zpos"							"0"
		"wide"							"380"		[$X360]
		"wide"							"300"		[$WIN32]
		"tall"							"170"
		"autoResize"					"1"
		"pinCorner"						"0"
		"visible"						"1"
		"enabled"						"1"
		"tabPosition"					"0"
		"bgcolor_override" 				"32 32 32 255"
		"NoWrap"						"1"
		"panelBorder"					"2"
		"navRight"						"BtnJoinSelected"
		"navLeft"						"DrpCreateGame"
		"navDown"						"DrpCreateGame"
	}
			
	"DrpCreateGame"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"				"DrpCreateGame"
		"xpos"					"c-180"
		"ypos"					"330"
		"wide"					"180"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navRight"				"BtnJoinSelected"
		"navLeft"				"GplGames"
		"navUp"					"GplGames"
		"navDown"				"BtnCancel"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"xpos"					"0"
			"ypos"					"0"
			"wide"					"180"
			"tall"					"15"
			"autoResize"			"1"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"labelText"				"#L4D360UI_GameSettings_Create_Lobby"
			"tooltiptext"			"#L4D360UI_FoundGames_CreateLobby"
			"style"					"MainMenuButton"
			"command"				"FlmCreateLobby"
			"FocusButtonWidth"		"230"
			"OpenButtonWidth"		"230"
		}
	}

	"FlmCreateLobby"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCreateLobby"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnStartCampaign"
		"ResourceFile"			"resource/UI/L4D360UI/CreateLobbyFlyout.res"
	}

	"BtnCancel" [$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCancel"
		"ypos"					"345"
		"xpos"					"c-180"
		"zpos"					"1"
		"wide"					"180"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"labelText"				"#L4D360UI_Back_Caps"
		"tooltiptext"			"#L4D360UI_Tooltip_Back"
		"style"					"MainMenuButton"
		"command"				"Back"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
		"navRight"				"BtnJoinSelected"
		"navLeft"				"GplGames"
		"navUp"					"DrpCreateGame"
	}	
	
	"GameDetailsBackground"
	{
		"ControlName"			"ImagePanel"
		"fieldName"			"GameDetailsBackground"
		"xpos"				"c90"
		"ypos"				"c-121"
		"zpos"				"-1"
		"wide"				"300"
		"tall"				"249" 
		"autoResize"			"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"			"0"
		"fillColor"			"0 0 0 130"
	}
	
	"GameListBackground"
	{
		"ControlName"			"ImagePanel"
		"fieldName"			"GameDetailsBackground"
		"xpos"				"c-305"
		"ypos"				"149"
		"zpos"				"-1"
		"wide"				"370"
		"tall"				"169" 
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"fillColor"			"0 0 0 200"
	}
}