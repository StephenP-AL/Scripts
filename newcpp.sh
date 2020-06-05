#! /bin/sh
f_new()
{
	mkdir ~/code/$FILE
	cp ~/code/.default/default.cpp ~/code/$FILE/$FILE.cpp

	echo "#! /bin/sh" > ~/code/$FILE/compile.sh
	echo "tmux new-window 'g++ ~/code/$FILE/$FILE.cpp -o ~/code/$FILE/$FILE | less'" >> ~/code/$FILE/compile.sh
	chmod +x ~/code/$FILE/compile.sh

	echo "#! /bin/sh" > ~/code/$FILE/test.sh
	echo "~/code/$FILE/$FILE > ~/code/$FILE/out.txt" >> ~/code/$FILE/test.sh
	echo "tmux new-window 'less ~/code/$FILE/out.txt'" >> ~/code/$FILE/test.sh
	chmod +x ~/code/$FILE/test.sh	
	
	echo "#! /bin/sh" > ~/code/$FILE/run.sh
	echo "tmux new-window '~/code/$FILE/$FILE && read'" >> ~/code/$FILE/run.sh
	chmod +x ~/code/$FILE/run.sh

	echo "#! /bin/sh" > ~/code/$FILE/menu.sh
	echo "FILE=$FILE" >> ~/code/$FILE/menu.sh
	cat ~/code/.default/menu.sh >> ~/code/$FILE/menu.sh
	chmod +x ~/code/$FILE/menu.sh

	echo "#! /bin/sh" > ~/.cache/opencpp.sh
	echo "vim ~/code/$FILE/$FILE.cpp" >> ~/.cache/opencpp.sh
	chmod +x ~/.cache/opencpp.sh
	tmux split-window -h '~/.cache/opencpp.sh'

	echo "#! /bin/sh" > ~/.cache/opencpp.sh
	echo "tmux split-window -v '~/code/$FILE/menu.sh'" >> ~/.cache/opencpp.sh
	echo "cd ~/code/$FILE/; exec bash" >>  ~/.cache/opencpp.sh
	chmod +x ~/.cache/opencpp.sh
	tmux split-window -h '~/.cache/opencpp.sh'
	tmux resize-pane -L 4  
	tmux resize-pane -D 12 
	break
}

ls ~/code
echo "NEW PROJECT"
echo " "
while true; do
	
	echo ">>> Enter project name:"
	read FILE
	[ -f ~/code/$FILE/$FILE.cpp ] && echo "Project exists" || f_new 
done


#echo "#! /bin/sh" > ~/.cache/opencpp.sh
#echo "~/code/$FILE/menu.sh" >> ~/.cache/opencpp.sh

