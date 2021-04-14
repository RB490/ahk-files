/*
	script purpose:
		populous rebinds

	info:
		ahk_class _Bullfrog4194304 = Classic Poptb
		ahk_class _Bullfrog0 = Pop TB 1.5 Beta from popre matchmaker
*/

; settings
	#Persistent
	#SingleInstance, force

; autoexec
	return

; hotkeys
	#If WinActive("ahk_class _Bullfrog0") || WinActive("ahk_class _Bullfrog4194304")
		*Q::Gosub hkOpenWorldMap
		*F::Gosub hkCameraToShaman
		*V::Gosub hkCameraToSpawn
		*R::Gosub hkMenuFollowers
		*E::Gosub hkMenuBuildings
		~*Tab::Gosub hkMenuScores
		*T::Gosub hkToggleChat

		w::Up
		a::Left
		s::Down
		d::Right

		Up::w
		Left::a
		Down::s
		Right::d
		
		backspace::space

		LWin::return
		RWin::return

		break::
			Suspend, Toggle
			If A_IsSuspended
				SoundBeep, 250, 100 ; disable
			else
				SoundBeep, 1000, 100 ; enable
		return
	#If

	#IfWinActive, ahk_exe Code.exe
	~^s::reload
	#IfWinActive, ahk_exe Code.exe

; subroutines
	hkMenuScores:
		; Send {f2}
		Send s
	return

	hkCameraToSpawn:
		Send h
	return

	hkCameraToShaman:
		Send .
	return

	hkMenuFollowers:
		; SoundBeep, 1500, 150
		Send {pgup}
	return

	hkMenuBuildings:
		; SoundBeep, 1000, 150
		Send {insert}
	return

	hkMenuSpells:
		Send {home}
	return

	hkOpenWorldMap:
		send {RShift Down}{Enter}{RShift Up}
	return

	hkToggleChat:
		Send {t}
		if Suspend, on
			Return
		else
		{
			Suspend, on
			Keywait, Enter, D
			Keywait, Enter
			Suspend, off
		}
	return

