guiEditorMenuBuild:
If (hGame = "left4dead") or (hGame = "left4dead2")
{
	; maps
	{	
		If (hGame = "left4dead")
		{
			Menu, Map_NoMercy, Add
			Menu, Map_NoMercy, DeleteAll
			Menu, Map_NoMercy, Add, l4d_hospital01_apartment,	Menu_LoadMap
			Menu, Map_NoMercy, Add, l4d_hospital02_subway,		Menu_LoadMap
			Menu, Map_NoMercy, Add, l4d_hospital03_sewers,		Menu_LoadMap
			Menu, Map_NoMercy, Add, l4d_hospital04_interior,	Menu_LoadMap
			Menu, Map_NoMercy, Add, l4d_hospital05_rooftop,		Menu_LoadMap

			Menu, Map_CrashCourse, Add
			Menu, Map_CrashCourse, DeleteAll
			Menu, Map_CrashCourse, Add, l4d_garage01_alleys,	Menu_LoadMap
			Menu, Map_CrashCourse, Add, l4d_garage02_lots,		Menu_LoadMap

			Menu, Map_DeathToll, Add
			Menu, Map_DeathToll, DeleteAll
			Menu, Map_DeathToll, Add, l4d_smalltown01_caves,		Menu_LoadMap
			Menu, Map_DeathToll, Add, l4d_smalltown02_drainage,		Menu_LoadMap
			Menu, Map_DeathToll, Add, l4d_smalltown03_ranchhouse,	Menu_LoadMap
			Menu, Map_DeathToll, Add, l4d_smalltown04_mainstreet,	Menu_LoadMap
			Menu, Map_DeathToll, Add, l4d_smalltown05_houseboat,	Menu_LoadMap

			Menu, Map_DeadAir, Add
			Menu, Map_DeadAir, DeleteAll
			Menu, Map_DeadAir, Add, l4d_airport01_greenhouse,	Menu_LoadMap
			Menu, Map_DeadAir, Add, l4d_airport02_offices,		Menu_LoadMap
			Menu, Map_DeadAir, Add, l4d_airport03_garage,		Menu_LoadMap
			Menu, Map_DeadAir, Add, l4d_airport04_terminal,		Menu_LoadMap
			Menu, Map_DeadAir, Add, l4d_airport05_runway,		Menu_LoadMap

			Menu, Map_BloodHarvest, Add
			Menu, Map_BloodHarvest, DeleteAll
			Menu, Map_BloodHarvest, Add, l4d_farm01_hilltop,		Menu_LoadMap
			Menu, Map_BloodHarvest, Add, l4d_farm02_traintunnel,	Menu_LoadMap
			Menu, Map_BloodHarvest, Add, l4d_farm03_bridge,			Menu_LoadMap
			Menu, Map_BloodHarvest, Add, l4d_farm04_barn,			Menu_LoadMap
			Menu, Map_BloodHarvest, Add, l4d_farm05_cornfield,		Menu_LoadMap

			Menu, Map_Sacrifice, Add
			Menu, Map_Sacrifice, DeleteAll
			Menu, Map_Sacrifice, Add, l4d_river01_docks,	Menu_LoadMap
			Menu, Map_Sacrifice, Add, l4d_river02_barge,	Menu_LoadMap
			Menu, Map_Sacrifice, Add, l4d_river03_port,		Menu_LoadMap
		}

		If (hGame = "left4dead2")
		{
			Menu, Map_NoMercy, Add
			Menu, Map_NoMercy, DeleteAll
			Menu, Map_NoMercy, Add, c8m1_apartment,		Menu_LoadMap
			Menu, Map_NoMercy, Add, c8m2_subway,		Menu_LoadMap
			Menu, Map_NoMercy, Add, c8m3_sewers,		Menu_LoadMap
			Menu, Map_NoMercy, Add, c8m4_interior,		Menu_LoadMap
			Menu, Map_NoMercy, Add, c8m5_rooftop,		Menu_LoadMap

			Menu, Map_CrashCourse, Add
			Menu, Map_CrashCourse, DeleteAll
			Menu, Map_CrashCourse, Add, c9m1_alleys,	Menu_LoadMap
			Menu, Map_CrashCourse, Add, c9m2_lots,		Menu_LoadMap

			Menu, Map_DeathToll, Add
			Menu, Map_DeathToll, DeleteAll
			Menu, Map_DeathToll, Add, c10m1_caves,		Menu_LoadMap
			Menu, Map_DeathToll, Add, c10m2_drainage,	Menu_LoadMap
			Menu, Map_DeathToll, Add, c10m3_ranchhouse,	Menu_LoadMap
			Menu, Map_DeathToll, Add, c10m4_mainstreet,	Menu_LoadMap
			Menu, Map_DeathToll, Add, c10m5_houseboat,	Menu_LoadMap

			Menu, Map_DeadAir, Add
			Menu, Map_DeadAir, DeleteAll
			Menu, Map_DeadAir, Add, c11m1_greenhouse,	Menu_LoadMap
			Menu, Map_DeadAir, Add, c11m2_offices,		Menu_LoadMap
			Menu, Map_DeadAir, Add, c11m3_garage,		Menu_LoadMap
			Menu, Map_DeadAir, Add, c11m4_terminal,		Menu_LoadMap
			Menu, Map_DeadAir, Add, c11m5_runway,		Menu_LoadMap

			Menu, Map_BloodHarvest, Add
			Menu, Map_BloodHarvest, DeleteAll
			Menu, Map_BloodHarvest, Add, C12m1_hilltop,		Menu_LoadMap
			Menu, Map_BloodHarvest, Add, C12m2_traintunnel,	Menu_LoadMap
			Menu, Map_BloodHarvest, Add, C12m3_bridge,		Menu_LoadMap
			Menu, Map_BloodHarvest, Add, C12m4_barn,		Menu_LoadMap
			Menu, Map_BloodHarvest, Add, C12m5_cornfield,	Menu_LoadMap

			Menu, Map_Sacrifice, Add
			Menu, Map_Sacrifice, DeleteAll
			Menu, Map_Sacrifice, Add, c7m1_docks,		Menu_LoadMap
			Menu, Map_Sacrifice, Add, c7m2_barge,		Menu_LoadMap
			Menu, Map_Sacrifice, Add, c7m3_port,		Menu_LoadMap

			Menu, Map_DeadCenter, Add
			Menu, Map_DeadCenter, DeleteAll
			Menu, Map_DeadCenter, Add, c1m1_hotel,		Menu_LoadMap
			Menu, Map_DeadCenter, Add, c1m2_streets,	Menu_LoadMap
			Menu, Map_DeadCenter, Add, c1m3_mall,		Menu_LoadMap
			Menu, Map_DeadCenter, Add, c1m4_atrium,		Menu_LoadMap

			Menu, Map_DarkCarnival, Add
			Menu, Map_DarkCarnival, DeleteAll
			Menu, Map_DarkCarnival, Add, c2m1_highway,		Menu_LoadMap
			Menu, Map_DarkCarnival, Add, c2m2_fairgrounds,	Menu_LoadMap
			Menu, Map_DarkCarnival, Add, c2m3_coaster,		Menu_LoadMap
			Menu, Map_DarkCarnival, Add, c2m4_barns,		Menu_LoadMap
			Menu, Map_DarkCarnival, Add, c2m5_concert,		Menu_LoadMap

			Menu, Map_SwampFever, Add
			Menu, Map_SwampFever, DeleteAll
			Menu, Map_SwampFever, Add, c3m1_plankcountry,	Menu_LoadMap
			Menu, Map_SwampFever, Add, c3m2_swamp,			Menu_LoadMap
			Menu, Map_SwampFever, Add, c3m3_shantytown,		Menu_LoadMap
			Menu, Map_SwampFever, Add, c3m4_plantation,		Menu_LoadMap

			Menu, Map_HardRain, Add
			Menu, Map_HardRain, DeleteAll
			Menu, Map_HardRain, Add, c4m1_milltown_a,		Menu_LoadMap
			Menu, Map_HardRain, Add, c4m2_sugarmill_a,		Menu_LoadMap
			Menu, Map_HardRain, Add, c4m3_sugarmill_b,		Menu_LoadMap
			Menu, Map_HardRain, Add, c4m4_milltown_b,		Menu_LoadMap
			Menu, Map_HardRain, Add, c4m5_milltown_escape,	Menu_LoadMap

			Menu, Map_TheParish, Add
			Menu, Map_TheParish, DeleteAll
			Menu, Map_TheParish, Add, c5m1_waterfront,	Menu_LoadMap
			Menu, Map_TheParish, Add, c5m2_park,		Menu_LoadMap
			Menu, Map_TheParish, Add, c5m3_cemetery,	Menu_LoadMap
			Menu, Map_TheParish, Add, c5m4_quarter,		Menu_LoadMap
			Menu, Map_TheParish, Add, c5m5_bridge,		Menu_LoadMap

			Menu, Map_ThePassing, Add
			Menu, Map_ThePassing, DeleteAll
			Menu, Map_ThePassing, Add, c6m1_riverbank,	Menu_LoadMap
			Menu, Map_ThePassing, Add, c6m2_bedlam,		Menu_LoadMap
			Menu, Map_ThePassing, Add, c6m3_port,		Menu_LoadMap

			Menu, Map_ColdStream, Add
			Menu, Map_ColdStream, DeleteAll
			Menu, Map_ColdStream, Add, c13m1_alpinecreek,		Menu_LoadMap
			Menu, Map_ColdStream, Add, c13m2_southpinestream,	Menu_LoadMap
			Menu, Map_ColdStream, Add, c13m3_memorialbridge,	Menu_LoadMap
			Menu, Map_ColdStream, Add, c13m4_cutthroatcreek,	Menu_LoadMap
		}
		
		; MapMenu layout
		Menu, Map, Add
		Menu, Map, DeleteAll

		; campaigns
		Menu, Map, Add, tutorial_standards,		Menu_LoadMap
		Menu, Map, Add, No Mercy,		:Map_NoMercy
		Menu, Map, Add, Crash Course,	:Map_CrashCourse
		Menu, Map, Add, Death Toll,		:Map_DeathToll
		Menu, Map, Add, Dead Air,		:Map_DeadAir
		Menu, Map, Add, Blood Harvest,	:Map_BloodHarvest
		Menu, Map, Add, Sacrifice,		:Map_Sacrifice
		
		If (hGame = "left4dead2")
		{
			Menu, Map, Add
			Menu, Map, Add, Dead Center,	:Map_DeadCenter
			Menu, Map, Add, The Parish,		:Map_TheParish
			Menu, Map, Add, Swamp Fever,	:Map_SwampFever
			Menu, Map, Add, Hard Rain,		:Map_HardRain
			Menu, Map, Add, The Passing,	:Map_ThePassing
			Menu, Map, Add, Cold Stream,	:Map_ColdStream
		}
	}
	
	; Team
	{
		Menu, Team, Add
		Menu, Team, DeleteAll
		
		Menu, Team, Add, Spectate,		Menu_Team
		Menu, Team, Add, Infected,		Menu_Team
		
		Menu, Team, Add
		
		Menu, Team, Add, Bill,			Menu_Team
		Menu, Team, Add, Francis,		Menu_Team
		Menu, Team, Add, Louis,			Menu_Team
		Menu, Team, Add, Zoey,			Menu_Team

		if (hGame = "left4dead2")
		{
			Menu, Team, Add
			Menu, Team, Add, Rochelle,		Menu_Team
			Menu, Team, Add, Nick,			Menu_Team
			Menu, Team, Add, Ellis,			Menu_Team
			Menu, Team, Add, Coach,			Menu_Team
		}
	}
	
	; items
	{
		Menu, Items, Add
		Menu, Items, DeleteAll
		
		if (hGame = "left4dead")
		{
			Menu, Items, Add, Weapons,		Menu_Items
			Menu, Items, Add, Items,		Menu_Items
		}
		if (hGame = "left4dead2")
		{
			Menu, Items, Add, Weapons,		Menu_Items
			Menu, Items, Add, Melee,		Menu_Items
			Menu, Items, Add, Pistols,		Menu_Items
			Menu, Items, Add, Items,		Menu_Items	
		}
	}
	
	; gamemode menu
	{
		; GameMode layout
		Menu, GameMode, Add
		Menu, GameMode, DeleteAll
		
		; game modes
		Menu, GameMode, Add, Coop,			Menu_GameMode
		Menu, GameMode, Add, Versus,		Menu_GameMode
		Menu, GameMode, Add, Survival,		Menu_GameMode
		If (hGame = "left4dead2")
			Menu, GameMode, Add, Scavenge,	Menu_GameMode
			
		Menu, GameMode, Check, % Setting.GameMode
	}
	
	; debug SubMenu
	{
		Menu, HudPanels, Add
		Menu, HudPanels, DeleteAll
		
		Menu, HudPanels, Add, debug_zombie_panel 0`tHide debug_zombie_panel, Menu_HudZombiePanels
		Menu, HudPanels, Add, debug_zombie_panel -1`tVersus TooFar, Menu_HudZombiePanels
		Menu, HudPanels, Add, debug_zombie_panel 1`tVersus BecomeTank, Menu_HudZombiePanels
		Menu, HudPanels, Add, debug_zombie_panel 2`tVersus OtherBecomeTank, Menu_HudZombiePanels
		Menu, HudPanels, Add
		Menu, HudPanels, Add, info_window`tSacrifice Failed, Menu_HudPanels
		Menu, HudPanels, Add, scores`tTab Scoreboard, Menu_HudPanels
		Menu, HudPanels, Add, Specgui`tSpectating HUD, Menu_HudPanels
		Menu, HudPanels, Add, spawnmode`tVersus spawn tutorial, Menu_HudPanels
		Menu, HudPanels, Add, info`tMOTD, Menu_HudPanels
		Menu, HudPanels, Add, team`tTeam Switching Panel, Menu_HudPanels
		Menu, HudPanels, Add, transition_stats`tTransition Screen, Menu_HudPanels
		Menu, HudPanels, Add, vs_shutting_down`tVersus Shut Down, Menu_HudPanels
		
		If (hGame = "left4dead")
		{
			Menu, HudPanels, Add, spawn_smoker`tVersus smoker tutorial, Menu_HudPanels
			Menu, HudPanels, Add, spawn_hunter`tVersus hunter tutorial, Menu_HudPanels
			Menu, HudPanels, Add, spawn_boomer`tVersus boomer tutorial, Menu_HudPanels
			Menu, HudPanels, Add, fullscreen_holdout_scoreboard`tSurvival Scoreboard End Of Round, Menu_HudPanels
			Menu, HudPanels, Add, holdout_shutting_down`tSurvival Shutting Down, Menu_HudPanels
			Menu, HudPanels, Add, multimap_vs_scoreboard`tVersus Scoreboard End Of Round, Menu_HudPanels
		}

		If (hGame = "left4dead2")
		{
			Menu, HudPanels, Add, fullscreen_scavenge_scoreboard`tVersus/Scavenge Rematch HUD, Menu_HudPanels 
			Menu, HudPanels, Add, fullscreen_vs_results`tVersus Scoreboard End of Match, Menu_HudPanels
			Menu, HudPanels, Add, fullscreen_vs_scoreboard`tVersus Scoreboard End of Round, Menu_HudPanels
			Menu, HudPanels, Add, ready_countdown`tVersus/Scavenge timer, Menu_HudPanels
			Menu, HudPanels, Add, fullscreen_survival_scoreboard`tSurvival Scoreboard, Menu_HudPanels
			Menu, HudPanels, Add, survival_shutting_down`tSurvival Shut Down, Menu_HudPanels
		}
	}
}

