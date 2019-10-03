#!/bin/sh

# make keyboard go faster
xset r rate 300 40

# set keyboard layout and use caps lock as control
setxkbmap -layout fi -variant nodeadkeys -option 'caps:ctrl_modifier' & # -option ctrl:nocaps
killall xcape ; xcape -e 'Caps_Lock=Escape' &

