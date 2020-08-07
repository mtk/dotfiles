#!/usr/local/bin/bash

SESSION="thor-console$1"

if tmux has-session -t "=$SESSION"; then
    exec tmux attach -t "=$SESSION"
else
    if [[ $SESSION =~ .*-remote$ ]]; then
	exec tmux -2 new-session -s $SESSION -n htop  bash   -i -c 'ONCE=htop once'                                                            \; \
	     new-window -n ugt                                                                                                                 \; \
	     new-window
    else
	exec tmux -2 new-session -s $SESSION -n htop  bash   -i -c 'ONCE=htop once'                                                            \; \
	     new-window -n bluetooth                   bash   -i -c 'ONCE=bluetoothctl once'                                                   \; \
	     new-window -n chrome                                                                                                              \; \
	     new-window -n idea                                                                                                                \; \
	     new-window -n ammonite   -c ~/proj/ammonite               bash -i -c 'CLASSPATH=$(latest-jars) ONCE="amm" once'                   \; \
             new-window -n psql                                        bash -i -c 'ONCE="psql postgresql://192.168.1.103/playground" once'     \; \
             new-window -n sbt        -c ~/IdeaProjects/NewSimple12    bash -i -c 'CLASSPATH=$(latest-jars) ONCE="wfsa.sh git pull; sbt" once' \; \
	     new-window -n ugt                                                                                                                 \; \
	     new-window
    fi
fi
