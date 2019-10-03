#!/usr/bin/env bash

cur_ctx=$(kubectl config view -o=jsonpath='{.current-context}')
ns="$(kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${cur_ctx}\")].context.namespace}")" || exit_err "error getting current namespace"

echo "${ns}"

