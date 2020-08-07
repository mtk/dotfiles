#!/usr/local/bin/bash

# display-independent session customization (shared by .profile & .xsession)
. ~/.bash_session

# log any stdout/stderr traffic from the X server and clients
exec >/tmp/xsession.$USER.$(date +'%Y%m%d-%H%M%S').$$ 2>&1

# an attempt at display independent sizing.  used below
# as well as various scripts and ini files.
eval $(dimensions)

# install my ssh identity into ssh-agent using the x windows client
ssh-add < /dev/null

xmodmap ~/.xmodmap

xinput disable 10

startkde


