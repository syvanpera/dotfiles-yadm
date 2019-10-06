#!/usr/bin/env bash

function main() {
    local sel=$(echo -e "1 display setup\n2 scrot to blog\n3 nerd font\n4 k8s namespace\n5 k8s context\n6 edit configs" | rofi -dmenu -p 'Tools')

    case "${sel}" in
        "1 display setup") ~/scripts/rofi-display-setup.sh;;
        "2 scrot to blog") ~/scripts/scrot-to-blog.sh;;
        "3 nerd font") ~/scripts/rofi-nerdfonts.sh;;
        "4 k8s namespace") ~/scripts/rofi-kube-namespace.sh;;
        "5 k8s context") ~/scripts/rofi-kube-context.sh;;
        "6 edit configs") ~/scripts/rofi/config-files.sh;;
    esac
}

main
