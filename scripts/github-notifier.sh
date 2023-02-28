#!/bin/sh
export XDG_RUNTIME_DIR=/run/user/$(id -u)

if ! ping -c 1 9.9.9.9 &> /dev/null; then
    echo ""
    exit 0
fi

USER=`cat ~/.polybar_github_user`
TOKEN=`cat ~/.polybar_github_token`

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [[ "$notifications" -gt 0 ]]; then
   /usr/bin/notify-send -u normal -t 60000 " $notifications github notifications"
fi
