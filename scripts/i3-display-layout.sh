#!/usr/bin/env bash

xrandr --dpi 96 --output eDP1 --mode 3000x2000 --pos 0x1440 --rotate normal --output DP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP2 --mode 2560x1440 --pos 2560x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off

# #!/bin/bash
# for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
#     if [[ $output =~ ^LVDS.*$ ]]; then
#             lvds=$output
#     fi
# done
# for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
#     if [[ ! $output =~ ^LVDS.*$ ]]; then
#        xrandr --output $lvds --auto --output $output --pos 0x0 --auto \
#               --right-of $lvds --primary
#     fi
# done
#
# xrandr --dpi 96
# xrandr --output DP1 --primary
# i3-msg '[workspace="^(1|2)"] move workspace to output DP1;'
# i3-msg '[workspace="^(3|4)"] move workspace to output DP2;'
# i3-msg '[workspace="^(5|6)"] move workspace to output eDP1;'
