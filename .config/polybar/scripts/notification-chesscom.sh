#!/bin/sh

if ! wget -q --spider https://startpage.com; then
    echo ""
    exit 0
fi

USERNAME=`cat ~/.polybar_chess`
games=$(curl -sf "https://api.chess.com/pub/player/$USERNAME/games/to-move" | jq ".[] | length")

secondary=$(xrdb -query | grep 'color5:'| awk '{print $NF}')

if [ "$games" -gt 0 ]; then
   echo "%{F$secondary}%{F-} $games"
else
   echo ""
fi
