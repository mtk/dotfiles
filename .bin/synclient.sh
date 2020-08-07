#!/usr/local/bin/bash
synclient -l >/tmp/sc-before.log 2>&1
synclient TouchpadOff=1 PalmDetect=1 >/tmp/sc.log 2>&1
synclient -l >/tmp/sc-after.log 2>&1
