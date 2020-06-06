#!/bin/bash
cd ~/code/scripts
tmux split-window -h
tmux split-window -v '/home/stephen/scripts/codemenu.sh /home/stephen/code/scripts'
tmux resize-pane -D 16
tmux resize-pane -R 35
ranger ~/code/scripts
