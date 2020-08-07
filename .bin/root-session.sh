#!/usr/local/bin/bash

SESSION="root-console$1"

PATH=/usr/local/bin:$PATH

# the '=' means *exact* match
if tmux has-session -t "=$SESSION"; then
    exec tmux attach -t "=$SESSION"
else
    exec tmux -2 new-session -A -s "$SESSION" -n messages 'journalctl -f' \; \
	new-window
fi

