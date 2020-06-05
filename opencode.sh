#! /bin/sh

# List existing projects
EXIT=0
while [ $EXIT == 0 ]; do
	clear
	ls ~/code
	echo " "
	echo "OPEN PROJECT"
	echo " "
	echo ">>> Enter project name:"
	read SEL

	# create new
	if [ ! -d ~/code/$SEL ] 
	then
		echo "Create new project $SEL? (Y/N/Abort)"
		read n
		case $n in
			y|Y)	mkdir ~/code/$SEL
				EXIT=1
				;;
			a|A)	exit 1
				;;
			*)	continue
				;;
			esac
	else
		EXIT=2
	fi
done
# Creates script that creates the new session
FILE2=~/scripts/session2.sh
touch $FILE2
chmod +x $FILE2
echo "#!/bin/bash" > $FILE2
echo "cd ~/code/$SEL" >> $FILE2
echo "tmux split-window -h" >> $FILE2
echo "tmux split-window -v '~/scripts/codemenu.sh /home/stephen/code/$SEL'" >> $FILE2
echo "tmux resize-pane -D 16" >> $FILE2
echo "tmux resize-pane -R 35" >> $FILE2
echo vim ~/code/"$SEL" >> ~/scripts/session2.sh
tmux new-session -s $SEL -d '~/scripts/session2.sh'

# Creates file to attach to session
FILE1=~/scripts/session.sh
touch $FILE1
chmod +x $FILE1
echo "#!/bin/bash" > $FILE1
echo "tmux a -t $SEL" >> $FILE1
echo "rm $FILE1" >> $FILE1
echo "~/bin/go" >> $FILE1
tmux detach

