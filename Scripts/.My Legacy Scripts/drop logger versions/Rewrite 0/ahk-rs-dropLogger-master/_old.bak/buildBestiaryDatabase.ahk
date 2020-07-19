#SingleInstance, off
if (A_Args[1])
	Menu, Tray, NoIcon
InitWorkerThread()
OnExit("exitFunc")

global g_workers := 20	; amount of threads to use
global g_output := []	; output object
global progress			; progress class
global startedJobs		; amount of jobs given to workers
global finishedMobs		; count mobs that have been processed
global mobCount			; total mobs that will get processed

buildBestiary()
return

/*
	purpose
		create bestiary database
*/
buildBestiary() {
	timerFunc()
	progress := new class_progress("Fetching mobs", A_Space, A_Space)
	
	InitializeWorkers() ; activate workers
	mobMatchList := getWikiMoblist() ; retrieve mob list
	mobList := mobMatchList.clone()
	
	; it is possible some worker threads dont report back their input so,
	; continously go through mobList and check if  any mobs that ARE
	; in mobList but not in g_output
	loop, {
		mobList := mobMatchList.clone()
		
		for matchMob in mobMatchList["items"]
		{
			If !InStr(mobMatchList["items"][matchMob].url, "user:") and !InStr(mobMatchList["items"][matchMob].url, "Bestiary")  and !InStr(mobMatchList["items"][matchMob].url, "category:") and !InStr(mobMatchList["items"][matchMob].abstract, "redirect") { ; if valid mob
				mobAdded := false
				for outMob in g_output
				{
					If mobMatchList["items"][matchMob].title = g_output[outMob].title
					{
						mobAdded := true
						; msgbox % "mob is currently in output and matchlist: " mobMatchList["items"][matchMob].title
					}
				}
				If !(mobAdded)
				{
					; msgbox % "mob missing from output:  " mobMatchList["items"][matchMob].title " output:" json.dump(g_output,,2)
					
					workload := [] ; create output object
					workload["items"] := [] ; create same object structure as input
					workload["items"][mobMatchList["items"][matchMob].id] := mobMatchList["items"][matchMob]
					
					assignWorker(workload)
				}
			}
		}
		
		; var1 := json.dump(g_output)
		; var2 := json.dump(mobMatchList)
		
		If (mobAdded) ; added all mobs
		{ 
			; msgbox rn mobadded is true : %mobAdded%
			break
		}
		else {
			; progress := new class_progress("Finishing up")
		
			; FileDelete, % A_ScriptDir "\g_output.txt"
			; FileDelete, % A_ScriptDir "\mobMatchList.txt"
			; FileAppend, % json.dump(g_output,,2), % A_ScriptDir "\g_output.txt"
			; FileAppend, % json.dump(mobMatchList["items"],,2), % A_ScriptDir "\mobMatchList.txt"
			; msgbox %mobAdded% : g_output is missing some entries that do exist in mobMatchList, going into a loop again
		}
	}
	
	; msgbox after loops
	
	; loop, { ; go through mob list
		; workload := grabMobs(mobList, 1) ; take some entries from the mob list
		
		; If (workload["items"].length()) { ; if there are mobs in the workload
			; startedJobs++
			; for mob in workload["items"]
				; debugLog(A_Func ": Assigning to worker = " workload["items"][mob].title)
			
			; assignWorker(workload) ; assign entries to a thread
		; }
	; } until (workload["items"].length() = 0) ; until mob list is finished
	
	waitUntilWorkersIdle()
	
	; msgbox after waiting for workers to go idle
	
	; msgbox % "finishedMobs: " finishedMobs " totalmobs:" mobCount " startedJobs: " startedJobs
	
	; output
	if A_Args.Length() < 1 { ; no input parameter specified to script
		clipboard := JSON.Dump(g_output,,2)
		timerFunc(1)
		msgbox % JSON.Dump(g_output,,2)
	}
	else { ; input parameter was specified
		closeWorkers()
		FileAppend, % JSON.Dump(g_output,,2), % A_Args[1]
		exitapp
	}
}

/*
	purpose
		waits until all workers are not in running state
*/
waitUntilWorkersIdle() {
	loop, {
		idle := 1
		loop, % g_workers
			If (WorkerThread%A_Index%.State = "Running")
				idle := 0
		sleep 100
	} until idle
}

/*
	purpose
		closes worker threads
*/
closeWorkers() {
	progress.MainText("Closing worker threads")
	progress.ProgressBarMaxRange(g_workers)
	progress.SubText("")
	
	loop, % g_workers {
		WorkerThread%A_Index%.Exit()
		progress.ProgressBar("+1")
	}
}

/*
	purpose
		assigns idle worker to workload, waiting until a worker is idle if none are available
*/
assignWorker(input) {
	global ; to access worker handles
	
	; msgbox % "assignWorker" "`n`n" JSON.Dump(input,,2)
	
	; check if workers are initialized
	loop, % g_workers {
		If !(WorkerThread%A_Index%.State) {
			msgbox %A_Func%: Workers are not initialized`n`nClosing..
			exitapp
		}
	}
	
	; assign workers to workload
	loop, { ; until workload is assigned
		loop, % g_workers { ; check each worker if available
			If (WorkerThread%A_Index%.State != "Running") {
				WorkerThread%A_Index%.Start(input) ; assign workload to worker
				WorkerThread%A_Index%.WaitForStart() ; wait till worker is started up to prevent assigning another workload to the same worker
				return ; function complete
			}
		}
		sleep 100
	}
}

