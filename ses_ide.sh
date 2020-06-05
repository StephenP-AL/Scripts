#! /bin/bash
FILE=~/scripts/session.sh
tmux new-session -s $1 -d 
echo "#!/bin/bash" > $FILE
echo "tmux a -t $1" >> $FILE
echo "echo '#!/bin/bash' > $FILE" >> $FILE
echo "~/bin/go" >> $FILE
tmux detach

