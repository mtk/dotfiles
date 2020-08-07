#!/usr/local/bin/bash

echo "$(date)[$$]: initial $(ssh-add -l)" >/tmp/ssh.debug

while [[ $(ssh-add -l 2>/dev/null) =~ 'agent has no identities' ]]; do
    echo "$(date)[$$]: waiting for keys to show up..."
    sleep 1
done >> /tmp/ssh.debug

echo "$(date)[$$]: after loop $(ssh-add -l)" >>/tmp/ssh.debug
echo "$(date)[$$]: going to run '$@'" >>/tmp/ssh.debug

exec "$@"

