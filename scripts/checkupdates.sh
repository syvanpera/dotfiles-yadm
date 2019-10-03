#!/bin/bash

UPDATES=`checkupdates | wc -l | cut -f1 -d" "`

if [ $UPDATES -gt 0 ]; then
    echo %{F#A3BE8C}%{F-} $UPDATES
fi
