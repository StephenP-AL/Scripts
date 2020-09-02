#! /bin/bash
#Menu for coding session; git functions aren't working very well

# Variables

# Temporary file
TEMPFILE=~/.cache/codemenutemp.sh

# Git URL
GITURL=https://github.com/StephenPate

# Temporary files in single quotes
TEMPQ=\'$TEMPFILE\'
DIR=$1
PROJ=$(basename $DIR)

s_build()
{
	clear
	echo "Menu - Build"
	echo ""
	echo "1. Make    "
}
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
			echo "cd $DIR" >> $TEMPFILE
			echo "git status | more" >> $TEMPFILE
			echo "echo ENTER to continue" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux select-pane -L
			tmux split-pane -v $TEMPQ
			;;
		2)	echo "#!/bin/bash" > $TEMPFILE
			echo "cd $DIR" >> $TEMPFILE
			echo "while [ -z \"\$COMMENT\" ]" >> $TEMPFILE
			echo "do" >> $TEMPFILE
			echo "clear" >> $TEMPFILE
			echo "echo \"Enter commit comment (required)\"" >> $TEMPFILE
			echo "read COMMENT" >> $TEMPFILE
			echo "done" >> $TEMPFILE
			echo "echo ENTER to commit, CTRL+C to abort" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "git commit -a -m \"\$COMMENT\"" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux select-pane -L
			tmux split-pane -v $TEMPQ
			;;
		3)	echo "#!/bin/bash" > $TEMPFILE
			echo "cd $DIR" >> $TEMPFILE
			echo "git pull" >> $TEMPFILE
			echo "echo ENTER to continue" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux select-pane -L
			tmux split-pane -v $TEMPQ
			;;
		4)	echo "#!/bin/bash" > $TEMPFILE
			echo "cd $DIR" >> $TEMPFILE
			echo "git push" >> $TEMPFILE
			echo "echo ENTER to continue" >> $TEMPFILE
			echo "read n" >> $TEMPFILE
			echo "tmux select-pane -R" >> $TEMPFILE
			chmod +x $TEMPFILE
			tmux select-pane -L
			tmux split-pane -v $TEMPQ
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
			tmux split-pane -v $TEMPQ
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
			tmux split-pane -v $TEMPQ
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
	echo "1. Git     2. Make"
	echo "4. Exit"
	#user input
	read n

	case $n in
		1)	s_git
			;;
		2)	tmux select-pane -L
			echo "#!/bin/bash" > $TEMPFILE
			echo "cd $DIR" > $TEMPFILE
			echo "make" > $TEMPFILE
			echo "read n" > $TEMPFILE
			chomod +x $TEMPFILE
			tmux split-pane -v $TEMPQ
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

	
