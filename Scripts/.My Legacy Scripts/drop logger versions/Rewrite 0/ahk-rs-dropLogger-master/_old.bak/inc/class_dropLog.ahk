/*
	this.log format:
	
	[
	  {
		"Start trip": "20170712052651"
	  },
	  [
		{
		  "Drop Rate": "Uncommon",
		  "Drop Table": "Armour & Weapons Drop Table",
		  "Mob": "Abyssal Sire",
		  "Noted": 1,
		  "Quantity": "2",
		  "Title": "Rune platebody"
		},
		{
		  "Drop Rate": "Always",
		  "Drop Table": "100% Drop Table",
		  "Mob": "Abyssal Sire",
		  "Noted": 0,
		  "Quantity": "1",
		  "Title": "Ashes"
		}
	  ],
	  {
		"Start death": "20170712052651"
	  },
	  [
		{
			  "Drop Rate": "Uncommon",
			  "Drop Table": "Armour & Weapons Drop Table",
			  "Mob": "Abyssal Sire",
			  "Noted": 1,
			  "Quantity": "3",
			  "Title": "Rune full helm"
		},
	  ],
	  {
		"Stop death": "20170712052651"
	  },
	  {
		"Stop trip": "20170712052651"
	  }
	]
*/

class class_dropLog {
	/*
		Parameters
			file (opt) = 	drop log file to be used. User will be prompted to select or create a file if omitted
	*/
	__New(file = "", noprogress = "") {
		If !(file) {
			FileSelectFile, file, 11, , Select Log File, (*.txt)
			If (file = "")
				return
			SplitPath, file, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
			file := OutDir "\" OutNameNoExt ".txt"
			
			If !FileExist(file)
				FileAppend, , % file
		}
		this.file := file
		
		If !(noprogress)
			progress := new class_progress("Loading drop log")
		
		FileRead, log, % this.file
		If (log)
			this.log := JSON.Load(log)
		else
			this.log := {}
		
		this._refreshStats() ; load stats after loading file
		
		progress.Destroy()
		progress := ""
	}
	
	/*
		Purpose
			deletes log file and writes log to it
	*/
	_writeFile() {
		FileDelete, % this.file
		FileAppend, % JSON.Dump(this.log,,2), % this.file
	}
	
	/*
		Purpose
			Deletes log var + file and refreshes stats
	*/
	delete() {
		msgbox, 52, , Current log file will be wiped!`n`nThis cannot be undone.`n`nAre you sure?
		IfMsgBox, No
			return 0
		
		this.log := {}
		this._refreshStats()
		return 1
	}
	
	/*
		Parameters
			input =		associative array eg: {"Start Trip": A_Now}
		
		Purpose
			add entry to this.log
	*/
	add(input) {
		If !(IsObject(input)) {
			msgbox %A_ThisFunc%: input was not an object!`n`nClosing..
		}
		
		this.log.push(input)
		
		this._refreshStats()

	}
	
	/*
		Purpose
			undo last added entry and store it to be used by redo()
	*/
	undo() {
		If !(IsObject(this.undone)) ; create object
			this.undone := {}
		this.undone.Push(this.log.pop()) ; add undone array to object
		this._refreshStats()
	}
	
	/*
		Purpose
			redo last entry done to this.log
	*/
	redo() {
		If !(this.undone.length()) ; if there are no undone lines
			return
		this.log.push(this.undone.pop())
		this._refreshStats()
	}
	
	save() {
		progress := new class_progress("Saving drop log")
		
		this._writeFile()
		
		progress.Destroy()
		progress := ""
	}
	
	_refreshStats() {
		this.stats := "" ; clear stats
		this.stats := new class_dropLog.stats("basic", this.log) ; refresh stats
	}
	
	refreshAdvancedStats() {
		guiStats("rename", "Updating..")
		
		this.advancedStats := "" ; clear advancedStats
		this.advancedStats := new class_dropLog.stats("advanced", this.log) ; refresh stats
		
		guiStats("refresh")
	}
	
