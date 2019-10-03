#!/usr/bin/env bash

# KUBECTX_IGNORE_FZF=1 kubectx

# current_context() {
#     kubectl config view -o=jsonpath='{.current-context}'
# }
#
# get_contexts() {
#     kubectl config get-contexts -o=name | sort -n
# }
#
# CUR_CTX=$(current_context)
# CTX_LIST=$(get_contexts)
#
# # Handle argument.
# if [ -n "$1" ]
# then
#     CUR_CTX=$1
# fi
#
# print $CTX_LIST

function main() {
    local sel_ctx=$(kubectl config get-contexts -o=name | sort -n | rofi -dmenu -p 'Kube context')
    if [[ -n "${sel_ctx/[ ]*\n/}" ]]
    then
        local result=$(kubectl config use-context "$sel_ctx")
        notify-send "$result"
    fi
}

main
