#!/bin/bash
tool=$1
loc="$2"
loc=${loc#"file://"}

if [[ ! -e $loc ]]; then
    loc=$(dirname "$loc")
fi

i3-msg exec 'alacritty -e '$tool' "'$loc'"'
