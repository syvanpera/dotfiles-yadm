#!/usr/bin/env bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Veikkaus Dev"
TITLE="OpenAPI Host"
MENU="Select OpenAPI Host:"

OPTIONS=(1 "local"
         2 "production"
         3 "vt02")

HOST=""

if [ -z "$1" ]
then
  CHOICE=$(dialog --clear \
                  --backtitle "$BACKTITLE" \
                  --title "$TITLE" \
                  --menu "$MENU" \
                  $HEIGHT $WIDTH $CHOICE_HEIGHT \
                  "${OPTIONS[@]}" \
                  2>&1 >/dev/tty)

  case $CHOICE in
    1)
      HOST="local"
      ;;
    2)
      HOST="production"
      ;;
    3)
      HOST="vt02"
      ;;
  esac
else
  HOST=$1
fi

curl -k -d "id=$HOST" -X POST https://localhost:3667/config/host
