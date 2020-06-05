#! /bin/bash
#Part of IDE project. Creates a script to open a coding TMUX session, then return to default session when done
FILE=~/scripts/session.sh
tmux new-session -s $1 -d 
echo "#!/bin/bash" > $FILE
echo "tmux a -t $1" >> $FILE
echo "echo '#!/bin/bash' > $FILE" >> $FILE
echo "~/bin/go" >> $FILE
tmux detach

