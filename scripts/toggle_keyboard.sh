#!/bin/bash

KBLANG=`setxkbmap -query | grep layout | awk '{print $2}'`

echo $KBLANG > .kblang.txt

if [ "$KBLANG" = "de" ]; then
	echo Detected layout de, switching to us
	setxkbmap us
elif [ "$KBLANG" = "us" ]; then
	echo Detected layout us, switching to de
	setxkbmap de
else
    echo String keyboard layout, switching to us
    setxkbmap us
fi
