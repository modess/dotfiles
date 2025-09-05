#!/bin/bash

# Kill and running dunst instances and start
killall dunst;dbus-launch dunst --config ~/.config/dunst/dunstrc 
