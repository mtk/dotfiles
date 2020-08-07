#!/bin/bash
autossh -f -M 10121 -L 10119:news.optonline.net:119  -l mtk -N h1
autossh -f -M 10123 -L 10993:imap.gmail.com:993      -l mtk -N h1
autossh -f -M 10125 -L 10465:smtp.gmail.com:465      -l mtk -N h1
autossh -f -M 10127 -L 10025:mail.optonline.net:25   -l mtk -N h1
