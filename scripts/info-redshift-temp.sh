#!/bin/sh

if [ "$(pgrep -x redshift)" ]; then
    temp=$(redshift -p 2> /dev/null | grep temp | cut -d ":" -f 2 | tr -dc "[:digit:]")

    if [ -z "$temp" ]; then
      echo "%{F#E5E9F0}%{F-} ${temp}K"
    elif [ "$temp" -ge 5000 ]; then
        echo "%{F#A3BE8C}%{F-} ${temp}K"
    elif [ "$temp" -ge 4000 ]; then
        echo "%{F#EBCB8B}%{F-} ${temp}K"
    else
        echo "%{F#D08770}%{F-} ${temp}K"
    fi
fi
