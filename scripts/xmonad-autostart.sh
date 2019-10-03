#!/bin/bash

# Map Caps Lock as Control when held down and Escape when pressed and released
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

killall greenclip; greenclip daemon &
killall compton; compton --config $HOME/dotfiles/compton.conf &
