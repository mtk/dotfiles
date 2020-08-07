#!/bin/bash
(
	date
	echo display is $DISPLAY
	ID=$(xinput list | grep ELAN | field 4 | field -f= 1)
	echo ID is "<$ID>"		
#	xinput disable 8
#	xinput disable 10
	xinput disable $ID
) >> /tmp/no.log 2>&1




