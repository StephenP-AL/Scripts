#! /bin/sh
#Opens C++ project (not recommended)
ls ~/code
echo " "
echo "OPEN PROJECT"
echo " "
echo ">>> Enter project name:"
read FILE

echo "#! /bin/sh" > ~/.cache/opencpp.sh
echo "vim ~/code/$FILE/$FILE.cpp" >> ~/.cache/opencpp.sh
echo "echo here" >>~/.cache/opencpp.sh
chmod +x ~/.cache/opencpp.sh
tmux split-window -h '~/.cache/opencpp.sh'


echo "#! /bin/sh" > ~/.cache/opencpp.sh
echo "tmux split-window -v '~/code/$FILE/menu.sh'" >> ~/.cache/opencpp.sh
echo "cd ~/code/$FILE/; exec bash" >>  ~/.cache/opencpp.sh
chmod +x ~/.cache/opencpp.sh

tmux split-window -h '~/.cache/opencpp.sh'

tmux resize-pane -L 4  
tmux resize-pane -U 12
