#!/bin/sh
GRAY='\033[1;33m'
if [ $(pulseaudio-ctl | grep "Is source muted" | wc -c) -eq 47 ]
then
  echo -e "%{F#707880}mic%{F-}"
else
  echo "mic"
fi
