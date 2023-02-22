#!/bin/sh
export XDG_RUNTIME_DIR=/run/user/$(id -u)

if ! wget -q --spider https://startpage.com; then
    echo ""
    exit 0
fi

API_KEY=`cat /home/niklas/.polybar_todoist`
overdue=$(curl -sf "https://api.todoist.com/rest/v2/tasks?filter=overdue" -H "Authorization: Bearer $API_KEY" | jq ". | length")

if [ "$overdue" -gt 0 ]; then
   /usr/bin/notify-send -u critical -h string:fgcolor:#ff4444 " $overdue overdue tasks!"
fi
