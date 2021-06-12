#! /bin/bash
tmux new-window 'monero-wallet-cli --wallet-file /mnt/crypto/monero/wallet/test/test/test.keys; monerod exit'
tmux split-window -v 'monerod --data-dir /mnt/crypto/monero'
tmux resize-pane -D 20
tmux select-pane -D
