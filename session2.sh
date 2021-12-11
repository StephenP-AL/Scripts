#!/bin/bash
cd ~/code/CS371-AnPro-Project
tmux split-window -h
tmux split-window -v '/home/stephen/scripts/codemenu.sh /home/stephen/code/CS371-AnPro-Project'
tmux resize-pane -D 16
tmux resize-pane -R 35
sleep 0.5
cfiles