	/*
		Parameters
			type = basic or advanced
			input = drop log object
			
		Purpose
			refresh stats
	*/
	class stats {
		__New(type, input) {
			this.log := input
			
			If (type = "basic") {
				this._isTripOnGoing()
				this._isDeathOnGoing()
				this._getCurrentTripInfo()
				this._setDropAndTripList()
				this._setTotalTrips()
			}
			
			If (type = "advanced") {
				this._isTripOnGoing()
				this._isDeathOnGoing()
				this._getCurrentTripInfo()
				
				this._setDropAndTripList()
				this._setuniqueDropList()
				
				this._setTotalKills()
				this._setTotalTrips()
				this._setTotalTripTime()
				this._setTotalDeathTime()
				
				this.totalTime := this.totalTripTime + this.totalDeathTime
				f := A_YYYY A_MM A_DD 00 00 00
				EnvAdd, f, % this.totalTime, Seconds
				FormatTime, f, % f, HH:mm:ss
				this.totalTimeFormatted := f
				
				this._setTotalDropValue()
				
				this._setAverageKillsPerTrip()
				this._setAverageTimePerTrip()
				this._setAverageTimePerKill()
				this._setAverageDropValue()
				this._setAverageKillsPerHour()
				this._setAverageTripsPerHour()
				this._setAverageIncomePerHour()

				this._setUniqueDropsInfoArray()
			}
		}
		
		/*
			Purpose
				determine if trip is started
		*/
		_isTripOnGoing() {
			this.isTripOnGoing := 0
			If !(this.log.length())
				return
			log := this.log.clone() ; copy log object
			
			loop, % this.log.length() {
				arr := log.pop()
				
				for k in arr
				{
					If (k = "Start Trip")
						return this.isTripOnGoing := 1
					If (k = "Stop Trip")
						return this.isTripOnGoing := 0
				}
			}
		}
		
		/*
			Purpose
				determine if trip is started
		*/
		_isDeathOnGoing() {
			this.isDeathOnGoing := 0
			If !(this.log.length())
				return
			log := this.log.clone() ; copy log object
			
			loop, % this.log.length() {
				arr := log.pop()
				
				for k in arr
				{
					If (k = "Start Death")
						return this.isDeathOnGoing := 1
					If (k = "Stop Death")
						return this.isDeathOnGoing := 0
				}
			}
		}
		
		/*
			Purpose
				Get active trip and death starting time, amount of kills and drops
		*/
		_getCurrentTripInfo() {
			log := this.log.clone() ; copy log object
			
			; get current trip drops and 'start trip'
			tripObj := []
			loop, % log.length() {
				arr := log.pop()
				tripObj.InsertAt(1, arr)
				If (arr["Start Trip"])
					break
			}
			
			loop, % tripObj.length() { ; go through object entries
				i := A_Index
				
				If (tripObj[A_Index]["Start Death"])
					deathStart := tripObj[A_Index]["Start Death"]
				
				If (A_Index = 1) ; first loop will be the start time
					tripStart := tripObj[A_Index]["Start Trip"]
				else If !(tripObj[A_Index]["Start Death"]) and !(tripObj[A_Index]["Stop Death"]) {
					drops:=""
					loop, % tripObj[i].length() { ; go through each drop in the kill
						drop:="", quantity:="", noted:=""
						tripKills++
						
						If (tripObj[i][A_Index]["noted"])
							noted := A_Space "(noted)"
							
						If (tripObj[i][A_Index]["quantity"] > 1)
							quantity := tripObj[i][A_Index]["quantity"] " x " 
						
						drop := quantity tripObj[i][A_Index]["title"] noted
						
						{ ; build var with drops in current kill
							!(drops) ? drops := drop : drops .= ", " drop
						}
						
						If (A_Index = tripObj[i].length()) ; last drop in the kill, add drops to output
						{
							!(tripLog) ? tripLog := drops : tripLog .= "`n" drops
						}
					}
				}
			}
			
			this.deathStart := deathStart
			this.tripStart := tripStart
			this.tripLog := tripLog
			this.tripKills := tripKills
		}
		
