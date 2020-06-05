#!/bin/bash
cd ~/code/cfiles
tmux split-window -h
tmux split-window -v '~/scripts/codemenu.sh /home/stephen/code/cfiles'
tmux resize-pane -D 16
tmux resize-pane -R 35
vim /home/stephen/code/cfiles
