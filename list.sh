#! /bin/sh
#creates a list of projects
COUNT=2
SC=~/.cache/list_tmp.sh
rm $SC
touch $SC
echo #!/bin/bash >> $SC
for PROJ in ~/code/* 
 
do
echo "$COUNT. $PROJ" >> ~/.cache/listtmp.sh
COUNT=$(( $COUNT + 1 ))
done
