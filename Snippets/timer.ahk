; YYYYMMDDHH24MISS
;create a time with 0 in h,m,s; this makes adding seconds easier
nullTime:=A_YYYY A_MM A_DD "000000"

; start the stopwatch
start:=a_now
settimer, trackTime_1,100

trackTime_1:
	now:=a_now
	if (prev_now = now)	; time hasn't changed since last update
	  return

	diff:=now
	EnvSub, diff, %start%, seconds	; what is the difference

	addTime:=nullTime

	; add the difference to the date with 0 in h,m,s
	envadd, addTime, diff, seconds

	FormatTime, totalTime , %addTime%, HH:mm:ss
	tooltip, %totalTime%
	prev_now:=now
return

f2::
	settimer, trackTime_1, off
	tooltip
return