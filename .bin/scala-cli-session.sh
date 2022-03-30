#!/usr/local/bin/bash

SESSION="scala-cli"

if tmux has-session -t "=$SESSION" >$n 2>&1; then
    exec tmux attach -t "=$SESSION"
else
    exec tmux -2 new-session -s $SESSION \
	           -n git    -c ~/proj/scala-cli/scala-cli         \; \
        new-window -n raw    -c ~/proj/scala-cli/raw-args-feature  \; \
        new-window -n doctor -c ~/proj/scala-cli/801               \; \
        new-window -n src    -c ~/proj/src/scala                   \; \
	new-window           -c ~
fi

