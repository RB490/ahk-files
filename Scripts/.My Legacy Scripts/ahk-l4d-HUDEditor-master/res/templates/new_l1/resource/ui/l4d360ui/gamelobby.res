"Resource/UI/GameLobby.res"
{
	"GameLobby"
	{
		"ControlName"			"Frame"
		"fieldName"				"GameLobby"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"f0"
		"tall"					"f0"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		
		"title_xpos"			"241"
	}

	"ImgBackground"
	{
		"ControlName"			"L4DMenuBackground"
		"fieldName"			"ImgBackground"
		"xpos"				"0"
		"ypos"				"70"
		"zpos"				"-1"
		"wide"				"f0"
		"tall"				"270" [$X360]
		"tall"				"300" [$WIN32]
		"autoResize"			"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"			"0"
		"fillColor"			"0 0 0 240"
	}
	
	"WorkingAnim"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"WorkingAnim"
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

	"GplSurvivors"
	{
		"ControlName"			"GenericListPanel"
		"fieldName"				"GplSurvivors"
		"xpos"					"c32"
		"ypos"					"70"
		"zpos"					"2"
		"wide"					"f0"
		"tall"					"f0"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navLeft"				"BtnStartGame"	
		"bcolor_override"		"0 0 0 0"
		"NoDrawPanel"			"1"
		"arrowsVisible"			"0"
	}

	"FlmPlayerFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"			"FlmPlayerFlyout"
		"visible"			"0"
		"wide"				"0"
		"tall"				"0"
		"zpos"				"3"
		"InitialFocus"			"BtnSendMessage"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownLobbySteamPlayer.res"
	}
			
	"FlmPlayerFlyoutLeader"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"			"FlmPlayerFlyoutLeader"
		"visible"			"0"
		"wide"				"0"
		"tall"				"0"
		"zpos"				"3"
		"InitialFocus"			"BtnSendMessage"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownLobbySteamPlayerLeader.res"
	}
			
	"LblLeaderLine"
	{
		"ControlName"			"Label"
		"fieldName"				"LblLeaderLine"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"70"
		"zpos"					"2"
		"wide"					"275" [$ENGLISH]
		"wide"					"300" [$!ENGLISH]
		"tall"					"32"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				""
		"Font"					"MainBold" [$ENGLISH]
		"Font"					"DefaultMedium" [$FRENCH]
		"Font"					"DefaultMedium" [$GERMAN]
		"Font"					"DefaultMedium" [$ITALIAN]
		"Font"					"DefaultMedium" [$SPANISH]
		// these need a smaller font because the gamer names in the lobbys were not TCR safe  
		// because these languages use a fallback font instead of Trade Gothic and the names were getting ... added to them
		"Font"					"DefaultBold" [$PORTUGUESE]
		"Font"					"DefaultBold" [$POLISH]
		"Font"					"DefaultBold" [$RUSSIAN]
		"Font"					"DefaultBold" [$SCHINESE]
		"Font"					"DefaultBold" [$TCHINESE]
		"Font"					"DefaultBold" [$KOREAN]
		"Font"					"DefaultBold" [$JAPANESE]		
		"fgcolor_override"		"255 255 255 255"
		"noshortcutsyntax"		"1"
	}					

	"ImgLevelBack"
	{
		"ControlName"			"Panel"
		"fieldName"				"ImgLevelBack"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"100"
		"zpos"					"1"
		"wide"					"129"
		"tall"					"69"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"bgcolor_override"		"80 80 80 255"
	}
	"ImgLevelImage"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"ImgLevelImage"
		"xpos"					"c-238" [$ENGLISH]
		"xpos"					"c-258" [$!ENGLISH]
		"ypos"					"102"
		"zpos"					"2"
		"wide"					"125"
		"tall"					"65"
		"scaleImage"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"maps/l4d_hospital01_apartment"
		"scaleImage"			"1"
	}	
			
	"LblAccessType"
	{
		"ControlName"			"Label"
		"fieldName"				"LblAccessType"
		"xpos"					"c-108" [$ENGLISH]
		"xpos"					"c-128" [$!ENGLISH]
		"ypos"					"98"
		"zpos"					"2"
		"wide"					"140" [$ENGLISH]
		"wide"					"193" [$!ENGLISH]
		"tall"					"32"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				""		
		"Font"					"MainBold" [$ENGLISH]
		"Font"					"DefaultMedium" [$!ENGLISH]
		"textAlignment"			"north-west"
		"wrap"					"1"	
		"fgcolor_override"		"150 150 150 255"
	}
			
	"LblDifficulty"
	{
		"ControlName"			"Label"
		"fieldName"				"LblDifficulty"
		"xpos"					"c-108" [$ENGLISH]
		"xpos"					"c-128" [$!ENGLISH]
		"ypos"					"113"
		"zpos"					"2"
		"wide"					"240" [$ENGLISH]
		"wide"					"173" [$!ENGLISH]
		"tall"					"32"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				""
		"Font"					"DefaultMedium"
		"textAlignment"			"north-west"
		"fgcolor_override"		"150 150 150 255"
	}	
		
	"LblCampaign"
	{
		"ControlName"			"Label"
		"fieldName"				"LblCampaign"
		"xpos"					"c-108" [$ENGLISH]
		"xpos"					"c-128" [$!ENGLISH]
		"ypos"					"128"
		"zpos"					"2"
		"wide"					"240" [$ENGLISH]
		"wide"					"173" [$!ENGLISH]
		"tall"					"32"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				""		
		"Font"					"DefaultMedium"
		"textAlignment"			"north-west"		
		"fgcolor_override"		"150 150 150 255"
	}

	"LblChapter"
	{
		"ControlName"			"Label"
		"fieldName"				"LblChapter"
		"xpos"					"c-108" [$ENGLISH]
		"xpos"					"c-128" [$!ENGLISH]
		"ypos"					"143"
		"zpos"					"2"
		"wide"					"240" [$ENGLISH]
		"wide"					"173" [$!ENGLISH]
		"tall"					"32"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				""		
		"Font"					"DefaultMedium"
		"textAlignment"			"north-west"		
		"fgcolor_override"		"150 150 150 255"
	}

	"LblServerType"
	{
		"ControlName"			"Label"
		"fieldName"				"LblServerType"
		"xpos"					"c-108" [$ENGLISH]
		"xpos"					"c-128" [$!ENGLISH]
		"ypos"					"158"
		"zpos"					"2"
		"wide"					"240" [$ENGLISH]
		"wide"					"173" [$!ENGLISH]
		"tall"					"32"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				""		
		"Font"					"DefaultMedium"
		"textAlignment"			"north-west"		
		"fgcolor_override"		"150 150 150 255"
	}

	"BtnChangeGameSettings"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnChangeGameSettings"
		"command"				"ChangeGameSettings"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"175" [$X360]
		"ypos"					"175" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnVoiceButton" [$WIN32]
		"navUp"					"BtnCancelDedicatedSearch" [$X360]
		"navDown"				"DrpCharacter"
		"navRight"				"GplSurvivors"
		"tooltiptext"			"#L4D360UI_Lobby_Change_GameSettings_Tip"
		"disabled_tooltiptext"	"#L4D360UI_Lobby_Change_GameSettings_DisabledTip"
		"labelText"				"#L4D360UI_Lobby_Change_GameSettings"
		"style"					"MainMenuButton"
	}
	
	"DrpCharacter"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"				"DrpCharacter"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"200" [$X360]
		"ypos"					"190" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnChangeGameSettings"
		"navDown"				"DrpVersusCharacter"
		"navRight"				"GplSurvivors"
				
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
			"labelText"				"#L4D360UI_Lobby_Character"
			"tooltiptext"			"#L4D360UI_GameSettings_Tooltip_Character"
			"disabled_tooltiptext"	"#L4D360UI_GameSettings_Tooltip_Character_Disabled"
			"style"					"MainMenuButton"
			"command"				"FlmCharacterFlyout"
			"FocusButtonWidth"		"230"
			"OpenButtonWidth"		"230"
			"ActivationType"		"1" [$X360]
		}
	}			
	
	"FlmCharacterFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmCharacterFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnRandom"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownCoopCharacters.res"
	}

	"DrpVersusCharacter"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"				"DrpVersusCharacter"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"200" [$X360]
		"ypos"					"190" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"DrpCharacter"
		"navDown"				"BtnInviteFriends"
		"navRight"				"GplSurvivors"
				
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
			"labelText"				"#L4D360UI_Lobby_Character"
			"tooltiptext"			"#L4D360UI_GameSettings_Tooltip_Character"
			"disabled_tooltiptext"	"#L4D360UI_GameSettings_Tooltip_Character_Disabled"
			"style"					"MainMenuButton"
			"command"				"FlmVersusCharacterFlyout"
			"FocusButtonWidth"		"230"
			"OpenButtonWidth"		"230"
			"ActivationType"		"1" [$X360]
		}
	}
	
	"FlmVersusCharacterFlyout"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmVersusCharacterFlyout"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnRandom"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownVersusCharacters.res"
	}
		
	"BtnInviteFriends"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnInviteFriends"
		"command"				"InviteFriends"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"225" [$X360]
		"ypos"					"205" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"DrpVersusCharacter"
		"navDown"				"DrpGameAccess"
		"navRight"				"GplSurvivors"
		"tooltiptext"			"#L4D360UI_Lobby_InviteFriends_Tip"
		"disabled_tooltiptext"	"#L4D360UI_InGameMainMenu_InviteAFriend_Disabled"
		"labelText"				"#L4D360UI_Lobby_InviteFriends"
		"style"					"MainMenuButton"
	}	

	"DrpGameAccess"
	{
		"ControlName"			"DropDownMenu"
		"fieldName"				"DrpGameAccess"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"250" [$X360]
		"ypos"					"220" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnInviteFriends"
		"navDown"				"BtnChangeGameSettings" [$X360]
		"navDown"				"BtnLeaveLobby" [$WIN32]
		"navRight"				"GplSurvivors"
				
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
			"labelText"				"#L4D360UI_Lobby_Change_GameAccess"
			"tooltiptext"			"#L4D360UI_Lobby_Change_GameAccess_Tip"
			"disabled_tooltiptext"	"#L4D360UI_Lobby_Change_GameAccess_Disabled_Tip"
			"style"					"MainMenuButton"
			"command"				"FlmGameAccess"
			"FocusButtonWidth"		"230"
			"OpenButtonWidth"		"230"
			"ActivationType"		"1" [$X360]
		}
	}			
	
	"FlmGameAccess"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGameAccess"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"3"
		"InitialFocus"			"BtnPublic"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownLobbyGameAccess.res"
	}

	"BtnStartGame"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnStartGame"
		"command"				"StartGame"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"275" [$X360]
		"ypos"					"250" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"DrpGameAccess" [$X360]
		"navUp"					"BtnLeaveLobby" [$WIN32]
		"navDown"				"BtnCancelDedicatedSearch"
		"navLeft"				"BtnCancelDedicatedSearch"
		"navRight"				"GplSurvivors"
		"tooltiptext"			"#L4D360UI_Lobby_StartMatchmacking_Tip"
		"disabled_tooltiptext"	"#L4D360UI_Lobby_StartMatchmacking_Disabled_Tip"	
		"labelText"				"#L4D360UI_Lobby_StartMatchmacking"
		"style"					"RedMainButton"
		"fgcolor_override"		"255 12 12 255" [$WIN32]
	}

	"BtnCancelDedicatedSearch"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCancelDedicatedSearch"
		"command"				"CancelDedicatedSearch"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"275" [$X360]
		"ypos"					"250" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnStartGame"
		"navDown"				"ChatInputLine" [$WIN32]
		"navDown"				"BtnChangeGameSettings" [$X360]
		"navRight"				"GplSurvivors"
		"tooltiptext"			"#L4D360UI_Lobby_CancelMatchmacking_Tip"
		"labelText"				"#L4D360UI_Lobby_CancelMatchmacking"
		"style"					"MainMenuButton"
	}	
	
	"BtnLeaveLobby" [$WIN32]
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnLeaveLobby"
		"command"				"LeaveLobby"
		"xpos"					"c-240" [$ENGLISH]
		"xpos"					"c-260" [$!ENGLISH]
		"ypos"					"300" [$X360]
		"ypos"					"235" [$WIN32]
		"wide"					"180" [$ENGLISH]
		"wide"					"200" [$!ENGLISH]
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"navUp"					"BtnCancelDedicatedSearch" [$X360]
		"navUp"					"DrpGameAccess"  [$WIN32]
		"navDown"				"BtnChangeGameSettings" [$X360]
		"navDown"				"BtnStartGame" [$WIN32]
		"navRight"				"GplSurvivors"
		"tooltiptext"			"#L4D360UI_Lobby_LeaveLobby_Tip"
		"labelText"				"#L4D360UI_Lobby_LeaveLobby"
		"style"					"MainMenuButton"
	}	

	"ChatBackground" [$WIN32]
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"Divider1"
		"xpos"		       	"c-240" [$ENGLISH]
		"xpos"			"c-260" [$!ENGLISH]
		"ypos"			"279"
		"zpos"					"1"
		"wide"	 		"261" [$ENGLISH]  
		"wide"	 		"271" [$!ENGLISH] 
		"tall"	 		"70"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"image"					"divider_gradient"
		"scaleImage"			"1"
	}
	

