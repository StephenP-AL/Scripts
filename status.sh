#! /bin/sh
#Display information about network, battery, memory, and disk space
MWARN="90"

# BWARN is the battery percentage below which will trigger a warning
# BAT is the current percentage on the battery
# BATS is the battery charging status and level

## todo move all output text to file in ~/.cache/

while true; do
	if acpi -V | grep "0: Disch"
	then
		BWARN="15"
		BATS="$(acpi -V | grep Discharging | cut -c 25-47)" > /dev/null
		BAT="$(acpi -V | grep Discharging | cut -c 25-26)" > /dev/null
	elif acpi -V | grep "0: Charging"
	then
		BWARN="00"
		BATS="$(acpi -V | grep Charging | cut -c 11-25)" > /dev/null
		BAT="$(acpi -V | grep Charging | cut -c 21-23)" > /dev/null
	elif acpi -V | grep "0: Full"
	then
		BWARN="15"
		BATS="Full, 100%"
		BAT="100"
	elif acpi -V | grep "0: Unknown"
	then
		BWARN="15"
		BATS="$(acpi -V | grep "0: Unknown" | cut -c 12-23)" > /dev/null
		BAT="$(acpi -V | grep "0: Unknown" | cut -c 21-22)" > /dev/null
	elif acpi -V | grep "0: Not charging"
	then
		BWARN="15"
		BATS="$(acpi -V | grep "0: Not charging" | cut -d ':' -f 2)" > /dev/null
		BAT="$(acpi -V | grep "0: Not charging" | cut -d ' ' -f 5 | cut -d '%' -f 1)" > /dev/null
	else 
		BWARN="1"
		BATS="UNKNOWN"
		BAT="0"

	fi
	MEMT="$(free -m | grep Mem | cut -c 16-20)"
	MEMU="$(free -m | grep Mem | cut -c 28-32)"	
	MEMP="$((($MEMU*100)/$MEMT))" 
	clear
	ESSID="$(iwconfig | grep ESSID: | cut -c 30-60)" > /dev/null
	clear
	SIG="$(iwconfig | grep Quality | cut -c 24-80)" > /dev/null
	clear
	DISKM="$(df -h | grep home | cut -c 6-8)" > /dev/null #/ and /home are on the same drive; this identifies the designation under /dev/sda 
	DISKR="$(echo $DISKM)6" > /dev/null #have to use this because I can't df -h | grep /

	clear
	DISKR="$(df -h | grep $DISKR | cut -c 29-32)" > /dev/null
	clear
	DISKH="$(df -h | grep home | cut -c 29-32)" > /dev/null
	clear
	DISKD="$(df -h | grep dock | cut -c 29-32)" > /dev/null
	clear

	
	echo WiFi $ESSID
	echo $SIG 
#	echo $MEMT $MEMU
	echo Batt: $BATS - Mem: $MEMP% used 
	echo "Disk available: / $DISKR | home $DISKH | dock $DISKD"

	if [ "$BAT" -lt "$BWARN" ] > /dev/null
	then 
		echo "** WARNING ** Low Battery"
	fi
	
	if [ "$MEMP" -gt "$MWARN" ] > /dev/null
	then
		echo "** WARNING ** Low Memory"
	fi
#	calendar -A 0 -w
	sleep 60
done
