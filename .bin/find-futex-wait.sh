#!/bin/bash
#
# Find all processes that are executing a futex(2) call with op=FUTEX_WAIT
# In some cases this can be helpful in finding deadlock-ed processes.
#

test ! $UID -eq 0 && echo -e "WARNING: Not running as root, only processes for this user are being scanned\n" >&2;
pids=$(ps -u $UID -opid --no-headers)

for pid in $pids; do
        cat /proc/$pid/syscall |

        awk "{if (\$1 == 202 && \$3 == \"0x0\") {
                print $pid
        }}";

        # $1 is the syscall, we compare to 202 which is the futex call
        # See: /usr/include/asm/unistd.h

        # $2 is the 1st param, $3 is the 2nd param, etc
        # We compare the second param to 0x0 which is FUTEX_WAIT
        # See: /usr/include/linux/futex.h
done
