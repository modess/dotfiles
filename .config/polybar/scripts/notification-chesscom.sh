#!/bin/sh

if ! ping -c 1 9.9.9.9 &> /dev/null; then
    echo ""
    exit 0
fi

USERNAME=`cat ~/.secrets/chesscom_username`
games=$(curl -sf "https://api.chess.com/pub/player/$USERNAME/games/to-move" | jq ".[] | length")

secondary=$(xrdb -query | grep 'color5:'| awk '{print $NF}')

if [ "$games" -gt 0 ]; then
   echo "%{F$secondary}%{F-} $games"
else
   echo ""
fi