; Res
{
	; game menu resolution aspect ratio 4:3
	{
		Menu, Res4:3, Add
		Menu, Res4:3, DeleteAll
		
		Menu, Res4:3, Add, 640x480,		Menu_Res
		Menu, Res4:3, Add, 720x576,		Menu_Res
		Menu, Res4:3, Add, 800x600,		Menu_Res
		Menu, Res4:3, Add, 1024x768,		Menu_Res
		Menu, Res4:3, Add, 1152x864,		Menu_Res
		Menu, Res4:3, Add, 1280x960,		Menu_Res
		Menu, Res4:3, Add, 1400x1050,		Menu_Res
		Menu, Res4:3, Add, 1600x1200,		Menu_Res
		Menu, Res4:3, Add, 2048x1536,		Menu_Res
	}

	; game menu resolution aspect ratio 16:9
	{
		Menu, Res16:9, Add
		Menu, Res16:9, DeleteAll
		
		Menu, Res16:9, Add, 852x480,		Menu_Res
		Menu, Res16:9, Add, 1280x720,		Menu_Res
		Menu, Res16:9, Add, 1360x768,		Menu_Res
		Menu, Res16:9, Add, 1366x768,		Menu_Res
		Menu, Res16:9, Add, 1600x900,		Menu_Res
		Menu, Res16:9, Add, 1920x1080,		Menu_Res
		Menu, Res16:9, Add, 2560x1440,		Menu_Res
		Menu, Res16:9, Add, 3840x2160,		Menu_Res
	}

	; game menu resolution aspect ratio 16:10
	{
		Menu, Res16:10, Add
		Menu, Res16:10, DeleteAll
		
		Menu, Res16:10, Add, 720x480,		Menu_Res
		Menu, Res16:10, Add, 1280x768,		Menu_Res
		Menu, Res16:10, Add, 1280x800,		Menu_Res
		Menu, Res16:10, Add, 1440x900,		Menu_Res
		Menu, Res16:10, Add, 1600x1024,	Menu_Res
		Menu, Res16:10, Add, 1680x1050,	Menu_Res
		Menu, Res16:10, Add, 1920x1200,	Menu_Res
		Menu, Res16:10, Add, 2560x1600,	Menu_Res
		Menu, Res16:10, Add, 3840x2400,	Menu_Res
		Menu, Res16:10, Add, 7680x4800,	Menu_Res
	}

	; game menu resolution aspect ratio chooser
	{
		Menu, Res, Add
		Menu, Res, DeleteAll
		
		Menu, Res, Add, 4:3, 		:Res4:3
		Menu, Res, Add, 16:9, 		:Res16:9
		Menu, Res, Add, 16:10, 		:Res16:10
	}
}

