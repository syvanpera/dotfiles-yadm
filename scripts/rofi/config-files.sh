#!/usr/bin/env sh

config_files="$(dirname $0)/config-files.csv"
# if config file list does not exist, error and exit
[ ! -f "${config_files}" ] && { echo "${config_files} is not a valid file" >&2; exit 1; }

readarray configs < "${config_files}"

config_entry=$(
    for config in "${configs[@]}";{
        echo ${config/,/ }
    }|rofi -dmenu
)

# If user cancelled rofi, exit
[ -z "${config_entry}" ] && exit

config="${config_entry#* }"
expanded="${config//\~/$HOME}"

st -e nvim $expanded
# emacsclient -n $expanded
