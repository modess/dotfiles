#!/bin/sh

blue=$(xrdb -query | grep 'color6:'| awk '{print $NF}')
disabled=$(xrdb -query | grep 'color8:'| awk '{print $NF}')

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F$disabled}"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then
    echo ""
  fi
  echo "%{F$blue}"
fi

