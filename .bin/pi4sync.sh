#!/bin/bash -x
time     rsync $1 -avx --delete --exclude mtk/.cache --exclude mtk/.ccache --exclude mtk/.gdfuse --exclude mtk/g /home/mtk /net/pi4/a1/Backup
time pi4 rsync $1 -avx --delete /a1/Backup /a2
