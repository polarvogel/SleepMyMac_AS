tell application "Finder"
	set theChoice to (choose from list {"Sleep", "Shutdown"} with title "Sleep or Shutdown" with prompt "Do yout want to sleep or shutdown your Mac?" default items {"Sleep"})
	if theChoice is false then
		display dialog "Abort."
	else
		display dialog "Minutes until " & theChoice & ":" default answer "25"
		set shutdownMinutes to (text returned of the result)
		set shutdownSeconds to shutdownMinutes * 60
		
		set myDate to current date
		set myNewDate to myDate + (shutdownMinutes * minutes)
		
		set theChoice to (item 1 of theChoice)
		
		display dialog theChoice & " at about " & (time string of (myNewDate)) & " o'clock. Press OK now!"
		do shell script ("sleep " & shutdownSeconds)
		
		if theChoice is "Hibernate" then
			sleep
		else if theChoice is "Shutdown" then
			shut down
		end if
	end if
end tell
