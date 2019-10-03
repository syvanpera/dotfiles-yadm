#!/usr/bin/env bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

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
	i3-msg exit
        ;;
      Reboot)
        systemctl reboot
        ;;
      Shutdown)
        systemctl poweroff
        ;;
      Lock)
        betterlockscreen --lock dimblur
        ;;
      Suspend)
        betterlockscreen --suspend dimblur
#        $($USE_LOCKER) && "$LOCKER"; systemctl suspend
        ;;
      *)
        ;;
    esac
fi
