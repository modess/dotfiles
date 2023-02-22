#!/bin/sh

if ! wget -q --spider https://startpage.com; then
    echo ""
    exit 0
fi

USER=`cat ~/.polybar_github_user`
TOKEN=`cat ~/.polybar_github_token`

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

secondary=$(xrdb -query | grep 'color5:'| awk '{print $NF}')

if [ "$notifications" -gt 0 ]; then
    echo "%{F$secondary}%{F-} $notifications"
else
    echo ""
fi
