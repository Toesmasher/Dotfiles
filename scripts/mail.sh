#!/usr/bin/env bash

SNAME="mail"

# Decrypt to make sure gpg agent has access
gpg --decrypt ${HOME}/.password-store/email/nicke.gpg > /dev/null 2>&1

tmux has-session -t ${SNAME} > /dev/null 2>&1
if [[ ! $? -eq 0 ]]; then
    if [[ -z "${TMUX}" ]]; then
      tmux new-session -s ${SNAME} -d
    else
      tmux rename-session ${SNAME}
    fi

    # Toesmasher
    tmux rename-window nicke
    tmux send-keys "neomutt" C-M

    # Spambox
    tmux new-window
    tmux rename-window spambox
    tmux send-keys "neomutt -F ${HOME}/.config/neomutt/spambox" C-M

    # Work
    #tmux new-window
    #tmux rename-window consat
    #tmux send-keys "neomutt -F ${HOME}/.config/neomutt/consat" C-M

    # offlineimap
    tmux new-window
    tmux rename-window offlineimap
    tmux send-keys "offlineimap" C-M

    # First box as default
    tmux select-window -t 1
fi

if [[ -z "${TMUX}" ]]; then
  tmux attach -t ${SNAME}
else
  tmux switch -t ${SNAME}
fi
