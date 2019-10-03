#!/bin/sh

if [[ $1 == "hidpi" ]]; then
  echo "joo"
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  xrandr --dpi 192 &
  xrdb -merge ~/.Xresources.hidpi &
else
  xrandr --dpi 96 &
  xrdb -merge ~/.Xresources.lodpi &
fi
