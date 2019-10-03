#!/usr/bin/env bash

function main() {
    local sel_ns=$(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}' | sort -n | rofi -dmenu -p 'Kube namespace')
    local cur_ctx=$(kubectl config view -o=jsonpath='{.current-context}')
    if [[ -n "${sel_ns/[ ]*\n/}" ]]
    then
        local result=$(kubectl config set-context "${cur_ctx}" --namespace="${sel_ns}")
        notify-send "$result"
    fi
}

main
