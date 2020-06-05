while true; do
	sudo iw wlp2s0 scan | grep SSID: > ~/.cache/ssids.txt
	clear
	cat ~/.cache/ssids.txt
	sleep 20
done
