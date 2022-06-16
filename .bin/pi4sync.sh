#!/bin/bash -x
time          rsync $1 -avx --delete --exclude mtk/.cache --exclude mtk/.ccache --exclude mtk/.gdfuse --exclude mtk/g /home/mtk /net/pi4/a1/Backup
time .bin/pi4 -i .ssh/pi4-batch rsync $1 -avx --delete /a1/Backup /a2
