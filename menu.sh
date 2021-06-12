#! /bin/sh
# Main menu for CLI environment
#functions
s_system()
{
	clear
	echo "Menu - System"
	echo "1. Update      2. Backup      3. Shutdown"
	echo ""
	echo "4. ALSA Mixer  5. HTOP        6. Monitors"
	echo ""
	echo "7. Switch GUI  8. Switch CLI"
	
	read n
	case $n in
		1)	tmux select-pane -L
			tmux split-window -v '~/scripts/update.sh'
			;;
		2)	tmux select-pane -L
			tmux split-window -v '~/scripts/backup.sh'
			;;
		3)	sudo umount /mnt/etb
			sudo umount /mnt/share	
			sudo killall openvpn
			sudo shutdown now && exit
			;;
		4)	tmux select-pane -L
			tmux split-window -v 'alsamixer'
			;;
		5)	tmux new-window 'htop'
			;;
		6)	s_monitors
			;;
#		6)	tmux new-window 			
#			tmux split-window -v '~/scripts/wifilist.sh'
#			tmux select pane -U
#			;;
		7)	tmux select-pane -L
			tmux split-window -v '~/scripts/gui.sh'
			;;
		8)	tmux select-pane -L
			tmux split-window -v '~/scripts/cli.sh'
			;;
		*)	clear
			;;
	esac
}

s_monitors()
{
	clear
	echo "Menu - Monitors"
	echo "1. Lap         2. Docked      3. Multi-Monitor"
	read n
	case $n in
		1)	~/scripts/singlemonitor.sh
			;;
		2)	~/scripts/docked.sh
			;;
		3)	~/scripts/multimonitor.sh
			;;
		*)
			;;
	esac
	
}

s_games()
{
	clear
	echo "Menu - Games"
	echo "1. Nethack     2. Torchlight  3. Dwarf Fortress"  
	echo ""
	echo "4. Tetris      5. Ninvaders   6. Pacman"
	echo ""
	echo "7. Moon Buggy  8. Snake       9. Rogue"
#	echo ""

	read n
	case $n in
		1)	tmux new-window 'nethack'
			;;
		2)	tmux new-window '~/bin/torch'
			;;
		3)	tmux new-window '~/Downloads/df_linux/df'
			;;
		4)	tmux new-window 'tetris'
			;;
		5)	tmux new-window 'ninvaders'
			;;
		6)	tmux new-window 'pacman4console'
			;;
		7)	tmux new-window 'moon-buggy'
			;;
		8)	tmux new-window 'nsnake'
			;;
		9)	tmux new-window 'rogue'
			;;
		*)	clear
			;;
	esac

}


s_ssh()
{
	clear
	echo "Menu - SSH"
	echo "1. Retropie      2. VPN       3. Netbook"
	echo " "
	echo "4. Website"
	read n
	case $n in
		1)	tmux new-window 'ssh pi@retropie'
			;;
		2)	tmux new-window 'ssh eriktheblu@vpn'
			;;
		3)	tmux new-window 'ssh eriktheblu@netbook'
			;;
		4)	tmux new-window '~/scripts/websitessh.sh'
			;;
		*)	clear
			;;
	esac

}

s_coding()
{
	clear
	echo "Menu - Coding"
	echo "1. Open        2. Link Project"
	#echo ""
	#echo "4. Link Projects"
	read n
	case $n in
		#1)	tmux new-window '~/scripts/opencpp.sh'
		#	;;
		#2)	tmux new-window '~/scripts/newcpp.sh'
	#		;;
		1)	tmux select-pane -L
			tmux split-window -v '~/scripts/opencode.sh'
			;;
		2)	~/scripts/codelink
			;;
		*)	clear
			;;
	esac

}


s_tmux()
{
	clear
	echo "Menu - Tmux"
	echo "1. New Window  2. Detach      3. End Tmux"
	echo ""
	echo "4. Sessions    5. Exit menu"

	read n
	case $n in
		1)	tmux new-window
			;;
		2)	tmux detach
			;;
		3)	tmux kill-session -t Default
			;;
		4)	rtmux;
			;;
		5)	break
			;;
		*)	clear
			;;
	esac

}

s_programs()
{
	clear
	echo "Menu - Programs"
	echo "1. MOC         2. Spreadsheet 3. Ranger"
	echo ""
	echo "4. Sconsify"


	read n
	case $n in
		1)	tmux select-pane -L
			tmux split-window -v 'mocp ~/Music'
			;;
		2)	tmux new-window 'sc-im ~/data/'
			;;
		3)	tmux new-window 'ranger ~'
			;;
		4)	tmux select-pane -L
			tmux split-window -v '~/scripts/spot.shr'
			;;
		*)	clear
			;;
	esac

}

s_vpn()
{
	echo "Menu - VPN"
	clear
	echo "1. Connect     2. Disconnect"
	read n
	case $n in
		1) 	tmux new-window 'sudo openvpn ~/.vpn/20191213.ovpn'
			;;
		2)	sudo killall openvpn
			;;
		*)	clear
	esac
}
			
s_web()
{
	clear
	echo "Menu - Internet"
	echo "1. Links       2. Search      3. VPN"
	echo ""
	echo "4. Mutt email  5. SSH         6. Speed Test"
#	echo ""

	read n
	case $n in
		1)	tmux new-window 'links www.duckduckgo.com/lite'
			;;
		2)	tmux new-window '~/scripts/search.sh'
			;;
		3)	s_vpn
			#tmux new-window 'rainbowstream'
			;;
		4)	tmux new-window 'mutt'
			;;
		5)	s_ssh
			;;
		6)	tmux select-pane -L
			tmux split-window -v 'speedtest-cli && read a'
			;;
		*)	clear
			;;
	esac

}


while true; do
	clear
	#menu
	echo "Menu"
	echo "1. Programs    2. System      3. Tmux"
	echo ""
	echo "4. Internet    5. Games       6. Coding"
		
	#user input
	read n
	
	#handling
case $n	 in
		1)	s_programs
			;;
		2)	s_system
			;;
		3)	s_tmux
			;;
		4)	s_web
			;;
		5)	s_games
			;;
		6)	s_coding
			;;
		*)	echo Invalid selection
			echo ""
			;;
	esac
done
