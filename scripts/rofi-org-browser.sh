#!/usr/bin/env bash

EDITOR=xdg-open

CUR_DIR=~/org

# Handle argument.
if [ -n "$@" ]
then
    CUR_DIR="${CUR_DIR}/$@"
fi

# If argument is no directory.
if [ ! -d "${CUR_DIR}" ]
then
    coproc ( ${EDITOR} "${CUR_DIR}" & > /dev/null  2>&1 )
    exit;
fi

# process current dir.
if [ -n "${CUR_DIR}" ]
then
    CUR_DIR=$(readlink -e "${CUR_DIR}")
    pushd "${CUR_DIR}" >/dev/null
fi

# Print formatted listing
ls --group-directories-first --color=never --indicator-style=slash *.org
