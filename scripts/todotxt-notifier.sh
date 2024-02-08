#!/bin/bash
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# Get today's date in the same format (YYYY-MM-DD)
today=$(date +%F)

# Count the number of lines in todo.txt with a past due date
count=$(grep -Eo 'due:[0-9]{4}-[0-9]{2}-[0-9]{2}' /home/niklas/Dropbox/todo.txt | cut -d':' -f2 | awk -v today="$today" '$1 <= today' | wc -l)

if [[ "$count" -gt 0 ]]; then
    /usr/bin/notify-send -u critical -h string:fgcolor:#ff4444 " $count due tasks!"
fi
