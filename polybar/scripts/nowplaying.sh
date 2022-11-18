#!/bin/bash
primary=$(xrdb -query | grep 'color4:'| awk '{print $NF}')
secondary=$(xrdb -query | grep 'color5:'| awk '{print $NF}')
green=$(xrdb -query | grep 'color2:'| awk '{print $NF}')
disabled=$(xrdb -query | grep 'color8:'| awk '{print $NF}')

status=$(playerctl status 2>&1)
nowplaying=$(playerctl metadata --format "{{ artist }} - {{ title }}" 2>&1)
shuffle=$(playerctl shuffle 2>&1)
loop=$(playerctl loop 2>&1)

if [[ "$status" == "Playing" ]]; then
    if [[ "$shuffle" == "Off" ]]; then
        shufflecolor=$disabled
    else
        shufflecolor=$green
    fi
    if [[ "$loop" == "Track" ]]; then
        loopcolor=$secondary
    elif [[ "$loop" == "Playlist" ]]; then
        loopcolor=$green
    else
        loopcolor=$disabled
    fi

    echo "%{F$primary}%{F-} $nowplaying %{F$shufflecolor}%{F-}  %{F$loopcolor}%{F-} "
elif [[ "$status" == "Paused" ]]; then
    echo "%{F$disabled} $nowplaying%{F-}"
else
    echo ""
fi