//	"ChatBackground" [$WIN32]
//	{
//		"ControlName"		"EditablePanel"
//		"fieldName" 		"ChatBackground"
//		"visible" 		"1"
//		"enabled" 		"1"
//		"xpos"		       	"c-240" [$ENGLISH]
//		"xpos"			"c-260" [$!ENGLISH]
//		"ypos"			"279"
//		"zpos"			"1"
//		"wide"	 		"261" [$ENGLISH]  
//		"wide"	 		"271" [$!ENGLISH] 
//		"tall"	 		"70"
//		"bgcolor_override"     	"80 80 80 100"
//	}

	"LobbyChatHistory" [$WIN32]
	{
		"ControlName"		"RichText"
		"fieldName"		"LobbyChatHistory"
		"xpos"		       	"c-240" [$ENGLISH]
		"xpos"			"c-260" [$!ENGLISH]
		"ypos"			"280"
		"zpos"			"2"
		"wide"	 		"260" [$ENGLISH]  
		"wide"	 		"270" [$!ENGLISH] 
		"tall"			"57"
		"wrap"			"1"
		"autoResize"		"1"
		"pinCorner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		""
		"textAlignment"		"south-west"
		"font"			"ChatFont"
		"maxchars"		"-1"
		"bgcolor_override"     	"0 0 0 255"
	}

	"ChatInputLine" [$WIN32]
	{
		"ControlName"		"EditablePanel"
		"fieldName" 		"ChatInputLine"
		"visible" 		"1"
		"enabled" 		"1"
		"xpos"		       	"c-240" [$ENGLISH]
		"xpos"			"c-260" [$!ENGLISH]
		"ypos"			"338"
		"zpos"			"2"
		"wide"	 		"260" [$ENGLISH]  
		"wide"	 		"270" [$!ENGLISH] 
		"tall"	 		"10"
		"PaintBackgroundType"	"0"
		"bgcolor_override"     	"0 0 0 200"
		
		"navUp"			"BtnCancelDedicatedSearch"
		"navDown"		"BtnVoiceButton"
	}

	"BtnVoiceButton" [$WIN32]
	{
		"ControlName"		"L4D360HybridButton"
		"fieldName"		"BtnVoiceButton"
		"command"		"ToggleVoice"
		"xpos"			"c-240" [$ENGLISH]
		"xpos"			"c-260" [$!ENGLISH]
		"ypos"			"350"
		"wide"			"180" [$ENGLISH]
		"wide"			"200" [$!ENGLISH]
		"tall" 			"15"
		"autoResize"		"1"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
 		"tooltiptext"		"#L4D360UI_Lobby_StartVoiceChat_Tip"
		"disabled_tooltiptext"	"#L4D360UI_Lobby_StartVoiceChat_Disabled_Tip"	
		"labelText"		"#L4D360UI_Lobby_StartVoiceChat"
		"navUp"			"ChatInputLine"
		"navDown"		"BtnChangeGameSettings"
		"style"			"MainMenuButton"
	}
}