#!/bin/sh

if ! ping -c 1 9.9.9.9 &> /dev/null; then
    echo ""
    exit 0
fi

USER=`cat ~/.secrets/github_username`
TOKEN=`cat ~/.secrets/github_token`

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

secondary=$(xrdb -query | grep 'color5:'| awk '{print $NF}')

if [ "$notifications" -gt 0 ]; then
    echo "%{F$secondary}%{F-} $notifications"
else
    echo ""
fi
