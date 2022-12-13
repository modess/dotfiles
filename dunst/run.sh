#!/bin/bash

# Get values from Xresources
low_background=$(xgetres color0)
low_foreground=$(xgetres color7)
low_frame=$(xgetres color7)
normal_background=$(xgetres color4)
normal_foreground=$(xgetres color7)
normal_frame=$(xgetres color7)
critial_background=$(xgetres color9)
critical_foreground=$(xgetres color7)
critical_frame=$(xgetres color9)

# Kill and running dunst instances and start
killall dunst;dbus-launch dunst --config ~/.config/dunst/dunstrc \
    -lb "$low_background" \
    -lf "$low_foreground" \
    -lfr "$low_frame" \
    -nb "$normal_background" \
    -nf "$normal_foreground" \
    -nfr "$normal_frame" \
    -cb "$critical_background" \
    -cf "$critical_foreground" \
    -cfr "$critical_frame"