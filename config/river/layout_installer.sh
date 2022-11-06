#!/usr/bin/env zsh

pip install --user pywayland
python -m pywayland.scanner -i /usr/share/wayland/wayland.xml /usr/share/river-protocols/river-layout-v3.xml

