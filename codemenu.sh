#! /bin/bash
#Menu for coding session; git functions aren't working very well

# Variables

# Temporary file
TEMPILE=~/.cache/codemenutemp.sh

# Git URL
GITURL=https://github.com/StephenPate

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
		1)	echo "#!/bin/bash" > $TEMPFILE
			echo "git -C $DIR status | more" >> $TEMPFILE
			echo "echo ENTER to continue" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.sh
			;;
		2)	echo "#!/bin/bash" > $TEMPFILE
			echo "echo \"Enter commit comment\"" >> $TEMPFILE
			echo "read COMMENT" >> $TEMPFILE
			echo "echo ENTER to commit, CTRL+C to abort" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "git -C $DIR commit -a -m \"$COMMENT\"" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			#echo $DIR
			#read n
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.sh
		#	rm $TEMPFILE
			;;
		3)	echo "#!/bin/bash" > $TEMPFILE
			echo "git -C $DIR pull" >> $TEMPFILE
			echo "echo ENTER to continue" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.shmux select-pane -L
			;;
		4)	echo "#!/bin/bash" > $TEMPFILE
			echo "git -C $DIR push" >> $TEMPFILE
			echo "echo ENTER to continue" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux select-pane -L
			tmux split-pane -v '~/.cache/codemenutemp.shmux select-pane -Lclear
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
			echo "#!/bin/bash" > $TEMPFILE
			echo "git -C $DIR init" >> $TEMPFILE
			echo "echo \"Create GitHub repo $PROJ? [Y/N]\"" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "case \$n in" >> $TEMPFILE
			echo "Y|y) github-create $PROJ" >> $TEMPFILE
			echo "echo \"# $PROJ\" > $DIR/README.md" >> $TEMPFILE
			echo "git -C $DIR add README.md" >> $TEMPFILE
			echo "git -C $DIR commit -m \"First commit\""  >> $TEMPFILE
			echo "git -C $DIR remote add origin $GITURL/$PROJ.git" >> $TEMPFILE
			echo "git -C $DIR push -u origin master" >> $TEMPFILE
			echo "	;;" >> $TEMPFILE
			echo "	*)" >> $TEMPFILE
			echo "	;;" >> $TEMPFILE
			echo "	esac" >> $TEMPFILE
#			echo "read n" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux split-pane -v '~/.cache/codemenutemp.sh'
			;;
		2)	echo "#!/bin/bash" >> $TEMPFILE
			echo "echo \"Enter github project\"" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "git -C $DIR remote add origin \$n\"" >> $TEMPFILE
			tmux 
			read n
			;;
		3)	echo "Clone not implemented"
			read n
			;;
		4)	tmux select-pane -L
			echo "#!/bin/bash" > $TEMPFILE
			echo "vim $DIR/.git/info/exclude" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
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

	
