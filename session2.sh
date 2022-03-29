#!/bin/bash
cd ~/code/DOCO2
tmux split-window -h
tmux split-window -v '/home/stephen/scripts/codemenu.sh /home/stephen/code/DOCO2'
tmux resize-pane -D 16
tmux resize-pane -R 35
sleep 0.5
if [ -e ~/code/DOCO2/quicksave.vim ]
then
vim -S ~/code/DOCO2/quicksave.vim; vifm ~/code/DOCO2
else
vifm ~/code/DOCO2
fi
