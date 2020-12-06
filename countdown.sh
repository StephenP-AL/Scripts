#! /bin/bash
# An inaccurate countdown timer
# Takes minutes as an argument, displays hours, minutes, and seconds  
i=$1
i=$((i * 60))
while [ $i -gt 0 ]
do
	clear
	echo Remaining: $((i/3600))h--$(((i%3600)/60))m--$((i%60))s
	((i--))
	sleep 1
done

