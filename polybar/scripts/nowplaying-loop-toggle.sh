#!/bin/bash

loop=$(playerctl loop 2>&1)

if [[ "$loop" == "None" ]]; then
    playerctl loop Playlist
elif [[ "$loop" == "Playlist" ]]; then
    playerctl loop Track
else
    playerctl loop None
fi
