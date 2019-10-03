[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# HIDPI
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
xrandr --dpi 192 &
xrdb -merge -I$HOME ~/.Xresources.hidpi &

# LODPI
# xrandr --dpi 96 &
# xrdb -merge -I$HOME ~/.Xresources.lodpi &

# export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=gtk2

~/.fehbg &
sxhkd &
xset r rate 300 40 &
greenclip daemon &

# set keyboard layout and use caps lock as control/esc
# setxkbmap -layout fi -variant nodeadkeys -option 'caps:ctrl_modifier' && killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape' &
killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape' &

~/scripts/setup-touchpad.sh &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
