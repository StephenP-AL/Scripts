#! /bin/bash
# script for checking my monero wallet. I haven't been able to get it to use variables for the paths, so you will need to edit to work with your file system

if tmux list-windows | grep Monero > /dev/null
then
	echo Switching to running instance
	tmux select-window -t Monero
else
if [[ -d /mnt/dock/crypto/monero ]]
then
	echo "Blockchain disk already mounted"
else	
	echo "Attempting to mount blockchain disk"
	sudo mount UUID=ffab04fd-3e55-48b8-b0f1-657f5351f1c2 mnt/dock/crypto
	if [ $? -eq 0 ]
	then 
		echo "Mounted"
	else
		echo "Failed to mount blockchain disk"
		exit 1
		read n
	fi
fi

tmux new-window -n Monero 'monero-wallet-cli --wallet-file /mnt/dock/crypto/monero/wallet/test/test/test.keys; monerod exit'
tmux split-window -v 'monerod --data-dir /mnt/dock/crypto/monero'
tmux resize-pane -D 15
tmux select-pane -D
fi
