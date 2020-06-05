#! /bin/sh
#Downloads Dr. Coleman's slides for Data Structures class
wget -nd -np -r -P ~/Pictures/CS221 -A jpg http://www.cs.uah.edu/~rcoleman/CS221/Section1/TodaysClass/Images/
wget -nd -np -r -P ~/Pictures/CS221 -A jpg http://www.cs.uah.edu/~rcoleman/CS221/Temp/Images/
rm ~/Pictures/CS221/robots.txt*
tmux new-window 'cd ~/Pictures/CS221/; ls; exec bash'
