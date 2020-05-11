Coordmode, tooltip, screen

#SingleInstance, off ;required for obvious reasons
;This function needs to be called in the Autoexecute section so this instance
;can possibly turn into a worker thread. The worker thread stays in this function during its runtime.
#Persistent

InitWorkerThread()
;Main thread continues here

;Create the worker thread!
Worker1Thread := new CWorkerThread("Worker1Function", 0, 1, 1)
Worker2Thread := new CWorkerThread("Worker2Function", 0, 1, 1)

;Setup event handlers for the main thread
Worker1Thread.OnStop.Handler := "OnStoppedByWorker1"
Worker1Thread.OnProgress.Handler := "ProgressHandlerWorker1"
Worker1Thread.OnFinish.Handler := "OnWorker1Finish"

Worker2Thread.OnStop.Handler := "OnStoppedByWorker2"
Worker2Thread.OnProgress.Handler := "ProgressHandlerWorker2"
Worker2Thread.OnFinish.Handler := "OnWorker2Finish"

;Start the worker thread
Worker1Thread.Start("A Parameter")
Worker2Thread.Start("A Parameter")
return


; ############################################################################################################

;Create the worker thread!
; Worker1Thread := new CWorkerThread("Worker1Function", 0, 1, 1)

;Setup event handlers for the main thread
; Worker1Thread.OnStop.Handler := "OnStoppedByWorker1"
; Worker1Thread.OnProgress.Handler := "ProgressHandlerWorker1"
; Worker1Thread.OnFinish.Handler := "OnWorker1Finish"

;Start the worker thread
; Worker1Thread.Start("A Parameter")
return

;The functions below are event handlers of the main thread. They were specified above.
OnStoppedByWorker1(Worker1Thread, Result)
{
	Msgbox Error in Worker1 thread! %Result%
	; ExitApp
}

OnWorker1Finish(Worker1Thread, Result)
{
	MsgBox Worker1 thread completed successfully! %Result%
	; ExitApp
}

;Progress is a numeric integer value
ProgressHandlerWorker1(Worker1Thread, Progress)
{
	Tooltip, Progress Worker1Thread: %Progress%
}


;This is the main worker function that is executed in the worker thread.
;The thread will exit shortly after this function returns.
;This function may have a many parameters as desired, but they need to be specified during the worker thread creation.
Worker1Function(Worker1Thread, Param)
{
	;This is a suggested structure for a worker thread that uses a loop.
	;It properly accounts for state changes (which can be caused by the main thread or this thread)
	while(A_Index <= 100 && Worker1Thread.State = "Running")
	{
		Sleep 100 ;This simulates work that takes some time
		Worker1Thread.Progress := A_Index ;Report the progress of the worker thread.
		
		;Lets allow this thread to randomly fail!
		Random, r, 1, 200
		; if(r = 1)
			; Worker1Thread.Stop("Error: " r) ;Pass the error value to the main thread
	}
	;the return value of this function is only used when the worker thread wasn't stopped.
	r := r * 4
	return r
}

; ############################################################################################################

;Create the worker thread!
; Worker2Thread := new CWorkerThread("Worker2Function", 0, 1, 1)

;Setup event handlers for the main thread
; Worker2Thread.OnStop.Handler := "OnStoppedByWorker2"
; Worker2Thread.OnProgress.Handler := "ProgressHandlerWorker2"
; Worker2Thread.OnFinish.Handler := "OnWorker2Finish"

;Start the worker thread
; Worker2Thread.Start("A Parameter")
return

;The functions below are event handlers of the main thread. They were specified above.
OnStoppedByWorker2(Worker2Thread, Result)
{
	Msgbox Error in Worker2 thread! %Result%
	; ExitApp
}

OnWorker2Finish(Worker2Thread, Result)
{
	MsgBox Worker2 thread completed successfully! %Result%
	; ExitApp
}

;Progress is a numeric integer value
ProgressHandlerWorker2(Worker2Thread, Progress)
{
	Tooltip, Progress Worker2Thread: %Progress%
}


;This is the main worker function that is executed in the worker thread.
;The thread will exit shortly after this function returns.
;This function may have a many parameters as desired, but they need to be specified during the worker thread creation.
Worker2Function(Worker2Thread, Param)
{
	;This is a suggested structure for a worker thread that uses a loop.
	;It properly accounts for state changes (which can be caused by the main thread or this thread)
	while(A_Index <= 100 && Worker2Thread.State = "Running")
	{
		Sleep 100 ;This simulates work that takes some time
		Worker2Thread.Progress := A_Index ;Report the progress of the worker thread.
		
		;Lets allow this thread to randomly fail!
		Random, r, 1, 200
		; if(r = 1)
			; Worker2Thread.Stop("Error: " r) ;Pass the error value to the main thread
	}
	;the return value of this function is only used when the worker thread wasn't stopped.
	return r
}

#include <WorkerThread>

~^s::reload