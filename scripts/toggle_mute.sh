# This script works around the strange coupling of audio channels
#!/bin/bash

CURRENTSTATUS=$(amixer -c 1 -- get Master | awk '/Mono: Playback/{print $6}')

echo $CURRENTSTATUS

if [ "$CURRENTSTATUS" = "[on]" ]
then
	# Mute master, speaker, headphone
	amixer -c 1 -- sset Master playback mute
	amixer -c 1 -- sset Speaker playback mute
	amixer -c 1 -- sset Headphone playback mute
elif [ "$CURRENTSTATUS" = "[off]" ]
then
	# Unmute master, speaker, headphone
	amixer -c 1 -- sset Master playback unmute
	amixer -c 1 -- sset Speaker playback unmute
	amixer -c 1 -- sset Headphone playback unmute
fi
