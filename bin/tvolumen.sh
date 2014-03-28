#!/bin/sh
## tint2 left click on clock volume control ##
STATE=`pidof -x alsamixer`
if [ ! -n "$STATE" ]; then 
xterm -geom "37x17+986+525" -e alsamixer
else 
killall alsamixer 
fi