		/*
			Purpose
				trip list = all 'start trip' and 'stop trip' entries
				drop list = all drop entries
				combined drop list = all drop entries with multiple different quantity drops such as
				123 x Zulrah's scales and 124 x Zulrah's scales combined into one drop
				247 x Zulrah's scales. so DO NOT combine 3 x law rune and 45 x law rune drops
		*/
		_setDropAndTripList() {
			log := this.log.clone() ; copy log object
			tripList := []
			deathList := []
			dropList := []
			
			loop, % log.length() {
				arr := log.pop()
				
				If (arr.HasKey("Start Trip"))
					tripList.InsertAt(1, arr)
				else If (arr.HasKey("Stop Trip"))
					tripList.InsertAt(1, arr)
				else If (arr.HasKey("Start Death"))
					deathList.InsertAt(1, arr)
				else If (arr.HasKey("Stop Death"))
					deathList.InsertAt(1, arr)
				else
					dropList.InsertAt(1, arr)
			}
			
			; alter dropList to combine multiple different quantities of the same drop
			mqDrops := [] ; get simple array containing all multiple different quantity drops
			loop, % dropList.length() {
				i := A_Index

				loop, % dropList[i].length()
					drop := dropList[i][A_Index]["title"]
					quantity := dropList[i][A_Index]["quantity"]
					If (dropList[i][A_Index]["quantity"] > 1) and !(HasVal(mqDrops, dropList[i][A_Index]["title"])) ; if drop has multiple quantities and has not yet been added as a multi quantity drop
						mqDrops.push(dropList[i][A_Index]["title"])
						; loop, % dropList.length() ; check if besides having multiple quantities the item has multiple DIFFERENT quantities eg: 123 and 124 instead of 3 and 3
							; If (dropList[i][A_Index]["Title"] = drop) and !(dropList[i][A_Index]["quantity"] = quantity)
			}

			If (mqDrops.length()) { ; combine multiple different quantity drops in drop list
				loop, % mqDrops.length() { ; for each multi different quantity drop
					drop := mqDrops[A_Index]
					output := []
					drops := dropList.clone() ; copy log object
					
					; go through drop list adding non-multi different quantity drops to output and counting total quantity 
					; of multiple different quantity drops to add those at the end of the loop
					
					total:="", mqDrop:=""
					loop, % drops.length() {
						i := A_Index
						arr := drops.pop() ; get drops entry
						
						loop, % arr.length() { ; go through drops entry drops
							If (arr[A_Index]["title"] = drop) { ; drop is multi quantity drop
								mqDrop := arr[A_Index].clone() ; save a 'template' for adding to output later on
								total += arr[A_Index]["quantity"]
							}
							else { ; drop is normal drop
								If !(output[i].length())
									output[i] := []
								output[i].push(arr[A_Index])
							}
						}
					}
					mqDrop["quantity"] := total
					i++
					output := []
					output.push(mqDrop)
				}
			}
			this.tripList := tripList
			this.deathList := deathList
			this.dropList := dropList
			this.combinedDropList := output
		}
		
		
		/*
			Purpose
				create simple array containing one of each drop
		*/
		_setuniqueDropList() {
			output := []
			
			loop, % this.dropList.length() { ; go through all kill entries
				i := A_Index
				loop, % this.dropList[i].length() { ; go through each drop in kill entry
					ii := A_Index
					newDrop := 1
					
					title := this.dropList[i][ii]["title"]
					mob := this.dropList[i][ii]["mob"]
					table := this.dropList[i][ii]["drop table"]
					matchlistKey := title mob table

					If !(output.length()) { ; start by adding the first drop to output
						output.push(this.dropList[i][ii])
						{
							!(matchlist) ? matchlist := matchlistKey : matchlist .= "`n" matchlistKey
						}
					}
					else { ; continue by adding unique drops to output, that are not already in output
						
						searchKey := this.dropList[i][ii]["title"] this.dropList[i][ii]["mob"] this.dropList[i][ii]["drop table"]
						If InStr(matchlist, searchKey)
							newDrop := 0
						
						If (newDrop) {
							output.push(this.dropList[i][ii])
							{
								!(matchlist) ? matchlist := matchlistKey : matchlist .= "`n" matchlistKey
							}
						}
					}
				}
			}
			this.uniqueDropList := output
		}
		
		/*
			Purpose
				set total kills
		*/
		_setTotalKills() {
			this.totalKills := this.dropList.length()
		}
		
		/*
			Purpose
				set total trips
		*/
		_setTotalTrips() {
			loop, % this.tripList.length()
				If (this.tripList[A_Index].HasKey("Start Trip"))
					trips++
			this.totalTrips := trips
		}
		
		/*
			Purpose
				set total trip time in seconds and format trip time
		*/
		_setTotalTripTime() {
			loop, % this.tripList.length() {
				If (this.tripList[A_Index].HasKey("Start Trip")) ; save start time
					start := this.tripList[A_Index]["Start Trip"]
				If (this.tripList[A_Index].HasKey("Stop Trip")) ; save stop time
					stop := this.tripList[A_Index]["Stop Trip"]
					
				If (start) and (stop) { ; get trip time by subtracting start time from stop time
					EnvSub, stop, start, Seconds
					totalTripTime += stop ; add trip time to total
					start:="", stop:=""
				}
			}
			If (start) { ; currently a trip is ongoing. get time from now since trip start
				now := A_Now
				EnvSub, now, start, seconds
				totalTripTime += now ; add current trip time to total
			}
			If !(totalTripTime) ; if no trip time yet, return 0
				totalTripTime := 0
			this.totalTripTime := totalTripTime
			
			; format total time
			f := A_YYYY A_MM A_DD 00 00 00
			EnvAdd, f, % this.totalTripTime, Seconds
			FormatTime, f, % f, HH:mm:ss
			this.totalTripTimeFormatted := f
		}
		
