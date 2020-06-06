#! /bin/sh
# An attempt to create an IDE from TMUX and Vim. Main script
# Functions by writing a temporary script based on contents of a subdirectory

# Variables

# Location of temporary script
PL=~/.cache/PL.sh

# Location of projects
PF=~/code

# Location of buildsession.sh script
BS=~/scripts

# List existing projects
cd $PF
EXIT=0
FCOUNT=1
rm $PL
touch $PL
chmod +x $PL
echo "#!/bin/bash" >> $PL
echo "EXIT=0" >> $PL
echo "while [ \$EXIT == 0 ]" >> $PL
echo "do" >> $PL
echo "clear" >> $PL
echo "echo SELECT PROJECT" >> $PL
echo "echo ''" >> $PL
echo "echo n. New Project" >> $PL
for PROJ in *
do
	echo "echo $FCOUNT. $PROJ" >> $PL
	FCOUNT=$(( $FCOUNT + 1 ))
done
echo "read n" >> $PL
echo "case \$n in" >> $PL
echo "	n|N) 	clear" >> $PL
echo "		echo Enter new project name:" >> $PL
echo "		read SEL" >> $PL
echo "		mkdir \$SEL" >> $PL
echo "		EXIT=2" >> $PL
echo "		;;" >> $PL
FCOUNT=1
for PROJ in *
do
	echo "	$FCOUNT)	SEL=$PROJ" >> $PL
	echo "		EXIT=1" >> $PL
	echo "		;;" >> $PL
	FCOUNT=$(( FCOUNT + 1 ))
done
echo "*)	echo Invalid Selection" >> $PL
echo "		;;" >> $PL
echo "esac" >> $PL
echo "done" >> $PL
echo "$BS/buildsession.sh \$SEL" >> $PL
$PL