; game menu positions
{
	Menu, GamePos, Add
	Menu, GamePos, DeleteAll

	Menu, GamePos, Add, Center, 		Menu_GamePos
	Menu, GamePos, Add
	Menu, GamePos, Add, TopLeft, 		Menu_GamePos
	Menu, GamePos, Add, TopRight, 		Menu_GamePos
	Menu, GamePos, Add, BottomLeft, 	Menu_GamePos
	Menu, GamePos, Add, BottomRight, 	Menu_GamePos
	Menu, GamePos, Add
	Menu, GamePos, Add, Top, 		Menu_GamePos
	Menu, GamePos, Add, Bottom, 	Menu_GamePos
	Menu, GamePos, Add, Left, 		Menu_GamePos
	Menu, GamePos, Add, Right, 		Menu_GamePos
	
	If !(Setting.GamePos = "")
		Menu, GamePos, Check, % Setting.GamePos
}

; game menu options
{
	Menu, Game, Add
	Menu, Game, DeleteAll
	
	Menu, Game, Add, Restart,		Menu_RestartGame
	Menu, Game, Add, Position,		:GamePos
	Menu, Game, Add, Resolution,	:Res
}

; Toggle menu
{
	; Toggle layout
	Menu, Toggle, Add
	Menu, Toggle, DeleteAll
	
	; game modes
	Menu, Toggle, Add, Draw World,			Menu_toggleHideWorld
	Menu, Toggle, Add, Inspect HUD,			Menu_InspectHud
}

