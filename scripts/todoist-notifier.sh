#!/bin/sh
export XDG_RUNTIME_DIR=/run/user/$(id -u)

if ! ping -c 1 9.9.9.9 &> /dev/null; then
    echo ""
    exit 0
fi

API_KEY=`cat /home/niklas/.polybar_todoist`
overdue=$(curl -sG "https://api.todoist.com/rest/v2/tasks" --data-urlencode "filter=due before: +0 hours" -H "Authorization: Bearer $API_KEY" | jq ". | length")
today=$(curl -sG "https://api.todoist.com/rest/v2/tasks" --data-urlencode "filter=today" -H "Authorization: Bearer $API_KEY" | jq ". | length")

if [[ "$overdue" -gt 0 ]]; then
   /usr/bin/notify-send -u critical -h string:fgcolor:#ff4444 " $overdue overdue tasks!"
fi
if [[ "$today" -gt 0 ]]; then
   /usr/bin/notify-send -u normal -t 60000 " $today tasks today"
fi
