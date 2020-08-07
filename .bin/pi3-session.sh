#!/usr/local/bin/bash

SESSION="pi3-console$1"

if tmux has-session -t "=$SESSION"; then
    exec tmux attach -t "=$SESSION"
else
    exec tmux -2 new-session -s $SESSION -n htop  bash   -i -c 'ONCE=htop once'                                                       \; \
	new-window -n ugt                                                                                                             \; \
	new-window
fi

