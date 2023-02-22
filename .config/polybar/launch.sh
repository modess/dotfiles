#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
polybar top 2>&1 | tee -a /tmp/polybar-top.log & disown
#polybar bottom 2>&1 | tee -a /tmp/polybar-bottom.log & disown

echo "Bars launched..."