		/*
			Purpose
				set total Death time in seconds and format Death time
		*/
		_setTotalDeathTime() {
			loop, % this.DeathList.length() {
				If (this.DeathList[A_Index].HasKey("Start Death")) ; save start time
					start := this.DeathList[A_Index]["Start Death"]
				If (this.DeathList[A_Index].HasKey("Stop Death")) ; save stop time
					stop := this.DeathList[A_Index]["Stop Death"]
					
				If (start) and (stop) { ; get Death time by subtracting start time from stop time
					EnvSub, stop, start, Seconds
					totalDeathTime += stop ; add Death time to total
					start:="", stop:=""
				}
			}
			If (start) { ; currently a Death is ongoing. get time from now since Death start
				now := A_Now
				EnvSub, now, start, seconds
				totalDeathTime += now ; add current Death time to total
			}
			If !(totalDeathTime) ; if no trip time yet, return 0
				totalDeathTime := 0
			this.totalDeathTime := totalDeathTime
			
			; format total time
			f := A_YYYY A_MM A_DD 00 00 00
			EnvAdd, f, % this.totalDeathTime, Seconds
			FormatTime, f, % f, HH:mm:ss
			this.totalDeathTimeFormatted := f
		}

		
		/*
			Purpose
				set total value from all drops
		*/
		_setTotalDropValue() {
			; recalculate drop value
			loop, % this.uniqueDropList.length() { ; for each unique drop
				drop := this.uniqueDropList[A_Index]["Title"]
				
				; get total quantity for drop
				q := ""
				loop, % this.dropList.length() { ; go through all drops entries
					i := A_Index
					loop, % this.dropList[i].length() ; go through each drop in drop drop entry
						If (this.dropList[i][A_Index]["title"] = drop)
							q += this.dropList[i][A_Index]["quantity"]
				}
				totalValue += itemIds.getPrice(drop, q)
			}
			this.totalDropValue := totalValue
		}

		
		/*
			Purpose
				set average kills per trip
		*/
		_setAverageKillsPerTrip() {
			this.averageKillsPerTrip := Round(this.totalKills / this.totalTrips, 1)
		}
		
		/*
			Purpose
				set average kills per trip and format
		*/
		_setAverageTimePerTrip() {
			this.averageTimePerTrip := Round(this.totalTime / this.totalTrips)
			
			; format time
			f := A_YYYY A_MM A_DD 00 00 00
			EnvAdd, f, % this.averageTimePerTrip, Seconds
			FormatTime, f, % f, HH:mm:ss
			
			this.averageTimePerTripFormatted := f
		}
		
		
		/*
			Purpose
				set average time per kill
		*/
		_setAverageTimePerKill() {
			this.averageTimePerKill := Round(this.totalTime / this.totalKills)
			
			; format time
			f := A_YYYY A_MM A_DD 00 00 00
			EnvAdd, f, % this.averageTimePerKill, Seconds
			FormatTime, f, % f, HH:mm:ss
			
			this.averageTimePerKillFormatted := f
		}
		
		/*
			Purpose
				set average drop value
		*/
		_setAverageDropValue() {
			this.averageDropValue := Round(this.totalDropValue / this.totalKills)
		}
		
		/*
			Purpose
				set average kills per hour
		*/
		_setAverageKillsPerHour() {
			this.averageKillsPerHour := Round(3600 / this.averageTimePerKill, 2)
		}
		
		/*
			Purpose
				set average trips per hour
		*/
		_setAverageTripsPerHour() {
			this.averageTripsPerHour := Round(3600 / this.averageTimePerTrip, 2)
		}
		
		/*
			Purpose
				set average income per hour
		*/
		_setAverageIncomePerHour() {
			this.averageIncomePerHour := Round(this.totalDropValue / (this.totalTime / 60 / 60))
		}
		
