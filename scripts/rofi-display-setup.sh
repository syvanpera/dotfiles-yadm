#!/bin/sh

twoscreen() { # If multi-monitor is selected and there are more than two screens.
  primary=$(echo "$screens" | dmenu -i -p "Select primary display:")
  secondary=$(echo "$screens" | grep -v "$primary" | dmenu -i -p "Select secondary display:")
  secdir=$(printf "above\\nleft-of\\nright-of\\nbelow" | dmenu -i -p "What side of $primary should $secondary be on?")
  xrandr --dpi 96 --output "$primary" --auto --output "$secondary" --"$secdir" "$primary" --auto
  i3-msg restart
  ~/.fehbg
  ~/scripts/setup-keyboard.sh
}


threescreen() { # If multi-monitor is selected and there are more than two screens.
  primary=$(echo "$screens" | dmenu -i -p "Select primary display:")
  secondary=$(echo "$screens" | grep -v "$primary" | dmenu -i -p "Select secondary display:")
  secdir=$(printf "above\\nleft-of\\nright-of\\nbelow" | dmenu -i -p "What side of $primary should $secondary be on?")
  tertiary=$(echo "$screens" | grep -v "$primary" | grep -v "$secondary")
  terdir=$(printf "above\\nleft-of\\nright-of\\nbelow" | dmenu -i -p "What side of $secondary should $tertiary be on?")
  xrandr --dpi 96 --output "$primary" --auto --output "$secondary" --"$secdir" "$primary" --auto --output "$tertiary" --"$terdir" "$secondary" --auto
  i3-msg restart
  ~/.fehbg
  ~/scripts/setup-keyboard.sh
}

multimon() {
  case "$(echo "$screens" | wc -l)" in
    1) xrandr $(echo "$allposs" | grep -v "$screens" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ') ;;
    2) twoscreen ;;
    3) threescreen ;;
  esac ;
}

allposs=$(xrandr -q | grep "connected")
screens=$(xrandr -q |grep " connected" |awk '{print $1}')
chosen=$(printf "%s\\nmulti-monitor\\nmanual" "$screens" | dmenu -i -p "Select display arrangement:")

case "$chosen" in
  "manual") arandr ; exit ;;
  "multi-monitor") multimon ;;
  *)
    if [ x$chosen != "x" ]
    then
      xrandr --dpi 192 --output "$chosen" --auto --scale 1x1 $(echo "$allposs" | grep -v "$chosen" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ') ; i3-msg restart ; ~/.fehbg ; ~/scripts/setup-keyboard.sh
    fi
    ;;
esac

