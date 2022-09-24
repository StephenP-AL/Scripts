#! /bin/sh
# Script for backing up files to a server and maintaining a log of backups
if [[ -d /mnt/etb/x220 ]] || [[ -d /mnt/dock ]]
then
	echo "----------Backup disks mounted---------"
else
	echo "----------Mounting file server----------"
	sudo mount -a
	if [[ -d /mnt/etb/x220 ]] || [[ -d /mnt/dock ]]
	then
		echo "----------Mounting failed; exiting-----------"
		exit 1
	fi
fi
echo "----------Creating archive----------"
now=`date '+%Y%m%d_%H%M%S'`

tar --exclude='/home/stephen/.thumbnails' --exclude='/home/stephen/.local' --exclude='/home/stephen/bin/_netbeans' --exclude='/home/stephen/IdeaProjects' --exclude='/home/stephen/bin/idea-IC-193.5233.102' --exclude='/home/stephen/Music' --exclude='/home/stephen/.config'  --exclude='/home/stephen/.cache' --exclude='/home/stephen/.mozilla' --exclude='/home/stephen/.local' --exclude='/home/stephen/.dropbox' --exclude='/home/stephen/.dropbox-dist' --exclude='/home/stephen/Videos' --exclude='/home/stephen/.steam' --exclude='/home/stephen/.zoom' --exclude='/home/stephen/.minecraft' --exclude='/home/stephen/.IdeaIC2019.3' --exclude='/home/stephen/.vscode-oss' --exclude='/home/stephen/.wine' --exclude='/home/stephen/.vim/tabnine-vim' -cvpzf /mnt/dock/backup/backup_$now.tar.gz /home/stephen

echo "----------Moving archive to server----------"
if cp /mnt/dock/backup/backup_$now.tar.gz /mnt/etb/x220/backup/backup_$now.tar.gz;
then
	rm /mnt/dock/backup_$now.tar.gz
else
	echo "Failed to copy archive to server"
fi

echo "----------Updating log----------"
echo $now >> /mnt/dock/backup/backuplog.csv

echo "----------Removing old archives----------"
MAX=10
COUNT=$(ls ~/net/backup | wc -l)
DIF=$(($COUNT-$MAX))
if [ $COUNT -gt $MAX ]
then 
	for file in $(ls ~/net/backup | head -$DIF); do
		echo "Removing $file"
		rm $file
	done
fi
