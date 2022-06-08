#!/usr/local/bin/bash

SESSION="projects"

if tmux has-session -t "=$SESSION" >$n 2>&1; then
    exec tmux attach -t "=$SESSION"
else
    exec tmux -2 new-session -s $SESSION \
	           -n cli        -c ~/proj/scala-cli/scala-cli                \; \
        new-window -n doctor     -c ~/proj/scala-cli/doctor                   \; \
        new-window -n scpe       -c ~/proj/git/scala-compiler-plugin-examples \; \
        new-window -n dotty      -c ~/proj/git/dotty                          \; \
        new-window -n scala-src  -c ~/proj/src/scala                          \; \
        new-window -n scalac     -c ~/proj/scalac                             \; \
        new-window -n akka       -c ~/proj/scalac/workshop-akka-actors        \; \
	new-window               -c ~
fi

