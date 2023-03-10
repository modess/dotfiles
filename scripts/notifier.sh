#!/bin/sh
export XDG_RUNTIME_DIR=/run/user/$(id -u)

/usr/bin/notify-send "$@"