; settings menu
{
	Menu, Settings, Add
	Menu, Settings, DeleteAll

	Menu, Settings, Add, Load map on game start, 	Menu_loadMapOnStartUp
	Menu, Settings, Add, Text Editor Transparency, Menu_textEditorTransparency
	Menu, Settings, Add, Reloading, 	menuHandler
	Menu, Settings, Add
	Menu, Settings, Add, hud_reloadscheme, 	Menu_hudReloadMode
	Menu, Settings, Add, ui_reloadscheme, 	Menu_hudReloadMode
	Menu, Settings, Add
	Menu, Settings, Add, Reopen menu on reload, Menu_Reopenmenu
	Menu, Settings, Add, Set close pos, Menu_CloseMenuPos
	Menu, Settings, Add, Set open pos, Menu_OpenMenuPos
	
	Menu, Settings, Disable, Reloading
	
	If (Setting.loadMapOnStartUp = 1)
		Menu, Settings, Check, Load map on game start
		
	If !(Setting.hudReloadMode = "")
		Menu, Settings, Check, % Setting.hudReloadMode
		
	If (Setting.ReopenMenu = 1)
		Menu, Settings, Check, Reopen menu on reload
}
 
; Hotkeys menu
{
	Menu, Hotkeys, Add
	Menu, Hotkeys, DeleteAll

	Menu, Hotkeys, Add, Focus Editor`tF5, 		activateEditorGui
	Menu, Hotkeys, Add, Focus Game`tF6, 		activateGame
	Menu, Hotkeys, Add, Toggle Fileview`tF8, 	Menu_EditorFileBrowserToggle
	Menu, Hotkeys, Add, Console`tF9,			Menu_Console
}



; file menu
{
	Menu, File, Add
	Menu, File, DeleteAll
	
	Menu, File, Add, Browse, 		Menu_HudExplorer
	Menu, File, Add, Hotkeys,		:Hotkeys
	Menu, File, Add, Settings,		:Settings
	

}

Menu, editorMenu, Add
Menu, editorMenu, DeleteAll

Menu, editorMenu, Add, File, 		:File

Menu, editorMenu, Add, Game, 		:Game
Menu, editorMenu, Add, Mode,		:GameMode
Menu, editorMenu, Add, Map,			:Map

Menu, editorMenu, Add, Team,		:Team
Menu, editorMenu, Add, Items,		:Items
Menu, editorMenu, Add, Panels,		:HudPanels

Menu, editorMenu, Add, Toggle,		:Toggle
return