#!/usr/bin/env sh

# Colors from gruvbox.nvim
FONT="Fira Code"
BACKGROUND_COLOR=32302f99 # dark0_soft
TEXT_COLOR=f2e5bcff       # light0_soft
SELECTION_COLOR=d65d0eff  # neutral_orange
SELECTION_TEXT=3c3836ff   # dark1

fuzzel --font="${FONT}" \
       --background-color=${BACKGROUND_COLOR} \
       --text-color=${TEXT_COLOR} \
       --selection-color=${SELECTION_COLOR} \
       --selection-text-color=${SELECTION_TEXT}
