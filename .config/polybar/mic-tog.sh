#!/bin/sh
GRAY='\033[1;33m'
if [ $(pamixer --default-source --get-mute) == "true" ]
then
  echo -e "%{F#707880}mic%{F-}"
else
  echo "mic"
fi
