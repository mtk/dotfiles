#!/usr/local/bin/bash

SESSION="new2-console$1"

if tmux has-session -t "=$SESSION"; then
    exec tmux attach -t "=$SESSION"
else
    exec tmux new-session -s $SESSION -n htop                     bash -i -c 'ONCE=htop once'                                         \; \
	new-window -n bluetooth                                   bash -i -c 'ONCE=bluetoothctl once'                                 \; \
	new-window -n chrome                                                                                                          \; \
	new-window -n idea                                                                                                            \; \
	new-window -n ammonite   -c ~/proj/ammonite               bash -i -c 'ONCE="amm" once'                                        \; \
        new-window -n psql                                        bash -i -c 'ONCE="psql" once'                                       \; \
        new-window -n sbt        -c ~/IdeaProjects/NewSimple12    bash -i -c 'ONCE="wfsa.sh git pull; sbt" once'                      \; \
	new-window -n ugt                                                                                                             \; \
	new-window
fi

