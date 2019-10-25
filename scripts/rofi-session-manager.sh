#!/usr/bin/env bash

# rofi-session-manager
# Use rofi to call gnome-session for shutdown, reboot, etc

OPTIONS="l Lock\ne Exit\nr Reboot\ns Shutdown\np Suspend"

# source configuration or use default values
if [ -f $HOME/.config/rofi-power/config ]; then
  source $HOME/.config/rofi-power/config
else
  LAUNCHER="rofi -width 30 -dmenu -i -p Session"
#  USE_LOCKER="true"
#  LOCKER="i3lock"
fi

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $2}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        gnome-session-quit --logout
        ;;
      Reboot)
        gnome-session-quit --reboot
        ;;
      Shutdown)
        gnome-session-quit --power-off
        ;;
      Lock)
        gnome-screensaver-command --lock
        ;;
      Suspend)
        systemctl suspend
        ;;
      *)
        ;;
    esac
fi
