#!/usr/bin/env bash

DEFAULT_SESSION="default"

if tmux has-session -t ${DEFAULT_SESSION}; then
  tmux attach-session -t ${DEFAULT_SESSION}
else
  tmux new-session -s ${DEFAULT_SESSION}
fi
