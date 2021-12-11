#! /bin/bash
# script for checking my monero wallet. I haven't been able to get it to use variables for the paths, so you will need to edit to work with your file system

if tmux list-windows | grep Monero > /dev/null
then
	echo Switching to running instance
	tmux select-window -t Monero
else
if [[ -d /mnt/crypto/monero ]]
then
	echo "Blockchain disk already mounted"
else	
	echo "Attempting to mount blockchain disk"
	sudo mount UUID=2fe4d760-dd00-428c-9111-8d8e88925a32 /mnt/crypto
	if [ $? -eq 0 ]
	then 
		echo "Mounted"
	else
		echo "Failed to mount blockchain disk"
		exit 1
		read n
	fi
fi

tmux new-window -n Monero 'monero-wallet-cli --wallet-file /mnt/crypto/monero/wallet/test/test/test.keys; monerod exit'
tmux split-window -v 'monerod --data-dir /mnt/crypto/monero'
tmux resize-pane -D 15
tmux select-pane -D
fi
