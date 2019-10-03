#!/usr/bin/env bash

DP1_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )

if [ -f /sys/class/drm/card0/card0-DP-2/status ]; then
    DP2_STATUS=$(</sys/class/drm/card0/card0-DP-2/status )
fi

# Terminate already running bar instances
killall -q polybar
rm /tmp/ipc-polybar*

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# if type "xrandr"; then
#     for m in $(xrandr --query |grep " connected" | cut -d" " -f1); do
#         MONITOR=$m polybar --reload main &
#     done
# else
#     polybar --reload main &
# fi

if [ "connected" == "$DP1_STATUS" ]; then
    polybar dp1 -c ~/.config/polybar/config &
    ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar1
fi
# if [ "connected" == "$DP2_STATUS" ]; then
#     polybar dp2 -c ~/.config/polybar/config &
#     ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar2
# fi

if [ "connected" == "$DP1_STATUS" ] || [ "connected" == "$DP2_STATUS" ]; then
    # polybar edp1 -c ~/.config/polybar/config &
    ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar3
else
    polybar main -c ~/.config/polybar/config &
    ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar1
fi
