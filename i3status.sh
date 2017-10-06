#!/bin/bash

# shell script to prepend i3status with more stuff

i3status --config ~/.config/i3/status | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}')
    TIME=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/time to/{print $4 $5}')
    PRC=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/{print $2}')
    STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/{print $2}')
    COL="#ffffff"
    if [ "$STATE" = "discharging" ]; then
        REMAINING=$(echo $TIME | awk '/[0-9]+m/{print substr($1,1,1)}')
        if [[ -z $REMAINING ]]; then
            COL="#ffffff"
        elif [[ $REMAINING < 5 ]]; then
            COL="#ff2222"
        fi
    fi
    dat="[{ \"full_text\": \"$LG\"},{\"full_text\": \"$STATE ($PRC, $TIME)\", \"color\": \"$COL\"},"
    echo "${line/[/$dat}" || exit 1
done
