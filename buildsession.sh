#!/bin/bash
# Utility to create and execute session scripts

# Variables

#File Manager 
FM=ranger

# Default tmux session
DT=~/bin/go

# IDE session
FILE1=~/scripts/session.sh

# Return session; when invoked the variable doesn't work
FILE2=~/scripts/session2.sh

# Creates script that creates the new session
touch $FILE2
chmod +x $FILE2
echo "#!/bin/bash" > $FILE2
echo "cd ~/code/$1" >> $FILE2
echo "tmux split-window -h" >> $FILE2
echo "tmux split-window -v '~/scripts/codemenu.sh /home/stephen/code/$1'" >> $FILE2
echo "tmux resize-pane -D 16" >> $FILE2
echo "tmux resize-pane -R 35" >> $FILE2
echo "$FM ~/code/$1" >> $FILE2

# Manually set this script to the same as $FILE2; variables don't work here
tmux new-session -s $1 -d '~/scripts/session2.sh'

touch $FILE1
chmod +x $FILE1
echo "#!/bin/bash" > $FILE1
echo "tmux a -t $1" >> $FILE1
echo "rm $FILE1" >> $FILE1
echo "~/bin/go" >> $FILE1

tmux detach
