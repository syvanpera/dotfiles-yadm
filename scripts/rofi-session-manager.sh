#!/usr/bin/env bash

function main() {
    local sel=$(echo -e "l Lock\ne Exit\nr Reboot\ns Shutdown" | rofi -dmenu -p 'Session')

    case "${sel}" in
        "l Lock") cmd="cinnamon-screensaver-command -l";;
        "e Exit") cmd="cinnamon-session-quit";;
        "r Reboot") cmd="cinnamon-session-quit --reboot";;
        "s Shutdown") cmd="cinnamon-session-quit --power-off";;
    esac

    `$cmd`
}

main
