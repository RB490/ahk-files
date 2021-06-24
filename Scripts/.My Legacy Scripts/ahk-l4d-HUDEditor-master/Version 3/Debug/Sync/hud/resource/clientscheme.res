
Scheme
{
	//Name - currently overriden in code
	//{
	//	"Name"	"ClientScheme"
	//}

	//////////////////////// COLORS ///////////////////////////
	Colors
	{
		// base colors
		"Orange"			"255 176 0 255"
		"OrangeDim"			"255 176 0 120"
		"LightOrange"		"188 112 0 128"
		
		"Red"				"192 28 0 140"
		"Black"				"0 0 0 255"
		"HealthHurtRed"		"192 28 0 255"
		"TransparentDarkBlack"	"0 0 0 220"
		"TransparentBlack"	"0 0 0 196"
		"TransparentLightBlack"	"0 0 0 90"

		// TERROR
		"ProgressGreen"			"0 128 0 255"
		"HealthGreen"			"0 200 0 255"
		"BrightGreen"			"0 255 0 255"
		"BrightRed"				"255 0 0 255"
		"DeepRed"				"168 26 26 255"
		"Blue"                  "138 182 219 255"
		"Tan"				"209 199 151 255"
		"BrightGray"		"216 216 216 255"
		"MediumGray"        "145 145 145 255"
		"TransparentGray"		"192 192 192 192"
		"Gray"					"192 192 192 255"
		"DarkGray"				"64 64 64 255"
		"DarkerGray"            "40 40 40 255"
		"Yellow"				"255 255 0 255"
		"White"					"255 255 255 255"
		"TransparentLightRed"	"255 0 0 90"
		"HudIcon_Cyan"			"0 255 255 120"
		"HudIcon_Cyan_Pulse"	"0 255 255 255"
		"BrightCyan"			"0 255 255 255"
		"Credits"				"192 192 192 192"
		"TransparentGreen"		"64 255 64 192"

		"LightBlue"				"60 143 175 255"

		"Blank"				"0 0 0 0"
		"ForTesting"		"255 0 0 32"
		"ForTesting_Magenta"	"255 0 255 255"
		"ForTesting_MagentaDim"	"255 0 255 120"
		
		"dialogueSubTitle"		"158 158 158 255"
		
		"VersusBrown"		"129 114 89 255"
		"VersusSelected"	"143 50 19 255"
		"VersusDarkGrey"	"55 56 60 255"
		
	}

	///////////////////// BASE SETTINGS ////////////////////////
	// default settings for all panels
	// controls use these to determine their settings
	BaseSettings
	{
		Ability.Clock.FullColor			"255 255 255 255"
		Ability.Clock.EmptyColor		"128 128 128 96"
		Ability.Fill.BgColor			"128 128 128 96"

		Rosetta.DefaultFgColor			"White"
		Rosetta.DefaultBgColor			"Blank"
		Rosetta.ArmedBgColor			"Blank"
		Rosetta.DisabledBgColor			"Blank"
		Rosetta.DisabledBorderColor		"Blank"
		Rosetta.LineColor				"192 192 192 128"
		Rosetta.DrawBorder				"0"
		Rosetta.DefaultFont				DefaultDropShadowBold
		Rosetta.ArmedFont				DefaultLargeDropShadowBold

		Ammo.FgColor					"TransparentGreen"

		Player.IT1						"Yellow"
		Player.IT2						"White"
		Player.ITBG						"BrightRed"

		// vgui_controls color specifications
		Border.Bright					"BrightGray"		// the lit side of a control
		Border.Dark						"Gray"				// the dark/unlit side of a control
		Border.Selection				"Blank"				// the additional border color for displaying the default/selected button
		Border.BuyPreset				"Orange"


		Button.TextColor				"Gray"
		Button.BgColor					"0 0 0 64"
		Button.ArmedTextColor			"Gray"
		Button.ArmedBgColor				"Red"
		Button.DepressedTextColor		"Gray"
		Button.DepressedBgColor			"Red"

		RoundedButton.FgColor			"64 64 64 255"
		RoundedButton.BgColor			"48 48 48 255"
		RoundedButton.ArmedFgColor		"96 96 96 255"
		RoundedButton.ArmedBgColor		"48 48 48 255"
		RoundedButton.DepressedFgColor	"128 128 128 255"
		RoundedButton.DepressedBgColor	"64 64 64 255"

		CheckButton.TextColor			"FgColor"
		CheckButton.SelectedTextColor	"FgColor"
		CheckButton.BgColor				"48 48 48 255"
		CheckButton.Border1  			"64 64 64 255" 			// the left checkbutton border
		CheckButton.Border2  			"64 64 64 255"			// the right checkbutton border
		CheckButton.Check				"FgColor"				// color of the check itself

		ComboBoxButton.ArrowColor		"Orange"
		ComboBoxButton.ArmedArrowColor	"Orange"
		ComboBoxButton.BgColor			"TransparentBlack"
		ComboBoxButton.DisabledBgColor	"Blank"

		Frame.BgColor					"TransparentDarkBlack"
		Frame.OutOfFocusBgColor			"TransparentDarkBlack"
		Frame.FocusTransitionEffectTime	"0.0"	// time it takes for a window to fade in/out on focus/out of focus
		Frame.TransitionEffectTime		"0.0"	// time it takes for a window to fade in/out on open/close
		Frame.AutoSnapRange				"0"
		FrameGrip.Color1				"Blank"
		FrameGrip.Color2				"Blank"
		FrameTitleButton.FgColor		"Blank"
		FrameTitleButton.BgColor		"Blank"
		FrameTitleButton.DisabledFgColor	"Blank"
		FrameTitleButton.DisabledBgColor	"Blank"
		FrameSystemButton.FgColor		"Blank"
		FrameSystemButton.BgColor		"Blank"
		FrameSystemButton.Icon			""
		FrameSystemButton.DisabledIcon	""
		FrameTitleBar.TextColor			"Orange"
		FrameTitleBar.BgColor			"Blank"
		FrameTitleBar.DisabledTextColor	"Orange"
		FrameTitleBar.DisabledBgColor	"Blank"

		GraphPanel.FgColor				"Orange"
		GraphPanel.BgColor				"TransparentBlack"

		Label.TextDullColor				"DarkGray"
		Label.TextColor					"FgColor"
		Label.TextBrightColor			"FgColor"
		Label.SelectedTextColor			"FgColor"
		Label.BgColor					"Blank"
		Label.DisabledFgColor1			"Blank"
		Label.DisabledFgColor2			"DarkGray"

		ListPanel.TextColor					"Orange"
		ListPanel.BgColor					"TransparentBlack"
		ListPanel.SelectedTextColor			"Black"
		ListPanel.SelectedBgColor			"Red"
		ListPanel.SelectedOutOfFocusBgColor	"Red"
		ListPanel.EmptyListInfoTextColor	"Orange"

		Menu.TextColor					"Orange"
		Menu.BgColor					"TransparentBlack"
		Menu.ArmedTextColor				"Orange"
		Menu.ArmedBgColor				"Red"
		Menu.TextInset					"6"

		Chat.TypingText					"FgColor"

		Panel.FgColor					"FgColor"
		Panel.BgColor					"blank"

		HTML.BgColor					"Black"

		"BuyPreset.BgColor"				"0 0 0 128"
		"BuyPresetListBox.BgColor"			"0 0 0 128"
		"Popup.BgColor"					"0 0 0 230"

		ProgressBar.FgColor				"FgColor"
		ProgressBar.BgColor				"TransparentBlack"

		PropertySheet.TextColor			"Orange"
		PropertySheet.SelectedTextColor	"Orange"
		PropertySheet.TransitionEffectTime	"0.25"	// time to change from one tab to another

		RadioButton.TextColor			"Orange"
		RadioButton.SelectedTextColor	"Orange"

		RichText.TextColor				"Orange"
		RichText.BgColor				"Blank"
		RichText.SelectedTextColor		"Orange"
		RichText.SelectedBgColor		"Blank"

		ScrollBarButton.FgColor				"Orange"
		ScrollBarButton.BgColor				"Blank"
		ScrollBarButton.ArmedFgColor		"Orange"
		ScrollBarButton.ArmedBgColor		"Blank"
		ScrollBarButton.DepressedFgColor	"Orange"
		ScrollBarButton.DepressedBgColor	"Blank"

		ScrollBarSlider.FgColor				"Blank"		// nob color
		ScrollBarSlider.BgColor				"Blank"		// slider background color

		SectionedListPanel.HeaderTextColor	"Gray"
		SectionedListPanel.HeaderBgColor	"Blank"
		SectionedListPanel.DividerColor		"64 64 64 255"
		SectionedListPanel.TextColor		"Gray"
		SectionedListPanel.BrightTextColor	"Gray"
		SectionedListPanel.BgColor			"TransparentLightBlack"
		SectionedListPanel.SelectedTextColor			"Black"
		SectionedListPanel.SelectedBgColor				"Red"
		SectionedListPanel.OutOfFocusSelectedTextColor	"Black"
		SectionedListPanel.OutOfFocusSelectedBgColor	"255 255 255 32"
		SectionedListPanel.Font				"DefaultVerySmall"

		Slider.NobColor				"108 108 108 255"
		Slider.TextColor			"127 140 127 255"
		Slider.TrackColor			"31 31 31 255"
		Slider.DisabledTextColor1	"117 117 117 255"
		Slider.DisabledTextColor2	"30 30 30 255"

		TextEntry.TextColor			"Orange"
		TextEntry.BgColor			"TransparentBlack"
		TextEntry.CursorColor		"Orange"
		TextEntry.DisabledTextColor	"Orange"
		TextEntry.DisabledBgColor	"Blank"
		TextEntry.SelectedTextColor	"Black"
		TextEntry.SelectedBgColor	"Red"
		TextEntry.OutOfFocusSelectedBgColor	"Red"
		TextEntry.FocusEdgeColor	"TransparentBlack"

		ToggleButton.SelectedTextColor	"Orange"

		Tooltip.TextColor			"TransparentBlack"
		Tooltip.BgColor				"Red"

		TreeView.BgColor			"TransparentBlack"

		WizardSubPanel.BgColor		"Blank"

		// scheme-specific colors
		"FgColor"		"Gray"
		"BgColor"		"TransparentBlack"

		"ViewportBG"		"Blank"
		"team0"			"204 204 204 255" // Spectators
		"team1"			"255 64 64 255" // CT's
		"team2"			"153 204 255 255" // T's

		"MapDescriptionText"	"Orange" // the text used in the map description window
		"CT_Blue"			"153 204 255 255"
		"T_Red"				"255 64 64 255"
		"Hostage_Yellow"	"Panel.FgColor"
		"HudIcon_Green"		"0 160 0 255"
		"HudIcon_Red"		"160 0 0 255"

		// CHudMenu
		"ItemColor"		"255 167 42 200"	// default 255 167 42 255
		"MenuColor"		"233 208 173 255"
		"MenuBoxBg"		"0 0 0 100"

		// weapon selection colors
		"SelectionNumberFg"		"255 220 0 200"
		"SelectionTextFg"		"255 220 0 200"
		"SelectionEmptyBoxBg" 	"0 0 0 80"
		"SelectionBoxBg" 		"0 0 0 80"
		"SelectionSelectedBoxBg" "0 0 0 190"

		// Hint message colors
		"HintMessageFg"			"255 255 255 255"
		"HintMessageBg" 		"TransparentBlack"

		"ProgressBarFg"			"255 30 13 255"

		// Top-left corner of the "Counter-Strike" on the main screen
		"Main.Title1.X"		"32"
		"Main.Title1.Y"		"180"
		"Main.Title1.Color"	"255 255 255 255"

		// Top-left corner of the "SOURCE" on the main screen
		"Main.Title2.X"		"380"
		"Main.Title2.Y"		"205"
		"Main.Title2.Color"	"255 255 255 80"

		// Top-left corner of the "BETA" on the main screen
		"Main.Title3.X"		"460"
		"Main.Title3.Y"		"-10"
		"Main.Title3.Color"	"255 255 0 255"

		// Top-left corner of the menu on the main screen
		"Main.Menu.X"		"32"
		"Main.Menu.Y"		"248"

		// Blank space to leave beneath the menu on the main screen
		"Main.BottomBorder"	"32"
		
		// TERROR:
		"MessageTextProportional"	"0"	// scale the HudMessageText text?
	}

	//////////////////////// BITMAP FONT FILES /////////////////////////////
	//
	// Bitmap Fonts are ****VERY*** expensive static memory resources so they are purposely sparse
	BitmapFontFiles
	{
		// UI buttons, custom font, (256x64)
		"Buttons"		"materials/vgui/fonts/buttons_32.vbf"
	}

	//////////////////////// FONTS /////////////////////////////
	//
	// describes all the fonts
	Fonts
	{
		// fonts are used in order that they are listed
		// fonts listed later in the order will only be used if they fulfill a range not already filled
		// if a font fails to load then the subsequent fonts will replace
		//ink_CUSTOM_GOTHIC/////////////////////////////////////////////////////
		ink_1
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"1"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_2
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"2"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_3
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"3"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_4
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"4"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_5
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"5"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_6
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"6"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_7
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"7"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_8
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"8"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_9
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"9"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_10
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"10"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_11
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"11"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_12
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"12"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_13
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"13"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_14
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"14"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_15
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"15"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_16
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"16"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_17
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"17"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_18
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"18"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_19
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"19"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_20
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"20"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_21
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"21"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_22
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"22"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_23
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"23"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_24
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"24"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_25
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"25"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_26
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"26"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_27
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"27"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_28
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"28"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_29
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"29"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_30
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"30"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_31
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"31"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_32
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"32"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_33
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"33"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_34
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"34"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_35
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"35"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_36
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"36"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_37
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"37"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_38
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"38"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_39
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"39"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_40
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"40"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_41
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"41"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_42
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"42"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_43
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"43"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_44
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"44"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_45
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"45"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_46
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"46"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_47
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"47"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_48
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"48"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_49
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"49"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_50
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"50"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_51
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"51"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_52
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"52"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_53
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"53"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_54
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"54"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_55
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"55"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_56
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"56"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_57
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"57"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_58
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"58"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_59
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"59"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_60
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"60"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_61
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"62"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_63
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"63"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_64
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"64"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		//ink_CUSTOM_GOTHIC_shadow/////////////////////////////////////////////////////
		ink_shadow_1
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"1"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_2
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"2"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_3
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"3"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_4
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"4"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_5
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"5"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_6
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"6"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_7
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"7"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_8
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"8"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_9
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"9"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_10
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"10"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_11
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"11"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_12
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"12"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_13
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"13"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_14
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"14"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_15
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"15"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_16
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"16"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_17
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"17"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_18
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"18"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_19
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"19"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_20
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"20"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_21
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"21"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_22
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"22"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_23
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"23"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_24
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"24"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_25
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"25"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_26
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"26"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_27
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"27"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_28
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"28"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_29
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"29"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_30
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"30"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_31
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"31"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_32
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"32"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_33
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"33"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_34
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"34"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_35
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"35"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_36
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"36"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_37
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"37"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_38
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"38"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_39
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"39"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_40
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"40"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_41
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"41"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_42
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"42"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_43
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"43"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_44
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"44"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_45
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"45"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_46
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"46"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_47
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"47"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_48
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"48"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_49
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"49"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_50
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"50"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_51
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"51"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_52
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"52"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_53
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"53"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_54
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"54"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_55
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"55"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_56
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"56"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_57
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"57"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_58
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"58"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_59
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"59"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_60
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"60"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_61
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"62"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_63
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"63"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_shadow_64
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"64"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		//ink_weight_CUSTOM_GOTHIC/////////////////////////////////////////////////////
		ink_weight_1
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"1"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_2
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"2"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_3
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"3"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_4
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"4"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_5
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"5"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_6
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"6"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_7
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"7"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_8
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"8"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_9
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"9"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_10
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"10"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_11
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"11"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_12
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"12"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_13
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"13"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_14
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"14"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_15
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"15"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_16
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"16"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_17
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"17"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_18
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"18"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_19
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"19"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_20
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"20"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_21
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"21"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_22
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"22"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_23
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"23"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_24
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"24"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_25
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"25"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_26
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"26"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_27
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"27"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_28
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"28"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_29
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"29"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_30
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"30"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_31
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"31"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_32
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"32"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_33
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"33"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_34
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"34"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_35
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"35"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_36
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"36"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_37
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"37"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_38
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"38"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_39
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"39"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_40
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"40"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_41
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"41"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_42
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"42"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_43
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"43"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_44
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"44"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_45
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"45"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_46
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"46"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_47
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"47"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_48
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"48"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_49
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"49"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_50
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"50"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_51
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"51"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_52
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"52"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_53
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"53"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_54
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"54"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_55
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"55"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_56
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"56"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_57
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"57"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_58
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"58"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_59
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"59"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_60
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"60"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_61
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"62"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_63
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"63"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_weight_64
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"64"
				"weight"	"1200"
				"additive"	"1"
				"antialias" "1"
			}
		}
		//ink_weight_CUSTOM_GOTHIC_shadow/////////////////////////////////////////////////////
		ink_weight_shadow_1
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"1"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_2
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"2"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_3
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"3"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_4
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"4"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_5
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"5"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_6
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"6"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_7
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"7"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_8
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"8"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_9
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"9"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_10
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"10"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_11
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"11"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_12
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"12"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_13
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"13"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_14
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"14"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_15
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"15"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_16
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"16"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_17
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"17"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_18
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"18"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_19
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"19"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_20
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"20"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_21
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"21"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_22
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"22"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_23
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"23"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_24
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"24"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_25
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"25"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_26
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"26"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_27
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"27"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_28
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"28"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_29
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"29"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_30
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"30"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_31
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"31"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_32
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"32"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_33
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"33"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_34
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"34"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_35
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"35"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_36
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"36"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_37
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"37"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_38
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"38"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_39
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"39"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_40
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"40"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_41
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"41"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_42
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"42"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_43
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"43"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_44
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"44"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_45
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"45"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_46
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"46"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_47
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"47"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_48
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"48"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_49
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"49"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_50
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"50"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_51
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"51"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_52
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"52"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_53
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"53"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_54
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"54"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_55
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"55"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_56
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"56"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_57
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"57"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_58
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"58"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_59
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"59"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_60
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"60"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_61
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"62"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_63
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"63"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_weight_shadow_64
		{
			"1"
			{
				"name"		"Trade Gothic"
				"tall"		"64"
				"weight"	"1200"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		//ink_CUSTOM_GOTHICBOLD/////////////////////////////////////////////////////
		ink_bold_1
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"1"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_2
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"2"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_3
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"3"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_4
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"4"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_5
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"5"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_6
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"6"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_7
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"7"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_8
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"8"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_9
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"9"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_10
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"10"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_11
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"11"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_12
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"12"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_13
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"13"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_14
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"14"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_15
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"15"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_16
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"16"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_17
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"17"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_18
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"18"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_19
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"19"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_20
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"20"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_21
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"21"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_22
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"22"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_23
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"23"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_24
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"24"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_25
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"25"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_26
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"26"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_27
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"27"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_28
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"28"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_29
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"29"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_30
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"30"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_31
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"31"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_32
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"32"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_33
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"33"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_34
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"34"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_35
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"35"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_36
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"36"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_37
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"37"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_38
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"38"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_39
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"39"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_40
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"40"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_41
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"41"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_42
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"42"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_43
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"43"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_44
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"44"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_45
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"45"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_46
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"46"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_47
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"47"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_48
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"48"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_49
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"49"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_50
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"50"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_51
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"51"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_52
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"52"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_53
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"53"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_54
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"54"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_55
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"55"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_56
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"56"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_57
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"57"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_58
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"58"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_59
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"59"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_60
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"60"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_61
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"62"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_63
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"63"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		ink_bold_64
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"64"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}
		//ink_bold_CUSTOM_GOTHICBOLD_shadow/////////////////////////////////////////////////////
		ink_bold_shadow_1
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"1"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_2
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"2"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_3
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"3"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_4
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"4"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_5
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"5"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_6
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"6"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_7
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"7"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_8
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"8"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_9
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"9"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_10
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"10"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_11
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"11"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_12
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"12"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_13
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"13"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_14
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"14"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_15
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"15"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_16
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"16"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_17
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"17"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_18
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"18"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_19
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"19"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_20
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"20"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_21
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"21"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_22
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"22"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_23
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"23"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_24
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"24"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_25
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"25"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_26
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"26"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_27
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"27"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_28
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"28"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_29
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"29"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_30
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"30"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_31
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"31"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_32
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"32"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_33
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"33"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_34
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"34"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_35
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"35"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_36
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"36"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_37
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"37"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_38
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"38"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_39
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"39"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_40
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"40"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_41
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"41"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_42
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"42"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_43
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"43"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_44
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"44"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_45
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"45"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_46
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"46"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_47
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"47"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_48
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"48"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_49
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"49"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_50
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"50"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_51
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"51"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_52
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"52"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_53
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"53"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_54
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"54"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_55
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"55"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_56
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"56"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_57
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"57"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_58
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"58"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_59
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"59"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_60
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"60"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_61
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"62"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_63
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"63"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		ink_bold_shadow_64
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"64"
				"weight"	"400"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}

		//ink TWEAKED////////////////////////////////////////////////////
		HudAmmo
		{
			"1"
			{
				"name"  "Trade Gothic"	//Trade Gothic Bold
				"tall"  "25"
				"weight" "0"
				"additive" "1"
				"antialias" "1"
			}
		}
		HudAmmoLarge
		{
			"1"
			{
				"name"  "Trade Gothic"
				"tall"  "24"
				"weight" "0"
				"additive" "1"
				"antialias" "1"
			}
		}
		"CloseCaption_Normal"
		{
			"1"
			{
				"name"		"Tahoma"
				"tall"		"26"
				"weight"	"500"
				"antialias" "1"
			}
		}
		"CloseCaption_Italic"
		{
			"1"
			{
				"name"		"Tahoma"
				"tall"		"26"
				"weight"	"500"
				"antialias" "1"
			}
		}
		"CloseCaption_Bold"
		{
			"1"
			{
				"name"		"Tahoma"
				"tall"		"26"
				"weight"	"500"
				"antialias" "1"
			}
		}
		"CloseCaption_BoldItalic"
		{
			"1"
			{
				"name"		"Tahoma"
				"tall"		"26"
				"weight"	"500"
				"antialias" "1"
			}
		}
		"CloseCaption_Small"
		{
			"1"
			{
				"name"		"Tahoma"
				"tall"		"26"
				"weight"	"500"
				"antialias" "1"
			}
		}
		//ink END ///////////////////////////////////////////////////////
		"Default"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"    [$WIN32]
				"tall"			"14"    [$X360]
				"weight"		"400"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"antialias"		"1"
			}	
		}
		"DefaultDamage"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"16"    [$WIN32]
				"weight"		"400"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"antialias"		"1"
			}	
		}
		"DefaultDropShadow"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"900"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"dropshadow"	"1"
				"antialias"		"1"
			}
		}
		"DefaultDropShadowBold"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"900"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"dropshadow"	"1"
				"antialias"		"1"
			}
		}
		"DefaultSmall"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"0"
				"range"			"0x0000 0x017F"
				"antialias"		"1"
			}
		}
		"DefaultMoreSmall"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"9"
				"weight"		"0"
				"range"			"0x0000 0x017F"
				"antialias"		"1"
			}
		}
		"DefaultMoreSmallShadow"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"9"
				"weight"		"0"
				"range"			"0x0000 0x017F"
				"antialias"		"1"
				"dropshadow"	"1"
			}
		}
		"DefaultVerySmall"
		{
			"1"
			{
				"name"			"Tahoma"
				"tall"			"12"
				"weight"		"0"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"antialias"		"1"
			}
		}
		"DefaultLarge"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"700"
				"antialias"		"1"
			}
		}
		"DefaultLargeDropShadow"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"700"
				"antialias"		"1"
				"dropshadow"	"1"
			}
		}
		"DefaultLargeDropShadowBold"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"700"
				"antialias"		"1"
				"dropshadow"	"1"
			}
		}
		"DefaultMedium"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"DefaultMediumShadow"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"400"
				"antialias"		"1"
				"additive"		"0"
				"dropshadow"	"1"
			}
		}
		"FrameTitle"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"				[$WIN32]
				"tall"			"24"				[$X360]
				"weight"		"700"
				"antialias"		"1"
			}
		}
		"FrameTitleShadow"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"				[$WIN32]
				"tall"			"24"				[$X360]
				"weight"		"700"
				"antialias"		"1"
				"additive"		"0"
				"dropshadow"	"1"
			}
		}
		HudHintText
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		AwardText
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"700"
				"dropshadow"	"1"
				"antialias"		"1"
			}
		}
		"MessageText"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"10"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"OuttroStatsCrawl"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"14"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"OuttroStatsCrawlUnderline"	
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"16"
				"weight"		"400"
				// "underline"	"1"
				"antialias"		"1"
			}
		}
		"OuttroStatsCrawlTitles"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"PlayerDisplayName"	
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"14"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"PlayerDisplayNameSmall"	
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		PlayerDisplayHealth
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"15"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		HudNumbersSmall
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"16"
				"weight"		"1000"
				"additive"		"1"
				"antialias"		"1"
				"range"			"0x0000 0x017F"
			}
		}

		HudSelectionNumbers
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"11"
				"weight"		"700"
				"antialias"		"1"
				"additive"		"1"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
			}
		}

		HudSelectionText
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"11"
				"weight"		"700"
				"antialias"		"1"
				"yres"			"1 599"				[$WIN32]
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"additive"		"1"
			}
			"2" [$WIN32]
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"11"
				"weight"		"700"
				"antialias"		"1"
				"yres"			"600 767"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"additive"		"1"
			}
			"3" [$WIN32]
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"900"
				"antialias"		"1"
				"yres"			"768 1023"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
			}
			"4" [$WIN32]
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"16"
				"weight"		"900"
				"antialias"		"1"
				"yres"			"1024 1199"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
			}
			"5" [$WIN32]
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"17"
				"weight"		"1000"
				"antialias"		"1"
				"yres"			"1200 10000"
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
			}
		}
		
		DebugOverlay
		{
			"1"
			{
				"name"			"Courier New"
				"tall"			"14"		[$WIN32 || !($X360WIDE && $X360HIDEF)]
				"tall"			"20"		[$X360 && ($X360WIDE && $X360HIDEF)]
				"weight"		"400"		[$WIN32]
				"outline"		"1"			[$WIN32]
				"weight"		"700"		[$X360]
				"range"			"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
			}
		}

		ClientTitleFont
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"60"
				"weight"	"700"
				"antialias" "1"
			}
		}

		InstructorButtons
		{
			"1"
			{
				"bitmap"	"1"
				"name"		"Buttons"
				"scalex"	"0.8"
				"scaley"	"0.8"
			}
		}

		GameUIButtons
		{
			"1"
			{
				"bitmap"	"1"
				"name"		"Buttons"
				"scalex"	"0.5"
				"scaley"	"0.5"
			}
		}

		HudNumbers
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"28"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}

		SurvivalNumbers
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"38"
				"weight"	"400"
				"additive"	"1"
				"antialias" "1"
			}
		}

		HudAmmo
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"18"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"24"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge5	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"5"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge10	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"10"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge15	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"15"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge25	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"25"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge20	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"20"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge30	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"30"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge35	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"35"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge40	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"40"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge45	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"45"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge50	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"50"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge55	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"55"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		HudAmmoLarge60	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"60"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
////////////////////////////////////////////////////////////////////////////////////////

		HudAmmoLargeShadow5	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"5"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow10	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"10"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow15	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"15"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow16	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"16"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow20	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"20"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow25	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"25"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		
		HudAmmoLargeShadow30	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"30"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow35	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"35"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow40	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"40"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow45	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"45"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow50	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"50"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow55	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"55"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoLargeShadow60	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"60"
				"weight"	"0"
				"additive"	"0"
				"antialias" "1"
				"dropshadow"	"1"
			}
		}
		
		HudAmmoSmall
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"0"
				"additive"		"1"
				"antialias"		"1"
			}
		}
		
		HUDHealth
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"0"
				"additive"		"1"
				"antialias"		"1"
			}
		}

		HUDHealthSmall	//Tweaked by 125
		{
			"1"
			{
				"name"		"Trade Gothic Bold"		[$WIN32]
				"name"		"Trade Gothic Bold" [$OSX]
				"tall"		"15"
				"weight"	"0"
				"additive"	"1"
				"antialias" "1"
			}
		}
		
		SpectatorTarget
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"14"
				"weight"		"400"
				"additive"		"1"
				"antialias"		"1"
			}
		}

		"CloseCaption_Normal"
		{
			"1" [$X360]
			{
				"name"		"Tahoma"
				"tall"		"24"		[($X360WIDE && $X360HIDEF)]
				"tall"		"18"		[!($X360WIDE && $X360HIDEF)]
				"weight"	"400"
				"antialias" "1"
			}
			"1" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica"	[$OSX]
				"tall"		"26"
				"weight"	"500"
				"yres"		"601 10000"
			}
			"2" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica"	[$OSX]
				"tall"		"18"
				"weight"	"500"
				"yres"		"1 600"
			}
		}
		
		"CloseCaption_Italic"
		{
			"1" [$X360]
			{
				"name"		"Tahoma"
				"tall"		"24"		[($X360WIDE && $X360HIDEF)]
				"tall"		"18"		[!($X360WIDE && $X360HIDEF)]
				"weight"	"400"
				"italic"	"1"
				"antialias" "1"
			}
			
			"1" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica Italic"	[$OSX]
				"tall"		"26"
				"weight"	"500"
				"italic"	"1"
				"yres"		"601 10000"	
			}
			"2" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica Italic"	[$OSX]
				"tall"		"18"
				"weight"	"500"
				"italic"	"1"
				"yres"		"1 600"
			}
		}
		"CloseCaption_Bold"
		{
			"1" [$X360]
			{
				"name"		"Tahoma"
				"tall"		"24"		[($X360WIDE && $X360HIDEF)]
				"tall"		"18"		[!($X360WIDE && $X360HIDEF)]
				"weight"	"700"
				"antialias" "1"
			}

			"1" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica Bold"	[$OSX]
				"tall"		"26"
				"weight"	"900"
				"yres"		"601 10000"
			}
			"2" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica Bold"	[$OSX]
				"tall"		"18"
				"weight"	"900"
				"yres"		"1 600"
			}
		}
		"CloseCaption_BoldItalic"
		{
			"1" [$X360]
			{
				"name"		"Tahoma"
				"tall"		"24"		[($X360WIDE && $X360HIDEF)]
				"tall"		"18"		[!($X360WIDE && $X360HIDEF)]
				"weight"	"700"
				"italic"	"1"
				"antialias" "1"
			}

			"1" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica Bold Italic"	[$OSX]
				"tall"		"26"
				"weight"	"900"
				"italic"	"1"
				"yres"		"601 10000"
			}
			"2" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica Bold Italic"	[$OSX]
				"tall"		"18"
				"weight"	"900"
				"italic"	"1"
				"yres"		"1 600"
			}
		}
		"CloseCaption_Small"
		{
			"1" [$X360]
			{
				"name"		"Tahoma"
				"tall"		"22"		[($X360WIDE && $X360HIDEF)]
				"tall"		"16"		[!($X360WIDE && $X360HIDEF)]
				"weight"	"700"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
			}

			"1" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica"	[$OSX]
				"tall"		"18"
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"		"601 10000"
			}
			"2" [$WIN32]
			{
				"name"		"Tahoma"	[!$OSX]
				"name"		"Helvetica"	[$OSX]
				"tall"		"16"
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"		"1 600"
			}
		}
		
		// this is the symbol font
		"Marlett"
		{
			"1"
			{
				"name"		"Marlett"
				"tall"		"11"
				"weight"	"0"
				"symbol"	"1"
				"range"		"0x0000 0x007F"	//	Basic Latin
			}
		}
		"TransitionTitle" //L4D: Transition screen, death screen
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"24"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"TransitionTitleStats" //Tweaked by 125
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"22"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"MenuTitle" //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"MenuTitle_DropShadow" //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"400"
				"antialias"		"1"
				"dropshadow"	"1"
			}
		}
		"MenuTitle_DropShadow35" //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"35"
				"weight"		"400"
				"antialias"		"1"
				"dropshadow"	"1"
			}
		}
		"MenuSubTitle" //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"12"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"MenuSubTitleStats"	//Left 4 Dead	//Tweaked by 125
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"22"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"BodyText_medium" //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"14"
				"weight"		"400"
				"antialias"		"1"
			}
		}
		"BodyText_small" //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"11"
				"weight"		"500"
				"antialias"		"1"
			}
		}
		"InstructorTitle"  //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"18"
				"weight"		"400"
				"antialias"		"1"
				"dropshadow"	"1"
			}
		}
		"InstructorTitle_ss"  //Left 4 Dead
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"14"
				"weight"		"400"
				"antialias"		"1"
				"dropshadow"	"1"
			}
		}

		// purposely NOT using resolution overrides
		"TargetID"
		{
			"1" [$WIN32]
			{
				"name"			"Trade Gothic"		
				"tall"			"16"
				"weight"		"700"
				"antialias"		"1"
			}
			"1" [$OSX]
			{
				"name"			"Trade Gothic"
				"tall"			"16"			
				"weight"		"700"
				"antialias"		"1"
			}
		}

		"Credits"
		{
			"1"
			{
				"name"		"Trade Gothic Bold"
				"tall"		"30"
				"weight"	"400"
				"range"		"0x0000 0x007F"	//	Basic Latin
				"antialias" "1"
				"additive"	"1"
			}
		}
		
		HL2WeaponIcons [$WIN32]
		{
			"1"
			{
				"name"			"HalfLife2"
				"tall"			"64"
				"weight"		"0"
				"antialias"		"1"
				"additive"		"1"
				"custom"		"1"
			}
		}
		
		"L4D_Icons"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"16"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons17"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"17"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons18"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"18"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons19"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"19"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons20"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"20"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons21"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"21"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons22"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"22"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons23"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"23"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons24"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"24"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons25"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"25"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons26"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"26"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons27"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"27"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		"L4D_Icons28"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"28"
				"weight"	"400"
				"range"		"0x0000 0x007F"
				"antialias" "1"
				"additive"	"1"
			}
		}
		
		"L4D_Icons_medium"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"18"
				"weight"	"400"
				"range"		"0x0000 0x007F"	//	Basic Latin
				"antialias" "1"
				"additive"	"1"
			}
		}
		
		"L4D_Icons_large"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"24"
				"weight"	"400"
				"range"		"0x0000 0x007F"	//	Basic Latin
				"antialias" "1"
				"additive"	"1"
			}
		}
		
		"L4D_Weapons"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"30"
				"weight"	"400"
				"range"		"0x0000 0x007F"	//	Basic Latin
				"antialias" "1"
				"additive"	"1"
			}
		}
		
		"L4D_WeaponsSmall"
		{
			"1"
			{
				"name"		"ToolBox"
				"tall"		"28"
				"weight"	"400"
				"range"		"0x0000 0x007F"	//	Basic Latin
				"antialias" "1"
				"additive"	"1"
			}
		}
		
		"CommentaryDefault"
		{
			"1" [$X360]
			{
				"name"		"Verdana"
				"tall"		"14"	[$X360LODEF]
				"tall"		"20"	[$X360HIDEF]
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"antialias"	"1"
			}
		
			"1" [$WIN32]
			{
				"name"		"Verdana"
				"tall"		"12"
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"		"480 599"
				"antialias"	"1"
			}
			"2" [$WIN32]
			{
				"name"		"Verdana"
				"tall"		"13"
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"		"600 767"
				"antialias"	"1"
			}
			"3" [$WIN32]
			{
				"name"		"Verdana"
				"tall"		"14"
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"		"768 1023"
				"antialias"	"1"
			}
			"4" [$WIN32]
			{
				"name"		"Verdana"
				"tall"		"20"
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"		"1024 1199"
				"antialias"	"1"
			}
			"5" [$WIN32]
			{
				"name"		"Verdana"
				"tall"		"24"
				"weight"	"900"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"		"1200 6000"
				"antialias"	"1"
			}
			"6" [$WIN32]
			{
				"name"		"Verdana"
				"tall"		"12"
				"range" 	"0x0000 0x00FF"
				"weight"	"900"
				"antialias"	"1"

			}
			"7" [$WIN32]
			{
				"name"		"Arial"
				"tall"		"12"
				"range" 	"0x0000 0x00FF"
				"weight"	"800"
				"antialias"	"1"
			}			
		}
		
		"MainBold"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"20"
				"weight"		"800"
				"antialias"		"1"
			}
		}

		"MainBoldBlur"
		{
			"1"
			{
				"name"			"Trade Gothic Bold"		[$WIN32]
				"name"			"Trade Gothic Bold" [$OSX]
				"tall"			"20"
				"weight"		"800"
				"blur"			"3"
				"antialias"		"1"
			}
		}
	}

	//
	//////////////////// BORDERS //////////////////////////////
	//
	// describes all the border types
	Borders
	{
		BaseBorder
		{
			"inset" "0 0 1 1"
			Left
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}
		}
		
		TitleButtonBorder
		{
			"inset" "0 0 1 1"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}
		}

		TitleButtonDisabledBorder
		{
			"inset" "0 0 1 1"
			Left
			{
				"1"
				{
					"color" "BgColor"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "BgColor"
					"offset" "1 0"
				}
			}
			Top
			{
				"1"
				{
					"color" "BgColor"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "BgColor"
					"offset" "0 0"
				}
			}
		}

		TitleButtonDepressedBorder
		{
			"inset" "1 1 1 1"
			Left
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}
		}

		ScrollBarButtonBorder
		{
			"inset" "1 0 0 0"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}
		}

		ScrollBarButtonDepressedBorder
		{
			"inset" "2 2 0 0"
			Left
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}
		}
		
		ButtonBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "1 1"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}
		}

		FrameBorder
		{
			"inset" "0 0 1 1"
			Left
			{
				"1"
				{
					"color" "ControlBG"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "ControlBG"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "ControlBG"
					"offset" "0 1"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "ControlBG"
					"offset" "0 0"
				}
			}
		}

		TabBorder
		{
			"inset" "0 0 1 1"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}
		}

		TabActiveBorder
		{
			"inset" "0 0 1 0"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "ControlBG"
					"offset" "6 2"
				}
			}
		}


		ToolTipBorder
		{
			"inset" "0 0 1 0"
			Left
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}
		}

		// this is the border used for default buttons (the button that gets pressed when you hit enter)
		ButtonKeyFocusBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "1 1"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}
		}

		ButtonDepressedBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "1 1"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}
		}

		ComboBoxBorder
		{
			"inset" "0 0 1 1"
			Left
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}
		}

		MenuBorder
		{
			"inset" "1 1 1 1"
			Left
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 1"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "1 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}
		}
		BrowserBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Border.Dark"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Border.Bright"
					"offset" "0 0"
				}
			}
		}

	}

	//////////////////////// CUSTOM FONT FILES /////////////////////////////
	//
	// specifies all the custom (non-system) font files that need to be loaded to service the above described fonts
	CustomFontFiles
	{
		"1"		"resource/Futurot.vfont"
		"2"		"resource/Toolbox.vfont"
		"3"     "resource/TG.vfont"
		"4"     "resource/TGB.vfont"
		"5"		"resource/HALFLIFE2.vfont"
		"6"		"resource/Stubble-Bold.vfont"	
	}

}
