#!/bin/sh

if ! wget -q --spider https://startpage.com; then
    echo ""
    exit 0
fi

API_KEY=`cat ~/.polybar_todoist`
tasks=$(curl -sf "https://api.todoist.com/rest/v2/tasks?filter=today,overdue" -H "Authorization: Bearer $API_KEY" | jq ". | length")

secondary=$(xrdb -query | grep 'color5:'| awk '{print $NF}')

if [ "$tasks" -gt 0 ]; then
   echo "%{F$secondary}%{F-} $tasks"
else
   echo ""
fi
