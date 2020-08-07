#!/usr/local/bin/bash

TAG=$1
LOG=/tmp/wfsa-$TAG.debug

echo "$TAG $(date): initial $(ssh-add -l)" > $LOG

while [[ $(ssh-add -l 2>/dev/null) =~ 'agent has no identities' ]]; do
    echo "$TAG $(date): waiting for keys to show up..."
    sleep 1
done >> $LOG

echo "$TAG $(date): after loop $(ssh-add -l)" >> $LOG

exec "$@"



