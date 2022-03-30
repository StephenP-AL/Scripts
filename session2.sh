#!/bin/bash
cd ~/code/scripts
tmux split-window -h
tmux split-window -v '/home/stephen/scripts/codemenu.sh /home/stephen/code/scripts'
tmux resize-pane -D 16
tmux resize-pane -R 35
sleep 0.5
if [ -e ~/code/scripts/quicksave.vim ]
then
vim -S ~/code/scripts/quicksave.vim; vifm ~/code/scripts
else
vifm ~/code/scripts
fi
