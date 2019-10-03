#!/usr/bin/env bash

function main() {
    local sel=$(echo -e "t Todo\nn Note\nb Blog\n---\nq Quit" | rofi -dmenu -p 'Org Capture')

    case "${sel}" in
        "t Todo") key="t";;
        "n Note") key="n";;
        "b Blog") key="b";;
        "q Quit") exit;;
    esac

    ~/scripts/org-capture.sh -k $key
}

main