/*
	purpose
		retrieve wiki mob list from api & set progress class to amount of valid mobs in the list
		
	returns
		wiki mob list object
*/
getWikiMoblist() {
	output := JSON.Load(DownloadToJson("http://2007.runescape.wikia.com/api/v1/Articles/List?category=bestiary&limit=9999")) ; grab mob list from wiki
	
	for id in output["items"]
		If !InStr(output["items"][id].url, "user:") and !InStr(output["items"][id].url, "Bestiary")  and !InStr(output["items"][id].url, "category:") and !InStr(output["items"][id].abstract, "redirect") ; if valid mob
			mobCount++
	progress.SubText("Counting mobs")
	progress.ProgressBarMaxRange(mobCount)
	return output
}

/*
	Purpose
		Grabs the entire osrs mob list from the wiki and returns a specified amount of them each function call until
		no mobs remain
	
	input
		amount of mobs
		
	Returns
		blank if no mobs remain, otherwise object with the following structure:
			{
			  "items": {
				"23866": {
				  "id": 23866,
				  "ns": 0,
				  "title": "Aviansie",
				  "url": "/wiki/Aviansie"
				},
		
*/
grabMobs(bestiary, amount) {
	output := [] ; create output object
	output["items"] := [] ; create same object structure as input
	
	loop, {
		mob := bestiary.items.pop() ; take a mob from bestiary
		If (mob.title = "") ; no bestiary entries remaining
			break
		
		; check if mob is valid
		If !InStr(mob.url, "user:") and !InStr(mob.url, "Bestiary")  and !InStr(mob.url, "category:") and !InStr(mob.abstract, "redirect") {
			output["items"][mob.id] := mob ; add mob to output list
			count++
		}
		
		If (count = amount) ; break when specified amount of mobs has been retrieved
			break
	}
	
	return output
}

/*
	purpose
		setup workers
*/
InitializeWorkers() {
	global ; to access worker handles
	
	loop, % g_workers {
		WorkerThread%A_Index% := new CWorkerThread("WorkerFunction", 0, 0, 0)
		WorkerThread%A_Index%.OnData.Handler := "WorkerHandler_OnDataFromWorker"
		WorkerThread%A_Index%.OnFinish.Handler := "WorkerHandler_OnFinish"
	}
}

/*
	purpose
		handles progress class
*/
ProgressClassHandler(input)
{
	; static totalProgress
	; totalProgress++
	; tooltip, % "totalProgress : " totalProgress,0 ,0
	
	; progress.ProgressBar("+1")
	; progress.SubText(input)
}

/*
	purpose
		instruct worker threads
		
	input
		WorkerThread = thread handle
		input = workload
*/
WorkerFunction(WorkerThread, input) {
	output := [] ; output object
	
	for id in input["items"]
	{
		mob := input["items"][id]["title"]
		WorkerThread.SendData(mob)
		
		If !InStr(input["items"][id].url, "user:") and !InStr(input["items"][id].url, "Bestiary") and !InStr(input["items"][id].abstract, "redirect") { ; not a valid mob, if conditions
			obj := class_database._getMobInfo(input, mob)
			output[mob] := obj
		}
	}
	
	return output
}

/*
	purpose
		called when worker thread finishes
*/
WorkerHandler_OnFinish(WorkerThread, Result)
{
	finishedMobs++
	; tooltip, % "finishedMobs: " finishedMobs " totalmobs:" mobCount " startedJobs: " startedJobs,0,0
	
	for mob in result ; add mob info to output
		g_output[mob] := result[mob]
		
	progress.ProgressBar("+1")
	progress.SubText(mob)
}

/*
	purpose
		called when worker thread uses .SendData() function
*/
WorkerHandler_OnDataFromWorker(WorkerThread, Data)
{
	ProgressClassHandler(Data)
}

/*
	purpose
		called when script is closing
*/
exitFunc(ExitReason, ExitCode) {
	closeWorkers()
}

/*
	purpose
		close all other autohotkey scripts except ahk-background
		
*/
closeAhk() {
	DetectHiddenWindows On ; List all running instances of this script:
	WinGet instances, List, ahk_class AutoHotkey
	if (instances > 1) { ; There are 2 or more instances of this script.
		this_pid := DllCall("GetCurrentProcessId"),  closed := 0
		Loop % instances { ; For each instance,
			WinGet pid, PID, % "ahk_id " instances%A_Index%
			WinGetTitle, title, % "ahk_pid " pid
			if (pid != this_pid) and !InStr(title, "ahk-background") { ; If it's not THIS instance, and not ahk-backgroundscript
				WinClose % "ahk_id " instances%A_Index% ; close it.
				closed += 1
			}
		}
	}
}

#IfWinActive, ahk_exe notepad++.exe
~^s::
	closeAhk() ; close threads
	reload
return
#IfWinActive

#include, %A_ScriptDir%\inc\workerThreadLib\
#include, EventHandler.ahk
#include, LSON.ahk
#include, WorkerThread.ahk
#Include, %A_ScriptDir%\inc
#Include, functions.ahk
#Include, guiAbout.ahk
#Include, guiMain.ahk
#Include, guiSettings.ahk
#Include, guiLog.ahk
#Include, guiStats.ahk
#Include, guiDigitsCustom.ahk
#Include, guiDigitsVaried.ahk
#Include, guiPreset.ahk
#Include, class_dropLog.ahk
#Include, class_itemIds.ahk
#Include, class_database.ahk
#Include, class_parseWikiaHtml.ahk
#Include, class_progress.ahk
#Include, <CommandFunctions>
#Include, <JSON>