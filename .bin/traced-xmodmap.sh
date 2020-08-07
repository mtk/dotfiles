#!/bin/bash
echo $(date) >>/tmp/xmodmap-log.txt 2>&1
pstree -T -h -C age >/tmp/xmodmap.pstree 2>&1
xmodmap -pke >/tmp/xmodmap.before
xmodmap /home/mtk/.xmodmap >>/tmp/xmodmap-log.txt 2>&1
xmodmap -pke >/tmp/xmodmap.after
echo $(date) xmodmap RC is $? >>/tmp/xmodmap-log.txt 2>&1
