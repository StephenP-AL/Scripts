#! /bin/sh
# Script for backing up files to a server and maintaining a log of backups
if [[ -d /mnt/etb/x220 ]]
then
	echo "----------File server mounted----------"
else
	echo "----------Mounting file server----------"
	sudo mount -a
fi
echo "----------Creating archive----------"
now=`date '+%Y%m%d_%H%M%S'`

tar --exclude='/home/stephen/.local' --exclude='/home/stephen/bin/_netbeans' --exclude='/home/stephen/IdeaProjects' --exclude='/home/stephen/bin/idea-IC-193.5233.102' --exclude='/home/stephen/Music' --exclude='/home/stephen/.config'  --exclude='/home/stephen/.cache' --exclude='/home/stephen/.mozilla' --exclude='/home/stephen/.local' --exclude='/home/stephen/.dropbox' --exclude='/home/stephen/.dropbox-dist' --exclude='/home/stephen/Videos' -cvpzf /home/stephen/.cache/backup_$now.tar.gz /home/stephen

echo "----------Moving archive to server----------"
mv /home/stephen/.cache/backup_$now.tar.gz /mnt/etb/x220/backup/backup_$now.tar.gz

echo "----------Updating log----------"
echo $now >> ~/data/backuplog.csv

