#NoEnv
SendMode Input

~Q::Suspend

~End::ExitApp

LCtrl & ~LButton::
Loop
	If GetKeyState("LButton", "LCtrl") {
		Sleep, 5
		moveAmount := (moveAmount = 2) ? 3 : 0
 		mouseXY(moveAmount,3.4)
		
	}
	else
	break
	
Return



mouseXY(x,y)
{
DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
}