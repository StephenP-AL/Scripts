#! /bin/bash
#Menu for coding session
TEMPILE=~/.cache/codemenutemp.sh
DIR=$1
PROJ=$(basename $DIR)

s_git()
{
	clear
	echo "Menu - Git"
	echo ""
	echo "1. Status  2. Commit  3. Pull "
	echo "4. Push    5. Setup"
	read n
	case $n in
		1)	echo "#!/bin/bash" > ~/.cache/codemenutemp.sh
			echo "git -C $DIR status | more" >> ~/.cache/codemenutemp.sh
			echo "echo ENTER to continue" >> ~/.cache/codemenutemp.sh
			echo "read n" >> ~/.cache/codemenutemp.sh
			echo "tmux select-pane -R" >> ~/.cache/codemenutemp.sh
			chmod +x ~/.cache/codemenutemp.sh
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.sh'
			;;
		2)	echo "#!/bin/bash" > ~/.cache/codemenutemp.sh
			echo "echo \"Enter commit comment\"" >> ~/.cache/codemenutemp.sh
			echo "read COMMENT" >> ~/.cache/codemenutemp.sh
			echo "echo ENTER to commit, CTRL+C to abort" >> ~/.cache/codemenutemp.sh
			echo "read n" >> ~/.cache/codemenutemp.sh
			echo "git -C $DIR commit -a -m \"$COMMENT\"" >> ~/.cache/codemenutemp.sh
			echo "tmux select-pane -R" >> ~/.cache/codemenutemp.sh
			chmod +x ~/.cache/codemenutemp.sh
			#echo $DIR
			#read n
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.sh'
		#	rm ~/.cache/codemenutemp.sh
			;;
		3)	echo "#!/bin/bash" > ~/.cache/codemenutemp.sh
			echo "git -C $DIR pull" >> ~/.cache/codemenutemp.sh
			echo "echo ENTER to continue" >> ~/.cache/codemenutemp.sh
			echo "read n" >> ~/.cache/codemenutemp.sh
			echo "tmux select-pane -R" >> ~/.cache/codemenutemp.sh
			chmod +x ~/.cache/codemenutemp.sh
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.sh'mux select-pane -L
			;;
		4)	echo "#!/bin/bash" > ~/.cache/codemenutemp.sh
			echo "git -C $DIR push" >> ~/.cache/codemenutemp.sh
			echo "echo ENTER to continue" >> ~/.cache/codemenutemp.sh
			echo "read n" >> ~/.cache/codemenutemp.sh
			echo "tmux select-pane -R" >> ~/.cache/codemenutemp.sh
			chmod +x ~/.cache/codemenutemp.sh
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.sh'mux select-pane -Lclear
			;;
		5)	s_gitsetup
			;;
		*)	break	
			;;
		esac
}
s_gitsetup()
{
	clear
	echo "Menu - Git Setup"
	echo ""
	echo "1. Initialize  2. Remote  3. Clone"
	echo "4. Exclude"
	read n
	case $n in
		1)	tmux select-pane -L
			echo "#!/bin/bash" > ~/.cache/codemenutemp.sh
			echo "git -C $DIR init" >> ~/.cache/codemenutemp.sh
			echo "echo \"Create GitHub repo $PROJ? [Y/N]\"" >> ~/.cache/codemenutemp.sh
			echo "read n" >> ~/.cache/codemenutemp.sh
			echo "case \$n in" >> ~/.cache/codemenutemp.sh
			echo "Y|y) github-create $PROJ" >> ~/.cache/codemenutemp.sh
			echo "echo \"# $PROJ\" > $DIR/README.md" >> ~/.cache/codemenutemp.sh
			echo "git -C $DIR add README.md" >> ~/.cache/codemenutemp.sh
			echo "git -C $DIR commit -m \"First commit\""  >> ~/.cache/codemenutemp.sh
			echo "git -C $DIR remote add origin https://github.com/StephenPate/$PROJ.git" >> ~/.cache/codemenutemp.sh
			echo "git -C $DIR push -u origin master" >> ~/.cache/codemenutemp.sh
			echo "	;;" >> ~/.cache/codemenutemp.sh
			echo "	*)" >> ~/.cache/codemenutemp.sh
			echo "	;;" >> ~/.cache/codemenutemp.sh
			echo "	esac" >> ~/.cache/codemenutemp.sh
#			echo "read n" >> ~/.cache/codemenutemp.sh
			echo "tmux select-pane -R" >> ~/.cache/codemenutemp.sh
			chmod +x ~/.cache/codemenutemp.sh
			tmux split-pane -v '~/.cache/codemenutemp.sh'
			;;
		2)	echo "#!/bin/bash" >> ~/.cache/codemenutemp.sh
			echo "echo \"Enter github project\"" >> ~/.cache/codemenutemp.sh
			echo "read n" >> ~/.cache/codemenutemp.sh
			echo "git -C $DIR remote add origin \$n\"" >> ~/.cache/codemenutemp.sh
			tmux 
			read n
			;;
		3)	echo "Clone not implemented"
			read n
			;;
		4)	tmux select-pane -L
			echo "#!/bin/bash" > ~/.cache/codemenutemp.sh
			echo "vim $DIR/.git/info/exclude" >> ~/.cache/codemenutemp.sh
			echo "tmux select-pane -R" >> ~/.cache/codemenutemp.sh
			chmod +x ~/.cache/codemenutemp.sh
			tmux split-pane -v '~/.cache/codemenutemp.sh'
			;;
		*)	
			;;
		esac
}	
while true; do
	clear
	# Main Menu

	echo "Menu"
	echo ""
	echo "1. Git  "
	echo "4. Exit"
	#user input
	read n

	case $n in
		1)	s_git
			;;
		4)	echo "Confirm exit? (y)"
			read confirm
			case $confirm in
				y) 	tmux kill-session
					break
					;;
				*)	echo "Cancelled"
					;;
			esac
			;;
		q)	break
			;;
		*)	echo "Invalid entry"
			;;
	esac
done

	
