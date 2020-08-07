#!/usr/local/bin/bash
export ONCE="$@"
exec $BASH -i -c "once $ONCE"