		/*
			Purpose
				build array containing various stats for each unique drop with layout:
				{
					drop:					drop
					totalAmount:			total drop amount
					totalValue:				total drop Value
					dropRate:				drop rate
					wikiDropRate:			wiki drop rate
					killsSinceLastDrop:		kills Since Last Drop
					shortestDryStreak:		shortest Dry Streak
					longestDryStreak:		longest Dry Streak
				}
		*/
		_setUniqueDropsInfoArray() {
			this.uniqueDropsInfoArray := []
			
			timeSpent := ""
			
			loop, % this.uniqueDropList.length() {
				displayQuantity := "", displayNoted := ""
				
				uDrop := this.uniqueDropList[A_Index]["title"]
				uTable := this.uniqueDropList[A_Index]["drop table"]
				uMob := this.uniqueDropList[A_Index]["mob"]
				
				for drop in this.combinedDropList ; check if drop is in combined drop droplist and if so, pull the amount from there
					If (this.combinedDropList[A_Index].title = uDrop)
						displayQuantity := this.combinedDropList[A_Index].quantity " x "
				If !(displayQuantity)
					If (this.uniqueDropList[A_Index]["quantity"] > 1)
						displayQuantity := this.uniqueDropList[A_Index]["quantity"] " x "
				If (this.uniqueDropList[A_Index]["noted"])
					displayNoted := A_Space "(noted)"
				
				; set total amount and total quantity
				totalAmount := "", totalQuantity := ""
				loop, % this.dropList.length() { ; go through all drops entries
					i := A_Index
					loop, % this.dropList[i].length() ; go through each drop in drop drop entry
						If (this.dropList[i][A_Index]["title"] = uDrop) and (this.dropList[i][A_Index]["mob"] = uMob) and (this.dropList[i][A_Index]["drop table"] = uTable) {
							totalAmount++
							totalQuantity += this.dropList[i][A_Index]["quantity"]
						}
				}
				
				totalValue := itemIds.getPrice(uDrop, totalQuantity) ; set total value
				dropRate := Round(this.totalKills / totalAmount, 2)
				
				; get wiki drop rate
				wikiDropRate := database.dropTableGet(uMob, uTable, uDrop, "Drop Rate")
				If !(wikiDropRate)
					wikiDropRate := "Unavailable"
					
				; kills since last drop
				found := "", killsSinceLastDrop := 0
				dl := this.dropList.clone() ; copy object
				loop, % this.dropList.length() {
					arr := dl.pop() ; remove last logged kill from drop list
					
					loop, % arr.length() ; check if drop was logged
						If (arr[A_Index]["title"] = uDrop)
							break, 2 ; if current kill drops DOES contain drop, stop adding kills
					
					killsSinceLastDrop++ ; if current kill drops does not contain drop
				}
				If !(killsSinceLastDrop)
					killsSinceLastDrop := "-"
				
				; dry streaks
				dryStreaks := []
				found:="", dryStreak := ""
				loop, % this.dropList.length() { ; go through kills
					i := A_Index
					loop, % this.dropList[i].length() { ; go through each drop in kill entry
						If (this.dropList[i][A_Index]["title"] = uDrop) and !(found) { ; if drop found in drop entry
							; msgbox 1: index: %A_Index% found %drop% for the first time
							found := 1
							break ; stop going through drops in this kill entry
						}
						else If (this.dropList[i][A_Index]["title"] = uDrop) and (found) { ; if drop found in drop entry and drop previously found
							; msgbox 2: index: %A_Index% found %drop% after %drop% has been found before
							If !(dryStreak)
								dryStreak := 0
							dryStreaks.push(dryStreak)
							dryStreak := ""
							break  ; stop going through drops in this kill entry
						}
					}
					If (found)
						dryStreak++ ; add one dry streak on each kill entry loop, if drop has been found before
				}
				
				longestDryStreak := ""
				loop, % dryStreaks.length() { ; get highest integer
					If (longestDryStreak = "") ; if no dry streak saved
						longestDryStreak := dryStreaks[A_Index]
					
					If (dryStreaks[A_Index] > longestDryStreak) ; if looped dry streak is higer then saved
						longestDryStreak := dryStreaks[A_Index]
				}
				If !(longestDryStreak)
					longestDryStreak := "-"
				shortestDryStreak := ""
				loop, % dryStreaks.length() { ; get lowest integer
					If (shortestDryStreak = "") ; if no dry streak saved
						shortestDryStreak := dryStreaks[A_Index]
					
					If (dryStreaks[A_Index] < shortestDryStreak) ; if looped dry streak is lower then saved
						shortestDryStreak := dryStreaks[A_Index]
				}
				If !(shortestDryStreak)
					shortestDryStreak := "-"
				
				this.uniqueDropsInfoArray.push({"title": uDrop, "totalQuantity": totalQuantity, "mob": uMob, "dropTable": StringReplace(uTable, "Drop Table"), "drop": displayQuantity uDrop displayNoted, "totalAmount": totalAmount, "totalValue": totalValue, "dropRate": dropRate, "wikiDropRate": wikiDropRate, "killsSinceLastDrop": killsSinceLastDrop, "shortestDryStreak": shortestDryStreak, "longestDryStreak": longestDryStreak})
			}
		}
	}
}