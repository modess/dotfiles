#!/usr/bin/env bash

killall -q polybar

polybar bottom 2>&1 | tee -a /tmp/polybar.log & disown
