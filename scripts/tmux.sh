#!/usr/bin/env bash

# Attach to unattached sessions, or create new if none exist

IFS=$'\n'
UNATTACHED_SESSIONS=$(tmux ls | grep -v '(attached)')

if [[ ! -z ${UNATTACHED_SESSIONS} ]]; then
  for s in ${UNATTACHED_SESSIONS}; do
    sname=${s%%: *}
    exec tmux attach-session -t ${sname}
    echo ${sname}
    break
  done
else
  exec tmux
fi
