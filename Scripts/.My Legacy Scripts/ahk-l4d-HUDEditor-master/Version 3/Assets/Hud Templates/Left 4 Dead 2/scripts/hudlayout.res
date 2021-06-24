// Defines the positions of a variety of hud controls
"Resource/HudLayout.res"
{

	BuildableCostPanel
	{
		"fieldname"                 "BuildableCostPanel"
		"visible"                   "1"
		"enabled"                   "1"
		"xpos"                      "c-114"
		"ypos"                      "c10"
		"wide"                      "300"
		"tall"                      "80"
		"PaintBackgroundType"       "0"
		"PaintBackground"           "0"
	}

	CBudgetPanel
	{
		"fieldname"  "CBudgetPanel"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	// Infected ability cooldown timer
	CHudAbilityTimer
	{
		"fieldname"                 "CHudAbilityTimer"
		"controlName"               "CHudAbilityTimer"
		"visible"                   "1"
		"enabled"                   "1"
		"xpos"                      "r72"
		"ypos"                      "r120"
		"wide"                      "80"
		"tall"                      "70"
		"usetitlesafe"              "1"
		"ability_charging_color"    "127 127 127 255"
		"ability_ready_color"       "255 255 255 255"
		"ability_surpressed_color"  "127 127 127 255"
	}

	// Local player health hud section
	CHudLocalPlayerDisplay
	{
		"fieldname"             "CHudLocalPlayerDisplay"
		"visible"               "1"
		"enabled"               "1"
		"xpos"                  "r160"
		"ypos"                  "r91"
		"wide"                  "160"
		"tall"                  "320"
		"usetitlesafe"          "1"
	}

	CHudSurvivorTeamStatus
	{
		"fieldname"            "CHudSurvivorTeamStatus"
		"controlName"          "CHudSurvivorTeamStatus"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "r85"
		"ypos"                 "120"
		"wide"                 "80"
		"tall"                 "20"
		"PaintBackgroundType"  "2"
	}

	// Survivor teammate panels
	CHudTeamDisplay
	{
		"fieldname"                   "CHudTeamDisplay"
		"visible"                     "1"
		"enabled"                     "1"
		"xpos"                        "5"
		"ypos"                        "r73"
		"wide"                        "f0"
		"tall"                        "100"
		"usetitlesafe"                "1"
	}

	CHudTeamMateInPerilNotice
	{
		"fieldname"  "CHudTeamMateInPerilNotice"
		"visible"    "1"
		"enabled"    "1"
		"ypos"       "50"
	}

	// Vote hud
	CHudVote
	{
		"fieldname"            "CHudVote"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "10"
		"ypos"                 "c-80"
		"wide"                 "290"
		"tall"                 "200"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "0"
		"bgcolor_override"     "0 0 0 0"
	}

	// Infected teammate panels
	CHudZombieTeamDisplay
	{
		"fieldname"                   "CHudZombieTeamDisplay"
		"visible"                     "1"
		"enabled"                     "1"
		"xpos"                        "0"
		"ypos"                        "r75"
		"wide"                        "f0"
		"tall"                        "100"
		"usetitlesafe"                "1"
		"HorizPanelSpacing"           "140"
		"VertPanelSpacing"            "45"
	}

	CItemPickupPanel
	{
		"fieldname"            "CItemPickupPanel"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "0"
		"ypos"                 "0"
		"wide"                 "f0"
		"tall"                 "f0"
		"usetitlesafe"         "0"
		"PaintBackgroundType"  "2"
	}

	CTextureBudgetPanel
	{
		"fieldname"  "CTextureBudgetPanel"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	CVProfPanel
	{
		"fieldname"  "CVProfPanel"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudAccount
	{
		"fieldname"            "HudAccount"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "r134"
		"ypos"                 "374"
		"wide"                 "116"
		"tall"                 "80"
		"PaintBackgroundType"  "2"
		"digit2_xpos"          "104"
		"digit2_ypos"          "2"
		"digit_xpos"           "104"
		"digit_ypos"           "36"
		"icon2_xpos"           "0"
		"icon2_ypos"           "2"
		"icon_xpos"            "0"
		"icon_ypos"            "36"
	}

	HudAnimationInfo
	{
		"fieldname"  "HudAnimationInfo"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudAnnouncement
	{
		"fieldname"            "HudAnnouncement"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "c-150"
		"ypos"                 "300"
		"wide"                 "300"
		"tall"                 "15"
		"PaintBackgroundType"  "2"
	}

	HudArmor
	{
		"fieldname"            "HudArmor"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "156"
		"ypos"                 "440"
		"wide"                 "132"
		"tall"                 "40"
		"PaintBackgroundType"  "2"
		"digit_xpos"           "34"
		"digit_ypos"           "2"
		"icon_xpos"            "0"
		"icon_ypos"            "2"
	}

	HudBiofeedback
	{
		"fieldname"     "HudBiofeedback"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "r128"
		"ypos"          "r479"
		"wide"          "128"
		"tall"          "64"
		"usetitlesafe"  "1"
	}

	HudBlood
	{
		"fieldname"  "HudBlood"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudC4
	{
		"fieldname"            "HudC4"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "16"
		"ypos"                 "248"
		"wide"                 "40"
		"tall"                 "40"
		"PaintBackgroundType"  "2"
		"FlashColor"           "HudIcon_Red"
		"IconColor"            "HudIcon_Green"
	}

	HudChat
	{
		"fieldname"            "HudChat"
		"controlName"          "EditablePanel"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "10"
		"ypos"                 "275"
		"wide"                 "320"
		"tall"                 "120"
		"usetitlesafe"         "1"
		"PaintBackgroundType"  "2"
	}

	// Closed captions
	HudCloseCaption
	{
		"fieldname"                   "HudCloseCaption"
		"visible"                     "1"
		"enabled"                     "1"
		"xpos"                        "c-150"
		"ypos"                        "r230"
		"wide"                        "300"
		"tall"                        "135"
		"usetitlesafe"                "1"
		"BgAlpha"                     "128"
		"GrowTime"                    "0.25"
		"ItemFadeInTime"              "0.15"
		"ItemFadeOutTime"             "0.3"
		"ItemHiddenTime"              "0.2"
		"topoffset"                   "0"
	}

	HudCommentary
	{
		"fieldname"              "HudCommentary"
		"visible"                "0"
		"enabled"                "1"
		"xpos"                   "c-190"
		"ypos"                   "350"
		"wide"                   "380"
		"tall"                   "40"
		"PaintBackgroundType"    "2"
		"alpha"                  "0"
		"bar_height"             "8"
		"bar_width"              "320"
		"bar_xpos"               "50"
		"bar_ypos"               "20"
		"count_xpos_from_right"  "10"
		"count_ypos"             "8"
		"icon_height"            "40"
		"icon_texture"           "vgui/hud/icon_commentary"
		"icon_width"             "40"
		"icon_xpos"              "0"
		"icon_ypos"              "0"
		"speaker_xpos"           "50"
		"speaker_ypos"           "8"
	}

	HudCredits
	{
		"fieldname"  "HudCredits"
		"visible"    "1"
		"enabled"    "1"
		"xpos"       "c-270"
		"ypos"       "c-190"
		"wide"       "540"
		"tall"       "380"
	}

	HudCrosshair
	{
		"fieldname"                 "HudCrosshair"
		"visible"                   "1"
		"enabled"                   "1"
		"wide"                      "640"
		"tall"                      "480"
		"ability_charging_color"    "127 127 127 255"
		"ability_ready_color"       "255 255 255 255"
		"ability_size"              "17"
		"ability_surpressed_color"  "127 127 127 255"
	}

	HudDamageIndicator
	{
		"fieldname"      "HudDamageIndicator"
		"visible"        "1"
		"enabled"        "1"
		"dmg_tall1"      "240"
		"dmg_tall2"      "200"
		"dmg_wide"       "36"
		"dmg_xpos"       "30"
		"dmg_ypos"       "100"
		"DmgColorLeft"   "255 0 0 0"
		"DmgColorRight"  "255 0 0 0"
		"EndRadius"      "80"
		"MaximumHeight"  "60"
		"MaximumWidth"   "80"
		"MinimumHeight"  "30"
		"MinimumTime"    "2"
		"MinimumWidth"   "40"
		"StartRadius"    "120"
	}

	HudDeathNotice
	{
		"fieldname"        "HudDeathNotice"
		"visible"          "1"
		"enabled"          "1"
		"xpos"             "0"
		"ypos"             "0"
		"wide"             "f0"
		"tall"             "480"
		"IconSize"         "16"
		"MaxDeathNotices"  "6"
		"TextFont"         "Default"
	}

	HudDefuser
	{
		"fieldname"            "HudDefuser"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "16"
		"ypos"                 "248"
		"wide"                 "40"
		"tall"                 "40"
		"PaintBackgroundType"  "2"
		"IconColor"            "HudIcon_Green"
	}

	HudFinaleMeter
	{
		"fieldname"            "HudFinaleMeter"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "c-100"
		"ypos"                 "12"
		"wide"                 "200"
		"tall"                 "20"
		"PaintBackgroundType"  "2"
	}

	HudFlashbang
	{
	}

	HudFlashlight
	{
		"fieldname"            "HudFlashlight"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "16"
		"ypos"                 "370"
		"wide"                 "102"
		"tall"                 "20"
		"PaintBackgroundType"  "2"
		"text_xpos"            "8"
		"text_ypos"            "6"
		"TextColor"            "255 170 0 220"
	}

	// Tank frustration meter
	HudFrustrationMeter
	{
		"fieldname"            "HudFrustrationMeter"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "10"
		"ypos"                 "c0"
		"wide"                 "300"
		"tall"                 "84"
		"usetitlesafe"         "2"
		"PaintBackgroundType"  "0"
	}

	HudGeiger
	{
		"fieldname"  "HudGeiger"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	// Local player infected spawn hud
	HudGhostPanel
	{
		"fieldname"                   "HudGhostPanel"
		"visible"                     "1"
		"enabled"                     "1"
		"xpos"                        "c-180"
		"ypos"                        "c10"
		"wide"                        "400"
		"tall"                        "155"
		"padding"                     "4"
		"RedText"                     "246 5 5 255"
		"WhiteText"                   "192 192 192 255"
	}

	HudHDRDemo
	{
		"fieldname"            "HudHDRDemo"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "0"
		"ypos"                 "0"
		"wide"                 "640"
		"tall"                 "480"
		"PaintBackgroundType"  "2"
		"Alpha"                "255"
		"BorderBottom"         "64"
		"BorderCenter"         "0"
		"BorderColor"          "0 0 0 255"
		"BorderLeft"           "16"
		"BorderRight"          "16"
		"BorderTop"            "16"
		"LeftTitleY"           "422"
		"RightTitleY"          "422"
		"TextColor"            "255 255 255 255"
	}

	// Game instructor
	HudHintDisplay
	{
		"fieldname"  "HudHintDisplay"
		"visible"    "0"
		"enabled"    "1"
		"xpos"       "c-200"
		"ypos"       "294"
		"wide"       "400"
		"tall"       "50"
		"center_x"   "0"
		"center_y"   "-1"
		"text_xpos"  "8"
		"text_ypos"  "8"
	}

	// Game instructor
	HudHintKeyDisplay
	{
		"fieldname"            "HudHintKeyDisplay"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "r120"
		"ypos"                 "r340"
		"wide"                 "100"
		"tall"                 "200"
		"PaintBackgroundType"  "2"
		"text_xgap"            "8"
		"text_xpos"            "8"
		"text_ygap"            "8"
		"text_ypos"            "8"
		"TextColor"            "255 170 0 220"
	}

	HudHistoryResource
	{
		"fieldname"    "HudHistoryResource"
		"visible"      "1"
		"enabled"      "1"
		"xpos"         "r640"
		"wide"         "640"
		"tall"         "330"
		"history_gap"  "55"
	}

	HudHostageRescueZone
	{
		"fieldname"            "HudHostageRescueZone"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "16"
		"ypos"                 "248"
		"wide"                 "40"
		"tall"                 "40"
		"PaintBackgroundType"  "2"
		"FlashColor"           "HudIcon_Red"
		"IconColor"            "HudIcon_Green"
	}

	HudInfectedVOIP
	{
		"fieldname"            "HudInfectedVOIP"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "r130"
		"ypos"                 "c100"
		"wide"                 "120"
		"tall"                 "84"
		"usetitlesafe"         "2"
		"PaintBackgroundType"  "0"
	}

	HudIntensityGraph
	{
		"fieldname"            "HudIntensityGraph"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "r75"
		"ypos"                 "190"
		"wide"                 "70"
		"tall"                 "100"
		"PaintBackgroundType"  "2"
	}

	HudLeavingAreaWarning
	{
		"fieldname"            "HudLeavingAreaWarning"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "10"
		"ypos"                 "c26"
		"wide"                 "200"
		"tall"                 "14"
		"usetitlesafe"         "2"
		"PaintBackgroundType"  "2"
	}

	HudMenu
	{
		"fieldname"        "HudMenu"
		"visible"          "1"
		"enabled"          "1"
		"zpos"             "1"
		"wide"             "640"
		"tall"             "480"
		"ItemFont"         "Default"
		"ItemFontPulsing"  "Default"
		"TextFont"         "Default"
	}

	HudMessage
	{
		"fieldname"  "HudMessage"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudMessagePanel
	{
		"fieldname"            "HudMessagePanel"
		"visible"              "0"
		"enabled"              "1"
		"xpos"                 "120"
		"ypos"                 "r235"
		"wide"                 "400"
		"tall"                 "180"
		"PaintBackgroundType"  "2"
		"text_spacing"         "1"
		"text_xpos"            "4"
		"text_ypos"            "4"
	}

	HudMOTD
	{
		"fieldname"  "HudMOTD"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudPredictionDump
	{
		"fieldname"  "HudPredictionDump"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	// Progress bar. Healing/being healed, starting generator etc
	HudProgressBar
	{
		"fieldname"                 "HudProgressBar"
		"visible"                   "1"
		"enabled"                   "1"
		"xpos"                      "c-114"
		"ypos"                      "c10"
		"wide"                      "300"
		"tall"                      "80"
		"PaintBackgroundType"       "0"
		"PaintBackground"           "0"
	}

	// Kill feed eg: Player X killed smoker
	HudPZDamageRecord
	{
		"fieldname"                   "HudPZDamageRecord"
		"visible"                     "1"
		"enabled"                     "1"
		"xpos"                        "0"
		"ypos"                        "170"
		"wide"                        "f0"
		"tall"                        "75"
		"usetitlesafe"                "1"
		"PaintBackgroundType"         "2"
		"label_textalign"             "west"
	}

	HUDQuickInfo
	{
		"fieldname"  "HUDQuickInfo"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudRoundTimer
	{
		"fieldname"            "HudRoundTimer"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "c-20"
		"ypos"                 "440"
		"wide"                 "120"
		"tall"                 "40"
		"PaintBackgroundType"  "2"
		"digit_xpos"           "34"
		"digit_ypos"           "2"
		"FlashColor"           "HudIcon_Red"
		"icon_xpos"            "0"
		"icon_ypos"            "2"
	}

	// Scavenge gascan hud
	HudScavengeProgress
	{
		"fieldname"        "HudScavengeProgress"
		"visible"          "1"
		"enabled"          "1"
		"xpos"             "c-42"
		"ypos"             "23"
		"zpos"             "0"
		"wide"             "85"
		"tall"             "43"
		"NumberFont"       "HudNumbers"
		"PaintBackground"  "0"
	}

	// Scavenge round timer
	HudScavengeTimer
	{
		"fieldname"        "HudScavengeTimer"
		"visible"          "1"
		"enabled"          "1"
		"xpos"             "c-220"
		"ypos"             "5"
		"zpos"             "0"
		"wide"             "440"
		"tall"             "100"
		"NumberFont"       "HudNumbers"
		"PaintBackground"  "0"
	}

	HudScenarioIcon
	{
		"fieldname"            "HudScenarioIcon"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "c110"
		"ypos"                 "443"
		"wide"                 "40"
		"tall"                 "44"
		"PaintBackgroundType"  "2"
		"IconColor"            "Hostage_Yellow"
	}

	HudScope
	{
		"fieldname"  "HudZoom"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudScriptedMode
	{
		"fieldname"        "HudScriptedMode"
		"visible"          "1"
		"enabled"          "1"
		"xpos"             "c-320"
		"ypos"             "0"
		"zpos"             "0"
		"wide"             "640"
		"tall"             "480"
		"NumberFont"       "HudNumbers"
		"PaintBackground"  "0"
	}

	HudShoppingCart
	{
		"fieldname"            "HudShoppingCart"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "16"
		"ypos"                 "200"
		"wide"                 "40"
		"tall"                 "40"
		"PaintBackgroundType"  "2"
		"IconColor"            "HudIcon_Green"
	}

	HudSuit
	{
		"fieldname"            "HudSuit"
		"visible"              "1"
		"enabled"              "1"
		"xpos"                 "140"
		"ypos"                 "432"
		"wide"                 "108"
		"tall"                 "36"
		"PaintBackgroundType"  "2"
		"digit_xpos"           "50"
		"digit_ypos"           "2"
		"text_xpos"            "8"
		"text_ypos"            "20"
	}

	// Survival round timer
	HudSurvivalTimer
	{
		"fieldname"        "HudSurvivalTimer"
		"visible"          "1"
		"enabled"          "1"
		"xpos"             "c-220"
		"ypos"             "-2"
		"zpos"             "0"
		"wide"             "440"
		"tall"             "100"
		"NumberFont"       "HudNumbers"
		"PaintBackground"  "0"
	}

	HudTerritory
	{
		"fieldname"  "HudTerritory"
		"visible"    "1"
		"enabled"    "1"
		"xpos"       "240"
		"ypos"       "432"
		"wide"       "240"
		"tall"       "48"
	}

	HudTrain
	{
		"fieldname"  "HudTrain"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	HudVehicle
	{
		"fieldname"  "HudVehicle"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	// Local player voice chat icon
	HudVoiceSelfStatus
	{
		"fieldname"             "HudVoiceSelfStatus"
		"visible"               "1"
		"enabled"               "1"
		"xpos"                  "r132"
		"ypos"                  "r78"
		"wide"                  "24"
		"tall"                  "24"
		"usetitlesafe"          "1"
	}

	HudVoiceStatus
	{
		"fieldname"     "HudVoiceStatus"
		"visible"       "1"
		"enabled"       "1"
		"xpos"          "r130"
		"ypos"          "0"
		"wide"          "150"
		"tall"          "290"
		"icon_tall"     "16"
		"icon_wide"     "16"
		"icon_xpos"     "0"
		"icon_ypos"     "0"
		"inverted"      "0"
		"item_spacing"  "2"
		"item_tall"     "15"
		"item_wide"     "120"
		"text_font"     "DefaultDropShadow"
		"text_xpos"     "18"
	}

	HudWeapon
	{
		"fieldname"  "HudWeapon"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	// Local player weapon section
	HudWeaponSelection
	{
		"fieldname"                   "HudWeaponSelection"
		"visible"                     "1"
		"enabled"                     "1"
		"xpos"                        "r98"
		"ypos"                        "c-90"
		"wide"                        "100"
		"tall"                        "175"
		"usetitlesafe"                "1"
		"Ammo1XPos"                   "55"
		"Ammo1YPos"                   "4"
		"Ammo2XPos"                   "58"
		"Ammo2YPos"                   "5"
		"AmmoIconSize"                "22"
		"AmmoIconXPos"                "20"
		"AmmoIconYPos"                "3"
		"BoxDirection"                "0"
		"BoxGap"                      "1"
		"ChainsawBarTall"             "19"
		"ChainsawBarWide"             "5"
		"ChainsawBarX"                "45"
		"ChainsawBarY"                "2"
		"ChainsawTall"                "19"
		"ChainsawWide"                "41"
		"ChainsawX"                   "2"
		"ChainsawY"                   "2"
		"IconSize"                    "24"
		"IconXPos"                    "-55"
		"IconYPos"                    "-5"
		"IconYPos_lodef"              "2"
		"InactiveItemColor"           "55 55 55 255"
		"LargeBoxTall"                "32"
		"LargeBoxWide"                "150"
		"MaxSlots"                    "5"
		"MeleeWeaponTall"             "22"
		"MeleeWeaponWide"             "49"
		"MeleeWeaponX"                "2"
		"MeleeWeaponY"                "0"
		"PistolAmmoFont"              "HudAmmo"
		"PistolBoxTall"               "24"
		"PistolBoxWide"               "53"
		"PlaySelectSounds"            "0"
		"PrimaryAmmoFont"             "HudAmmo"
		"PrimaryAmmoXPos"             "22"
		"PrimaryAmmoYPos"             "0"
		"PrimaryBindingYPos"          "38"
		"PrimaryWeaponBoxTall"        "28"
		"PrimaryWeaponBoxWide"        "53"
		"PrimaryWeaponsYPos"          "10"
		"PrimaryWeaponTall"           "20"
		"PrimaryWeaponWide"           "60"
		"ReserveAmmoFont"             "HudAmmoSmall"
		"ReserveAmmoXPos"             "22"
		"ReserveAmmoYPos"             "14"
		"RightSideIndent"             "10"
		"SelectedItemColor"           "142 214 57 255"
		"SelectedReserveAmmoColor"    "93 142 32 255"
		"SelectedScale"               "1.0"
		"SelectionGrowTime"           "0.4"
		"SelectionNumberXPos"         "4"
		"SelectionNumberYPos"         "4"
		"SmallBoxTall"                "24"
		"SmallBoxWide"                "150"
		"SpecialAmmoXPos"             "18"
		"SpecialAmmoYPos"             "6"
		"TextColor"                   "SelectionTextFg"
		"TextYPos"                    "68"
		"UnselectedItemColor"         "White"
		"UnselectedReserveAmmoColor"  "169 169 169 255"
	}

	// Local player infected health section
	HudZombieHealth
	{
		"fieldname"             "HudZombieHealth"
		"visible"               "1"
		"enabled"               "1"
		"xpos"                  "r387"
		"ypos"                  "r100"
		"wide"                  "400"
		"tall"                  "100"
		"usetitlesafe"          "1"
	}

	// Infected Tank approaching / Too far from Survivors
	HudZombiePanel
	{
		"fieldname"                   "HudZombiePanel"
		"visible"                     "1"
		"enabled"                     "1"
		"xpos"                        "c-190"
		"ypos"                        "c10"
		"wide"                        "400"
		"tall"                        "155"
	}

	HudZoom
	{
		"fieldname"        "HudZoom"
		"visible"          "1"
		"enabled"          "1"
		"BorderThickness"  "88"
		"Circle1Radius"    "66"
		"Circle2Radius"    "74"
		"DashGap"          "16"
		"DashHeight"       "4"
	}

	overview
	{
		"fieldname"  "overview"
		"visible"    "1"
		"enabled"    "1"
		"xpos"       "0"
		"ypos"       "480"
		"wide"       "0"
		"tall"       "0"
	}

	PlayerLabel
	{
		"fieldname"  "PlayerLabel"
		"visible"    "1"
		"enabled"    "1"
		"xpos"       "c-320"
		"ypos"       "c-240"
		"wide"       "640"
		"tall"       "480"
	}

	// Infected rematch voting hud
	PZEndGamePanel
	{
		"fieldname"  "PZEndGamePanel"
		"visible"    "1"
		"enabled"    "1"
		"xpos"       "c-177"
		"ypos"       "c10"
		"wide"       "354"
		"tall"       "200"
	}

	ScorePanel
	{
		"fieldname"  "ScorePanel"
		"visible"    "1"
		"enabled"    "1"
		"wide"       "640"
		"tall"       "480"
	}

	StatsCrawl
	{
		"fieldname"                "StatsCrawl"
		"visible"                  "1"
		"enabled"                  "1"
		"xpos"                     "0"
		"ypos"                     "0"
		"wide"                     "f0"
		"tall"                     "f0"
		"ButtonFont"               "GameUIButtons"
		"CreditsCrawlFont"         "Credits"
		"skip_legend_inset_x"      "10"
		"skip_legend_inset_y"      "25"
		"SkipLabelFont"            "DefaultLarge"
		"StatsCrawlFont"           "OuttroStatsCrawl"
		"StatsCrawlUnderlineFont"  "OuttroStatsCrawlUnderline"
		"vote_bot_inset_x"         "90"
		"vote_bot_inset_y"         "45"
		"votes"
		{
			"box_inset"                "1"
			"box_size"                 "16"
			"spacer"                   "4"
		}
	}

	TargetID
	{
		"fieldname"  "TargetID"
		"visible"    "1"
		"enabled"    "1"
		"xpos"       "c-320"
		"ypos"       "c-240"
		"wide"       "640"
		"tall"       "480"
	}

	TerritorySCore
	{
		"fieldname"  "TerritoryScore"
		"visible"    "0"
		"enabled"    "0"
		"xpos"       "240"
		"ypos"       "450"
		"wide"       "200"
		"tall"       "200"
		"text_xpos"  "8"
		"text_ypos"  "4"
	}
}
