#!/bin/sh

if ! ping -c 1 9.9.9.9 &> /dev/null; then
    echo ""
    exit 0
fi

API_KEY=`cat ~/.polybar_todoist`
tasks=$(curl -sG "https://api.todoist.com/rest/v2/tasks" --data-urlencode "filter=due before: +0 hours" -H "Authorization: Bearer $API_KEY" | jq ". | length")

secondary=$(xrdb -query | grep 'color5:'| awk '{print $NF}')

if [ "$tasks" -gt 0 ]; then
   echo "%{F$secondary}%{F-} $tasks"
else
   echo ""
fi
